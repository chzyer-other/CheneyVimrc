import vim
import urllib
import re

def main():
	vim.command('tabnew')
	buf = vim.current.buffer
	o = urllib.urlopen('http://qiushibaike.com')
	a = o.read()
	a = re.findall(r'div class="content[^>]+>([^<]+)<', a)
	for i in a:
		i = i.strip()
		if len(i) <= 1:
			continue
		buf.append(i)
		buf.append('-'*10)
		buf.append('\n')
	
