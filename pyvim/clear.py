import vim
import vimlib

def clear_go():
	line = vim.current.line
	cursor = vim.current.window.cursor
	start_del, end_del = -1, -1
	intent = -1
	for i in range(cursor[0], 0, -1):
		new_line = vim.current.buffer[i]
		if new_line.strip().startswith('func'):
			start_del = i + 2
			intent = new_line.find(new_line.strip())
			break
	for i in range(cursor[0], len(vim.current.buffer)):
		new_line = vim.current.buffer[i]
		new_intent = new_line.find(new_line.strip())
		if new_line.strip().endswith('}') and new_intent == intent:
			end_del = i
			break
	
	if start_del < 0 or end_del < 0 :
		print "error", start_del, end_del
		return
	
	time = end_del - start_del + 1
	for i in range(0, time):
		del vim.current.buffer[start_del - 1]
	
	vim.current.buffer.append('\t' * intent, start_del - 1)
	vim.press("A")
