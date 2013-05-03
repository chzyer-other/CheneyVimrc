# -*- coding: utf-8 -*-
import vim
import vimlib
import os
import re

def run(buf):
	s, e = getImportLineNoRange()
	cursor = vim.current.window.cursor
	if cursor[0] > s and cursor[0] <= e:
		''' 指针在 import 内 '''
		print "in import"
		return
	
	funcs = getFuncsFromCur()
	makeFuncsName(vim.current.buffer)
	print funcs

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
		
		names[key].append(value)

	print names

def findPackage(packageName):
	''' 根据指定包名来确定相对路径 '''

	s, e = getImportLineNoRange()
	for i in range(s, e):
		pkg = vim.current.buffer[i].strip()

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
	return importStartLine, importEndLine

def openFileAndLine(filePath, lineNo):
	''' 打开指定文件并跳转到行号 '''
	
	vim.command("tabnew %s" % filePath)
	vim.command("%s" % (lineNo + 1))

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
	return r
