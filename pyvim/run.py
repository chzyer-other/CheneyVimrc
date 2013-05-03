import vimlib
import vim
import time
import os

def run_cpp(remote, arg, other):
	vim.command('w')
	d = os.path.dirname(vimlib.GetCurrentPath())
	if os.path.exists('%s/Makefile' % d):
		command = "!make"
	if remote:
		path = vimlib.GetCurrentPath()[7: ]
		path = os.path.dirname(path[path.find('/', 2) + 1:])
		command = 'ssh 10.211.55.10 "cd %s && make %s"' % (path, arg)
	command = [command]
	command.extend(other)
	vim.command('!%s' % " && ".join(command))

def run_yml(remote, arg, other):
	vim.command('w')
	buf = vim.current.buffer
	script_start = False
	data = []
	for i in range(0, len(buf)):
		if buf[i].startswith('before_script'):
			script_start = True
			continue
		if buf[i].startswith("script"):
			script_start = True
			continue
		if script_start:
			if len(buf[i].strip()) <= 0:
				script_start = False
				continue
			b = buf[i].strip()[1:].strip()
			data.append(b)
	vim.command("!%s" % " && ".join(data))

def run_js(remote, arg, other):
	vim.command('w')
	vim.command('!node %')

def run_java(remote, arg, other):
	vim.command('w')
	vim.command('!java %')

def run_php(remote, arg, other):
	vim.command('w')
	vim.command('!php %')

def run_py(remote, arg, other):
	if arg is None:
		arg = ""
	vim.command('w')
	command = "python %% %s" % arg
	if remote:
		path = vimlib.GetCurrentPath()[7: ]
		path = path[path.find('/', 2) + 1:]
		command = 'ssh 10.211.55.10 "python %s %s"' % (path, arg)
	
	command = [command]
	command.extend(other)
	vim.command("!%s" % ' && '.join(command))

def run_vimrc(remote, arg, other):
	vim.command('w')
	vim.command('source $MYVIMRC')

def run_html(remote, arg, other):
	vim.command("w")
	vim.command('!open %')
	vim.press('\<Esc>')

def run_go(remote, arg, other):
	try:
		vim.command('w')
	except:
		pass
	file_name = vimlib.GetCurrentFileName()

	isTest = False
	if file_name.find('_test.go') > 0:
		isTest = True

	if vim.current.buffer[0].find('main') < 0:
		isTest = True

	if isTest:
		func, ok = vimlib.LoadLibraryFunc('test', 'go')
		if ok:
			func()
		return

	config_line = -1
	for i in range(0, len(vim.current.buffer)):
		if vim.current.buffer[i].startswith('// run'):
			config_line = i + 1
			break

	if config_line >= 0:
		func, ok = vimlib.AutoLoadLibraryFunc('build')
		func(auto_close=False)
		config_string = vim.current.buffer[config_line][2:].strip()
		vim.command('!./%s %s' % (vimlib.GetCurrentFileNameWithoutSuffix(), config_string))
	else:
		vim.command('!go run %')

def run_sh(remote, arg, other):
	vim.command("w")
	vim.command("!sh %")
