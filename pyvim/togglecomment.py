import vim
import vimlib
import re

def togglecomment_js():
	togglecomment_module("//")

def togglecomment_php():
	togglecomment_module("//")

def togglecomment_go():
	togglecomment_module("//")

def togglecomment_sh():
	togglecomment_module("#")

def togglecomment_py():
	togglecomment_module("#")

def togglecomment_module(ch):
	buf = vim.current.line

	if buf.strip()[:len(ch)] == ch:
		intentLength = buf.find(ch)
		vimlib.SetCurrentLine(buf[:intentLength] + buf.strip()[len(ch):].strip())
		return

	intentLength = buf.find(buf.strip())
	vimlib.SetCurrentLine("%s%s %s" % (buf[:intentLength], ch, buf[intentLength:]))
