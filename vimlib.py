# -*- coding: utf-8 -*-
import os

for i in os.environ:
	print i, os.environ[i]
import vim
import imp
home = os.environ['HOME']

GOROOT = "/usr/local/go"
GOPATH = os.environ.get("GOPATH", "").split(":")
GOPATH.append(GOROOT)

def Utu():
	# 将在Upper 和 Underscore间转换
	spt = ". ()\t\r\n,+-*.[]{}<>"
	pos = vim.current.window.cursor[1]
	line = GetCurrentCursorLineAll()
	start, end = -1, -1
	for i in range(pos, 0, -1):
		if line[i] in spt:
			start = i
			break
	if start < 0:
		start = 0
	for i in range(pos+1, len(line)):
		if line[i] in spt:
			end = i
			break
		if i==len(line)-1:
			end = i+1
			break
	def mode1():
		upper = range(ord('A'), ord('Z'))
		# af_udfdf adfdJdfd fdf_cdf
		result = line[:start+1]
		if ord(line[start+1]) in upper:
			result += chr(ord(line[start+1])+32)
		else:
			result += line[start+1]
		
		for i in line[start+2: end]:
			if ord(i) in upper:
				i = "_" + chr(ord(i)+32)
			result += i
		result += line[end:]
		return result
	
	def mode2():
		result = line[:start+2]
		cont = False
		idx = start+2
		for i in line[start+2: end]:
			idx+=1
			if cont:
				cont = False
				continue
			if i == "_":
				result += chr(ord(line[idx])-32)
				cont = True
				continue
			result += i
		result += line[end:]
		return result
	
	func = mode1
	if line[start+1: end].find("_") > 0:
		func = mode2
	vim.current.buffer[vim.current.window.cursor[0]-1] = func()

def SelectWord():
	spt = ". ()\t\r\n,+-*."
	pos = vim.current.window.cursor[1]
	line = GetCurrentCursorLineAll()
	start, end = -1, -1
	for i in range(pos, 0, -1):
		if line[i] in spt:
			start = i
			break
	if start < 0:
		start = 0
	for i in range(pos+1, len(line)):
		if line[i] in spt:
			end = i
			break
			
		if i==len(line)-1:
			end = i+1
			break
	vim.current.window.cursor = (vim.current.window.cursor[0], start+1)
	vim.press("v%sl" % (end-start-2))
	

def CallCompile():
	func, ok = AutoLoadLibraryFunc("callcompile")
	if not ok:
		vim.press("a")
		return
	func()

def AddQuote():
	print vim.current.windows.cursor
	vim.current.buffer[1] = 'd'

def AddScore():
	func, ok = AutoLoadLibraryFunc("addscore")
	if not ok:
		return
	func()

def Clear():
	func, ok = AutoLoadLibraryFunc("clear")
	if not ok :
		print "success"
		return
	func()

def InputQuote():
	cur = vim.current.window.cursor
	line = vim.current.line
	if cur[1] < len(line) - 1:
		vim.press("a")
		return
	SetCurrentLine(line[:cur[1]] + '"' + line[cur[1]:])
	vim.press("a")

def OnInsertEnter():
	line = vim.current.line
	if len(line) > 0:
		return
	func, ok = AutoLoadLibraryFunc('oninsertenter')
	if not ok:
		return
	func()

def OnEnterPress():
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('onenterpress', suffix)
	if not ok:
		return
	func()

def ToggleComment():
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('togglecomment', suffix)
	if not ok:
		error("filetype of '%s' is not supported for togglecomment" % suffix)
		return
	func()

def Run():
	''' run the script '''
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('run', suffix)
	if not ok:
		error("filetype of '%s' is not supported for run" % suffix)
		return
	arg, other = GetRunArgument()
	func(GetCurrentPath().startswith("/Volumes/"), arg, other)

def Help(method="tabnew"):
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('help', suffix)
	if not ok:
		error("filetype of '%s' is not supported for help" % suffix)
		return
	func(method, GetCurrentCursorLineAll())

def HelpFinder():
	Help("!open")
	vim.press("\<Esc>")

def Build():
	''' build the file '''
	func, ok = AutoLoadLibraryFunc('build')
	if not ok:
		return
	func()

def Test():
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('test', suffix)
	if not ok:
		error('Filetype of "%s" is not supported for test' % suffix)
		return
	func()

def Weibo():
	print 'weibo'

def JTest():
	''' vs test file '''
	suffix = GetCurrentFileSuffix()
	func, ok = LoadLibraryFunc('jtest', suffix)
	if not ok:
		error("can't found test file")
		return
	path = func()
	vim.command('vs %s' % path)

def Relax():
	pkg, _ = LoadLibrary('relax')
	pkg.main()

def error(o):
	print "ERROR: %s" % o

def GetRunArgument():
	arg = ""
	other = []
	for i in vim.current.buffer:
		if i.startswith("# @arg:"):
			arg = i[7: ]
			continue

		if i.startswith("// @arg:"):
			arg = i[8: ]
			continue

		if i.startswith("// @&&:"):
			other.append(i[7: ].strip())
			continue

		if i.startswith("# @&&:"):
			other.append(i[6: ].strip())
			continue
	return arg.strip(), other

def GetCurrentPath():
	return vim.current.buffer.name

def GetCurrentFileName():
	path = GetCurrentPath()
	return path[path.rfind('/') + 1:]

def GetCurrentFileNameWithoutSuffix():
	name = GetCurrentFileName()
	return name[:name.rfind('.')]

def GetCurrentFileSuffix():
	file_name = GetCurrentFileName()
	if file_name == None:
		return None
	return file_name[file_name.rfind('.') + 1:]

def LoadLibrary(file_name):
	try:
		tpl = '%s/.vim/pyvim/%s.py'
		obj = imp.load_source(file_name, tpl % (home, file_name))
		return obj, True
	except IOError:
		return None, False

def LoadLibraryFunc(pkg_name, func_name):
	lib, ok = LoadLibrary(pkg_name)
	if not ok:
		return None, False
	try:
		func = lib.__dict__['%s_%s' % (pkg_name, func_name)]
		return func, True
	except KeyError:
		return None, False

def AutoLoadLibraryFunc(pkg_name):
	suffix = GetCurrentFileSuffix()
	if suffix == None:
		return None, False
	return LoadLibraryFunc(pkg_name, suffix)

def GetCurrentCursorLine():
	return GetCurrentCursorLineAll().strip()

def GetCurrentCursorLineAll():
	return vim.current.line

def SetCurrentLine(string):
	line = vim.current.window.cursor[0]
	vim.current.buffer[line - 1] = string

def GetCurrentLineNo():
	return vim.current.window.cursor[0]

def press(string):
	vim.command('call feedkeys("%s")' % string)

vim.press = press
vim.Press = press

