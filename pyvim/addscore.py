import vim
import vimlib
import os

def addscore_go():
	s = "// --------------------------------------------------------------------"
	vim.current.buffer.append(s, vimlib.GetCurrentLineNo())

def addscore_py():
	s = "# ----------------------------------------------------------"
	vim.current.buffer.append(s, vimlib.GetCurrentLineNo())

def addscore_sh():
	addscore_py()
