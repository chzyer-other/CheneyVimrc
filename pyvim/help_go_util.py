# -*- coding: utf-8 -*-
import vim
import vimlib
import os
import re

def run(m, buf):
	s, e = getImportLineNoRange()
	cursor = vim.current.window.cursor
	if cursor[0] > s and cursor[0] <= e:
		''' 指针在 import 内 '''
		l = vimlib.GetCurrentCursorLine()
		l = l[l.find('"')+1: l.rfind('"')]
		vim.command("%s %s" % (m, getPackageDirPath(l)))
		return
	
	funcs = getFuncsFromCur()
	if len(funcs) == 0:
		return
	path = findPackage(funcs[0])
	if path is None:
		for path, _, filenames in os.walk("."):
			for filename in filenames:
				if not isFileNameMatch(filename):
					continue
				buf = filepathToBuffer(filename)
				openmethod = m
				if filename == vimlib.GetCurrentFileName():
					openmethod = "" 
					filename=""

				ret = findTypeInBuffer(funcs[0], buf, filename)
				if ret is not None:
					openFileAndLine(openmethod, ret[0], ret[1])
					return
				
				ret = findFuncInBuffer("", funcs[0], buf, filename)
				if ret is not None:
					openFileAndLine(openmethod, ret[0], ret[1])
		return
	if len(funcs) == 1:
		''' only package '''
		vim.command("%s %s" % (m, path))
		return
	
	filename, lino = findFuncInPath(path, funcs[1])

	if lino is None:
		filename, lino = findTypeInPath(path, funcs[1])
	
	if lino is None:
		filename, lino = findVar(path, funcs[1])
		
	if lino is not None:
		openFileAndLine(m, filename, lino)
		return

	print path, funcs
	print "can't find reference"

def findVar(fpath, varName):
	for p, _, dirs in os.walk(fpath):
		for d in dirs:
			path = "%s/%s" % (p, d)
			f = open(path, "r")
			data = f.read().split("\n")
			f.close()
			
			vals = makeValName(data)
			line = [i[0] for i in vals if i[1] == varName]
			if len(line) == 1:
				return path, line[0]
			
	return None, None

def isFileNameMatch(filename):
	return filename.endswith(".go")

def filepathToBuffer(filepath):
	f = open(filepath, "r")
	data = f.read().split("\n")
	f.close()
	return data

def makeValName(data):
	rets = []
	r = re.compile(r"var ([\w\d_]+)")
	for i in range(0, len(data)):
		line = data[i]
		if not line.startswith('var'):
			continue
		line = line[4:]
		line = line[: line.find(" ")]
		rets.append((i, line))
	return rets

def findTypeInPath(fpath, typeName):
	for p, _, dirs in os.walk(fpath):
		for d in dirs:
			path = "%s/%s" % (p, d)
			data = filepathToBuffer(path)
			
			ret = findTypeInBuffer(typeName, data, path)
			if ret is None:
				continue
			return ret
	return None, None

def findTypeInBuffer(typeName, data, path=""):
	types = makeTypeName(data)
	line = [i[0] for i in types if i[1] == typeName]
	if len(line) == 1:
		return path, line[0]
	return None

def findFuncInPath(fpath, funcname, rectr=""):
	for p, _, dirs in os.walk(fpath):
		for d in dirs:
			if not isFileNameMatch(d):
				continue
			path = "%s/%s" % (p, d)
			f = open(path, "r")
			data = f.read().split("\n")
			f.close()
			ret = findFuncInBuffer(rectr, funcname, data, path)
			if ret is None:
				continue
			return ret
			 	
	return None, None

def findFuncInBuffer(rectr, funcname, buffer, path=""):
	f = makeFuncsName(buffer)
	if f is None:
		return None
	funcs = f.get(rectr, None)
	if funcs is None:
		return None
	line = [i[0] for i in funcs if i[1] == funcname]
	if len(line) == 1:
		return path, line[0]
	return None

def makeTypeName(data):
	names = []
	for i in range(0, len(data)):
		line = data[i]
		if not line.startswith("type "):
			continue
		
		line = line[5: ]
		if line.find(" ") < 0:
			continue
		name = line[: line.find(" ")]
		names.append((i, name))
	return names

def makeFuncsName(buffer):
	names = {}
	aa = r'func \(([^\)]+)\) ([^\(]+)'
	ab = r'func ([\w_]+)'
	
	for i in range(0, len(buffer)):
		line = buffer[i]
		if not line.startswith('func'):
			continue
		
		ret = re.findall(aa, line)
		if len(ret) == 0:
			ret = re.findall(ab, line)
		
		if isinstance(ret[0], str):
			key = ''
			value = ret[0]
		else:
			key = ret[0][0]
			value = ret[0][1]
		
		if not key in names:
			names[key] = []
		
		names[key].append((i, value))

	return names
	# print names

def findPackage(packageName):
	''' 根据指定包名来确定相对路径 '''

	s, e = getImportLineNoRange()
	for i in range(s, e):
		pkg = vim.current.buffer[i].strip()
		if pkg.startswith('"') and pkg.endswith('"'):
			pkg = pkg[1: -1]
		if pkg.startswith("%s " % packageName):
			return getPackageDirPath(pkg[len(packageName + 1) + 1: -1])
		if pkg.endswith(packageName):
			return getPackageDirPath(pkg)
	return None
			
def getPackageDirPath(import_path):
	for path in vimlib.GOPATH:
		if len(path) > 0:
			path += "/"
		path = ["%s%s" % (path, import_path), "%ssrc/%s" % (path, import_path),
			"%ssrc/pkg/%s" % (path, import_path)]
		for p in path:
			if os.path.exists(p):
				return p
	return None

def getImportLineNoRange():
	''' 得到该文件 import 的行数范围 '''
	
	lineCount = len(vim.current.buffer)
	importStartLine = -1
	importEndLine = -1
	for i in range(0, lineCount):
		if vim.current.buffer[i].strip().startswith('import'):
			importStartLine = i + 1
		if importStartLine >= 0 and vim.current.buffer[i].strip().startswith(')'):
			importEndLine = i
			break
	return importStartLine, importEndLine

def openFileAndLine(method, filePath, lineNo):
	''' 打开指定文件并跳转到行号 '''
	cmd = "%s %s" % (method, filePath)
	if cmd.strip():
		vim.command(cmd)
	vim.command("%s" % (lineNo + 1))
	vim.press("zz")

def getFuncsFromCur():
	''' 将指针所指向的一系列命令进行格式化 '''
	
	buf = vim.current.line
	cur = vim.current.window.cursor[1]
	r = []
	tmp_r = ""
	for i in range(cur, -1, -1):
		if buf[i] == '.':
			if len(tmp_r) > 0:
				r.append(tmp_r)
			tmp_r = ""
			continue
		if buf[i] in " \t&({":
			if len(tmp_r) > 0:
				r.append(tmp_r)
			break
		tmp_r = buf[i] + tmp_r
	
	for i in range(cur + 1, len(buf)):
		if buf[i] in "( \n.,):}{":
			break
		
		if len(r) > 0:
			r[0] += buf[i]
	r = r[::-1]
	for i in range(0, len(r)):
		c = r[i]
		if c.startswith("[]"):
			c = c[2:]
		if c.startswith("*"):
			c = c[1:]
		r[i] = c
	return r
