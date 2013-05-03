import vim
import vimlib

def build_go(auto_close=True):
	vim.command('!go build %')
	# if auto_close:
		# vim.press('<cr>')
