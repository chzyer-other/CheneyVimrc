import vim
import vimlib

def onenterpress_go():
	line = vim.current.line
	cur = vim.current.window.cursor

def onenterpress_py():
	line = vim.current.line
	cur = vim.current.window.cursor
	l = vim.current.window.cursor[0]
	buffer = vim.current.line
	prefix = buffer[:buffer.find(buffer.strip())]
	if line.strip().endswith(":"):
		prefix += "\t"

	vim.current.buffer.append(prefix, l)
	vim.current.window.cursor = (cur[0] + 1, l + 1)
	vim.press("a")
