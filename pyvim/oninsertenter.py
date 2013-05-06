# -*- coding: utf-8 -*-
import vim
import vimlib

def oninsertenter_py():
	cur = vim.current.window.cursor
	line = vim.current.buffer[cur[0] - 2]

	prefix = line[:line.find(line.strip())]
	if len(prefix) == 0:
		if len(line) > 0 and len(line.strip()) <= 0:
			''' 当上一行只有缩进没有代码时 '''
			prefix = line
		elif not line.strip().endswith(":"):
			''' 当上一行为0缩进并且下一行不需要缩进 '''
			return

	if line.strip().endswith(":"):
		prefix += "\t"

	vim.current.buffer[cur[0] - 1] = prefix
	vim.press("\<Esc>")
	vim.press("A")

def oninsertenter_php():
	oninsertenter_go()

def oninsertenter_c():
	oninsertenter_go()

intent_char = None
def oninsertenter_go():
	global intent_char
	cur = vim.current.window.cursor
	line = vim.current.buffer[cur[0] - 2]
	def isIntent(x):
		global intent_char
		x = x.strip()
		if not intent_char:
			if x.endswith("{"):
				intent_char = ["{", "}"]
				return True
			if x.endswith("("):
				intent_char = ["(", ")"]
				return True
			return False
		else:
			return x.endswith(intent_char[0])

	def isIntentEnd(x):
		if not intent_char:
			return False
		return x.strip().startswith(intent_char[1])

	prefix = line[:line.find(line.strip())]
	if len(prefix) == 0:
		if len(line) > 0 and len(line.strip()) == 0:
			''' 当上一行只有缩进没有代码时 '''
			prefix = line
		elif not isIntent(line):
			return

	if isIntent(line):
		''' 检测是否需要自动完成补全 '''
		l = len(prefix)
		need_fill = 1
		for i in range(cur[0], len(vim.current.buffer)):
			buf = vim.current.buffer[i]
			intent_length = buf.find(buf.strip())
			if l != intent_length:
				continue
				
			if isIntent(buf):
				need_fill += 1
				continue
			if isIntentEnd(buf):
				need_fill -= 1
			if need_fill <= 0:
				break
				
		if need_fill > 0:
			vim.current.buffer.append(prefix + intent_char[1], cur[0])
		prefix += "\t"
		

	vim.current.buffer[cur[0] - 1] = prefix
	vim.press("\<Esc>")
	vim.press("A")
