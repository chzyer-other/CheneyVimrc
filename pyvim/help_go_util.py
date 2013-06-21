# -*- coding: utf-8 -*-
import vim
import vimlib
import os
import re

def run(m, buf):
	cursor = vim.current.window.cursor
	if cursor[0]-1 in getNodeLineRange("import"):
		''' 指针在 import 内 '''
		l = vimlib.GetCurrentCursorLine()
		l = l[l.find('"')+1: l.rfind('"')]
		package_path = getPackageDirPath(l)
		if package_path is None:
			print "package path not found"
			return
		# vim.press("#")
		vim.command("%s %s" % (m, package_path))
		return

	funcs = getFuncsFromCur()
	ret = findInExec(m, funcs)
	if ret is None:
		print "con't find reference"
		return

	# vim.press("#")
	m, filename, lino = ret
	openFileAndLine(m, filename, lino, funcs[-1])

def findInExec(m, funcs):
	cursor = vim.current.window.cursor
	curbuf = vim.current.buffer

	if len(funcs) == 0:
		return
	path = findPackage(funcs[0])
	if path is None:
		ret = findInCurrentPackage(m, funcs)
		if ret:
			return ret
		
		ret = getTypeOfVarOrFuncArgs(funcs[0])
		if not isinstance(ret, list):
			ret = [ret]
		typenames = ret + funcs[1:]
		ret = findInExec(m, typenames)
		return ret

	if len(funcs) == 1:
		''' only package '''
		return m, path, None

	ret = findAllFuncs(path, funcs[1: ])
	if ret is not None:
		# return
		return [m] + ret
	
def findAllFuncs(path, funcs):
	ret = None
	if len(funcs) == 2:
		ret = findAllInPath(path, ".".join(funcs), ["tfunc"])
		if ret is None:
			ret = findAllInPath(path, funcs[0])
			funcname = decodeObject(funcs[0], ret[0], ret[1], ret[2])
			if funcname is None:
				return list(ret)[:2]
			newfuncname = findAllInPath(path, funcname)
			newTypename = getTypeFromFuncReturn(newfuncname[0], newfuncname[1])
			if len(newTypename) > 0:
				funcs[0] = newTypename[0]
				ret = findAllFuncs(path, funcs)
	elif len(funcs) == 1:
		ret = findAllInPath(path, funcs[0])
	else:
		r = findAllFuncs(path, funcs[:2])
		# stat()
		# openFileAndLine("tabnew", r[0], r[1])
		# print r, funcs
		if ret is not None:
			# print decodeObject(funcs[0], ret[0], ret[1], ret[2])
			pass

	if ret is not None:
		return list(ret[:2])

	print path, funcs

def findAllInPath(path, name, do=["tfunc", "func", "type", "var"]):
	lino = None
	if name.find(".") > 0 and "tfunc" in do:
		typename = "tfunc"
		name = name.split(".")
		filename, lino = findFuncInPath(path, name[1], name[0])
	
	if lino is None and "func" in do:
		typename = "func"
		filename, lino = findFuncInPath(path, name)

	if lino is None and "type" in do:
		typename = "type"
		filename, lino = findTypeInPath(path, name)

	if lino is None and "var" in do:
		typename = "var"
		filename, lino = findVar(path, name)

	if lino is not None:
		return filename, lino, typename

def decodeObject(name, path, line, typename):
	f = open(path, "r")
	data = f.read().split("\n")[line]
	f.close()
	if typename == "var":
		data = data[data.find("=")+1:data.rfind("(")].strip()
		return data
	if typename == "func":
		return getTypeFromFuncReturn(path, line)
	
	if typename == "tfunc":
		return getTypeFromFuncReturn(path, line)
	
	print "undo decodeObject", typename

def getTypeOfVarOrFuncArgs(argname, curbuf=vim.current.buffer, eofpackage=True):
	cursor = vim.current.window.cursor
	
	''' recvr '''
	func_arg = findInBuffer(r"func\s+\(%s\s\**(?:\[\])*(.+?)\)" % (argname), curbuf[ :cursor[0]-1])
	if len(func_arg) > 0:
		return func_arg[-1]
	
	''' 函数参数 '''
	func_arg = findInBuffer(r"func.+?%s[^\w]+(\w+)" % (argname), curbuf[ :cursor[0]-1])
	if len(func_arg) > 0:
		return func_arg[-1]
	
	''' 变量 '''
	allvar = findInBuffer(r"(.*?\b%s\b[^=]*?)(:?)=([^\(]+)" % (argname), curbuf[ :cursor[0]-1])
	if len(allvar) > 0:
		var = allvar[-1]
		
		argindex = 0
		for i in var[0].split(","):
			if i.strip() == argname:
				break
			argindex += 1
		args = var[2].strip().split('.')
		
		# print cursor[0]
		if not findPackage(args[0]):
			for i, b in enumerate(curbuf):
				if b.startswith("%s%s=%s" % var):
					break
			if i > 0:
				if eofpackage:
					data = getTypeOfVarOrFuncArgs(args[0], curbuf[:i]) + args[1:]
					if findPackage(data[0]):
						path = findPackage(data[0])
						r = findAllInPath(path, data[-1])
						t = decodeObject(data[-1], r[0], r[1], r[2])
						if len(t) > argindex - 1:
							return [data[0], t[argindex]]
					return data
				return i
		else:
			path = findPackage(args[0])
			ret = findAllInPath(path, args[1])
			data = decodeObject(args[-1], ret[0], ret[1], ret[2])
			if len(data) > argindex - 1:
				return [args[0], data[argindex]]
			return args


	
	return None

def getTypeFromFuncReturn(path, line):
	f = open(path, "r")
	data = f.read().split("\n")
	f.close()
	c = data[line]
	i = 0
	while c.find("{") < 0:
		i += 1
		c += data[line+i]
		if line+i+1 > len(data):
			return []
	cm = re.findall(r"func\s*(?:\([^\)]+\))?[\w_\d]+\([^\)]+\)", c)
	if len(cm) > 0:
		c = c[len(cm[0]): c.rfind("{")].strip()
	if c.rfind("(") >= 0:
		c = c[c.rfind("(")+1:c.rfind(")")]
	c = c.split(",")
	ret = []
	for ic in c:
		ic = ic.strip()
		if ic.rfind(" ") > 0:
			ic = ic[ic.rfind(" ") + 1: ]
		ic = re.sub(r"^(?:\*|\[\])", "", ic)
		ret.append(ic)
	return ret

def findInCurrentPackage(m, funcs):
	for path, _, filenames in os.walk("."):
		for filename in filenames:
			if not isFileNameMatch('%s/%s' % (path, filename)):
				continue
			buf = filepathToBuffer('%s/%s' % (path, filename))
			openmethod = m
			if filename == vimlib.GetCurrentFileName():
				openmethod = ""
				filename=""

			if len(funcs) > 1:
				ret = findFuncInBuffer(funcs[0], funcs[1], buf, filename)
				if ret is not None:
					return openmethod, ret[0], ret[1]

			if len(funcs) == 1:
				ret = findTypeInBuffer(funcs[0], buf, filename)
				if ret is not None:
					return openmethod, ret[0], ret[1]

				ret = findFuncInBuffer("", funcs[0], buf, filename)
				if ret is not None:
					return openmethod, ret[0], ret[1]

	return None

def findInBuffer(find, buf):
	rets = []
	re_f = re.compile(find)
	buf = "\n".join(buf)
	ret = re_f.findall(buf)
	return ret

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
	aa = r'func \(.+?\s+(?:\*|\[\])*([^\)]+)\) ([^\(]+)'
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
	for pkg in getNodeStrings("import"):
		if pkg.startswith('"') and pkg.endswith('"'):
			pkg = pkg[1: -1]
		if pkg.startswith("%s " % packageName):
			return getPackageDirPath(pkg[pkg.find('"')+1: -1])
		if pkg == packageName or pkg.endswith("/"+packageName):
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

def getNodeStrings(node="import", buf=vim.current.buffer):
	ret = getNodeLineRange(node, 0)
	r = []
	for i in ret:
		b = buf[i].strip()
		if b.startswith(node) and b.endswith(")"):
			b = b[b.find("(")+1: -1]
		r.append(b)
	return r

def getNodeLineRange(node, start=0, buf=vim.current.buffer):
	''' 得到该文件 import 的行数范围 '''

	lineCount = len(buf)
	importStartLine = -1
	importEndLine = -1
	for i in range(start, lineCount):
		if buf[i].strip().startswith(node):
			if buf[i].strip().endswith(")") and len(buf[i].strip()) > len(node)+2:
				importStartLine = i
				importEndLine = i+1
				break
			importStartLine = i + 1
		if importStartLine >= 0 and buf[i].strip().startswith(')'):
			importEndLine = i
			break
	if importStartLine == -1 or importEndLine == -1:
		return []

	newret = getNodeLineRange(node, importEndLine)
	newret = range(importStartLine, importEndLine) + newret
	if len(newret) == 0:
		return newret
	return newret

def openFileAndLine(method, filePath, lineNo, funcname=None):
	''' 打开指定文件并跳转到行号 '''
	cmd = "%s %s" % (method, filePath)
	if cmd.strip():
		vim.command(cmd)
	if lineNo is not None:
		vim.command("%s" % (lineNo + 1))
	vim.press("zz")
	
	l = vimlib.GetCurrentCursorLine()
	if funcname is not None:
		if l.find(funcname) >= 0:
			cur = vim.current.window.cursor
			vim.current.window.cursor = (cur[0], l.find(funcname))

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
		if buf[i] in " \t&({!":
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
