import vim
import vimlib
import os

def test_go():
	buf = vim.current.buffer
	i = 0
	while not buf[i].strip().startswith("package"):
		i += 1
	package = buf[i].strip()
	name = package[package.rfind(' ')+1: ]
	if name.endswith('_test'):
		name = name[:-5]
	cmdInstall = 'go test -i ../%s' % name
	cmd = 'go test ../%s' % name
	test_yml_name = ".travis.yml"
	path = vimlib.GetCurrentPath()
	commands = []
	while path.rfind('/') > 0:
		path = path[: path.rfind('/')]
		if not os.path.exists(path + '/' + test_yml_name):
			continue
		commands += test_yml(path + '/' + test_yml_name)
		break
	
	commands.append(cmdInstall)
	commands.append(cmd)
	vim.command('!%s' % ' && '.join(commands))

def test_yml(path):
	f = open(path)
	buf = []
	commands = []
	c = f.readline()
	while len(c) > 0:
		buf.append(c)
		c = f.readline()
	f.close()
	script_start = False
	for i in range(0, len(buf)):
		if script_start:
			if len(buf[i].strip()) <= 0:
				script_start = False
				continue
			b = buf[i].strip()[1:].strip()
			if not b.startswith("export"):
				continue
			commands.append('%s' % b)
		if buf[i].startswith('before_script'):
			script_start = True
			continue
	return commands

def test_py():
	buf = vim.current.buffer
	filename = vimlib.GetCurrentFileNameWithoutSuffix()
	if not filename.endswith("_test") and os.path.exists(filename + "_test.py"):
		filename += "_test"

	commands = []
	test_yml_name = ".travis.yml"
	path = vimlib.GetCurrentPath()
	while path.rfind('/') > 0:
		path = path[: path.rfind('/')]
		if not os.path.exists(path + '/' + test_yml_name):
			continue
		commands += test_yml(path + '/' + test_yml_name)
		break
	
	commands.append('python %s.py' % filename)
	vim.command('!%s' % ' && '.join(commands))
