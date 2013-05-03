import vim
import vimlib

def jtest_go():
	name = vimlib.GetCurrentFileNameWithoutSuffix()
	return '%s_test.go' % name

def jtest_py():
	name = vimlib.GetCurrentFileNameWithoutSuffix()
	return "%s_test.py" % name
