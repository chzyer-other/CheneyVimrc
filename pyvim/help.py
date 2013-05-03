import vim
import vimlib
import os
import re

def help_go(buf):
	lib = vimlib.LoadLibrary("help_go_util")[0]
	lib.run(buf)

def aa():
	if buf.strip().startswith('"') and buf.strip().endswith('"'):
		return help_go_import(buf.strip()[1: -1])
	if buf.strip().startswith('. "') and buf.strip().endswith('"'):
		return help_go_import(buf.strip()[3: -1])

	res = help_go_getNamesFromCur(buf)
	if len(res) <= 0:
		return
	packagePath = help_go_getpath(help_go_findPackage(res[0]))
	if len(res) == 2:
		line = help_go_findTypeOrVar(packagePath, res[1])

def help_go_findTypeOrVar(path, name):
	files = help_go_getFilesInPath(path)
	for i in files:
		f = open(i, 'r')
		lineNo = 0
		line = f.readline()
		while line:
			ii = len(re.findall(r'type %s|var %s|func %s' % (name, name, name), line)) > 0
			if ii > 0:
				help_go_openFileLine(i, lineNo)
				f.close()
				break
			line = f.readline()
			lineNo += 1
		f.close()

def help_go_openFileLine(path, lineNo):
	vim.command("tabnew %s" % path)
	vim.command("%s" % (lineNo + 1))

def help_go_getFilesInPath(path):
	files = []
	for i in os.walk(path):
		fs = i[2]
		for f in fs:
			if f.endswith('_test.go'):
				continue
			files.append(path + "/" + f)
		break
	return files

def help_go_findPackage(name):
	buffer = vim.current.buffer
	lineCount = len(vim.current.buffer)
	importStartLine = -1
	importEndLine = -1
	for i in range(0, lineCount):
		if vim.current.buffer[i].strip().startswith('import'):
			importStartLine = i + 1
		if importStartLine >= 0 and vim.current.buffer[i].strip().startswith(')'):
			importEndLine = i
			break

	path = ""
	for i in range(importStartLine, importEndLine):
		if buffer[i].startswith(name):
			# alias name
			path = help_go_match_path(buffer[i])
			break

		startIndex = buffer[i].rfind('/')
		if startIndex < 0:
			startIndex = buffer[i].find('"')
		buf = buffer[i][startIndex + 1: buffer[i].rfind('"')]
		if buf == name:
			path = help_go_match_path(buffer[i])
			break

	return path

def help_go_match_path(buf) :
	s = buf.find('"') + 1
	e = buf.rfind('"')
	return buf[s: e]
	
def help_go_getNamesFromCur(buf):
	cur = vim.current.window.cursor[1]
	r = []
	tmp_r = ""
	for i in range(cur, -1, -1):
		if buf[i] == '.':
			if len(tmp_r) > 0:
				r.append(tmp_r)
			tmp_r = ""
			continue
		if buf[i] in " \t&{":
			if len(tmp_r) > 0:
				r.append(tmp_r)
			break
		tmp_r = buf[i] + tmp_r
	
	for i in range(cur + 1, len(buf)):
		if buf[i] in "( \n.,){":
			break
		
		if len(r) > 0:
			r[0] += buf[i]
	r = r[::-1]
	return r
	

def help_go_import(buf):
	pkg_path = help_go_getpath(buf)
	if pkg_path == "":
		print "Unable to find {%s}, did you add it to GOPATH?" % buf
		return
	if buf.startswith("."):
		pkg_path = "%s" % buf
	if buf.rfind('/') > 0:
		buf = buf[buf.rfind("/") + 1:]
	if os.path.exists("%s/%s.go" % (pkg_path, buf)):
		pkg_path = "%s/%s.go" % (pkg_path, buf)
	vim.command(":tabnew %s" % pkg_path)

def help_go_getpath(buf):
	for i in vimlib.GOPATH:
		p = i + "/" + buf
		if os.path.exists(p):
			break
			
		p = i + "/src/" + buf
		if os.path.exists(p):
			break
			
		p = i + "/src/pkg/" + buf
		if os.path.exists(p):
			break
		
		p = ""
	return p
