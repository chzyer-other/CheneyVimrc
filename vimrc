" python 初始化
python << EOF
import imp
import sys
import os
vimlib = imp.load_source('vimlib', '%s/.vim/vimlib.py' % os.environ['HOME'])
EOF

set ts=4 " 设置缩进格式为4个空格
set colorcolumn=80 " 提示单行最为80字符
set guifont=monaco " 设置字体
set autochdir " 自动cd进当前目录
set number " 显示行号
set nobackup
set noswapfile " 不生成swp文件
set clipboard=unnamed " 使用系统的剪贴板
" set noimdisable " normal-mode自动不使用输入法
set hlsearch
source $VIMRUNTIME/menu.vim
set wildmenu

" 配色方案
syntax enable
if(has("gui_running"))
	" 如果在GUI界面运行就不使用主题
	set background=dark
	colorscheme solarized
endif


" 快捷键绑定
map th hxp
map tl xph
map  <D-r> :call Run()<cr>
map  <tab> I<tab><Esc>
map  <S-tab> I<delete><Esc>
map <D->> :<up><cr>
imap <D->> <Esc>:<up><cr>
vmap <tab> I<tab><Esc>
vmap <S-tab> I<delete><Esc>
map ∆ ddp
map ˚ ddkP

vmap ' call AddQuote()
map <BackSpace> X
map <C-h> <BackSpace>
map <S-BackSpace> x
noremap " a""<left>
inoremap <cr> <cr><Esc>i
" inoremap " "<Esc>:call InputQuote()<cr>
noremap _ :call AddScore()<cr>
imap <D-e> <Esc><D-e>
imap <D-r> <Esc>:call Run()<cr>
imap <D-cr> <S-cr>
imap <D-S-cr> <Esc>O
map Ø O
imap Ø <D-S-cr>
imap ø <D-cr>
imap <S-cr> <Esc>o
imap Ï <Esc>F
imap ƒ <Esc>f
imap Î <Esc>lDa
imap <D-0> <Esc>
imap <D-2> <Esc>
vmap <D-0> <Esc>
vmap <D-2> <Esc>
imap ／ /
imap ： :
map <D-[> <C-w>h
map <D-]> <C-w>l
imap <D-[> <Esc><D-[>
imap <D-]> <Esc><D-]>
map <D-k> :call Help()<cr>
map <D-K> :call HelpFinder()<cr>
map <C-s> :call SelectWord()<CR>
map ˙     ^
imap ˙     <Esc>^i
imap Ó    <Esc>Ó
imap Ò    <Esc>Ò
map Ó    I
map Ò    A
map ¬     $
imap ¬     <Esc>$a
imap ® <Esc>l~i
map ® ~
" alt+w
imap ∑     <Esc>ea
imap <D-L> <End>
imap <D-H> <Esc>I
inoremap <D-u> <C-n>
inoremap <D-i> <C-p>
map <D-/> :call ToggleComment()<cr>
imap <D-/> <Esc>:call ToggleComment()<cr>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
inoremap . .<Esc>:call CallCompite()<CR>
map <C-_> :Utu<CR>

map <D-B> :call Build()<cr>
imap <D-B> <Esc><D-B>
map <D-V> :w<cr>:source $MYVIMRC<cr>

map <D-e> :w<cr>:call Test()<cr>
map <D-F> :!open .<cr><cr>
noremap <cr> o
noremap <space> a<space><Esc>h
noremap <S-space> i<space><Esc>l

" 自定义命令
command! Weibo execute ":call Weibo()"
command! Relax execute ":call Relax()"
command! JTest execute ":call JTest()"
command! CPath execute ":call CPath()"
command! Utu   execute ":call Utu()"
command! Clear call Clear()

" 触发器
autocmd VimLeavePre * call SaveSesstion()
autocmd VimEnter * call RestoreSession()
autocmd InsertEnter * call OnInsertEnter()

function! SaveSesstion()
	mksession! ~/.vim/Session.vim
endfunction

function! RestoreSession()
	if argc() == 0 "vim called without arguments
		execute 'source ~/.vim/Session.vim'
	end
endfunction

" autocmd ColorScheme * highlight IntendSpend ctermbg=red guibg=#073642
" match IntendSpend /\t/

set list
set listchars=tab:⋮\ ,nbsp:·,trail:·

" autocmd BufWinLeave * call clearmatches()

" 即时运行
function! Run()
python << EOF
vimlib.Run()
EOF
endfunction

" 即时编译
function! Build()
python << EOF
vimlib.Build()
EOF
endfunction

" 即时测试
function! Test()
python << EOF
vimlib.Test()
EOF
endfunction

function! Weibo()
python << EOF
vimlib.Weibo()
EOF
endfunction

function! Relax()
python << EOF
vimlib.Relax()
EOF
endfunction

function! JTest()
python << EOF
vimlib.JTest()
EOF
endfunction

function! HelpFinder()
python << EOF
vimlib.HelpFinder()
EOF
endfunction

function! Help()
python << EOF
vimlib.Help()
EOF
endfunction

function! ToggleComment()
python << EOF
vimlib.ToggleComment()
EOF
endfunction

function! OnInsertEnter()
python << EOF
vimlib.OnInsertEnter()
EOF
endfunction

function! Nothing()
call feedkeys("\<Esc>")
endfunction

function! InputQuote()
python << EOF
vimlib.InputQuote()
EOF
endfunction

function! Clear()
python << EOF
vimlib.Clear()
EOF
endfunction

function! AddScore()
python << EOF
vimlib.AddScore()
EOF
endfunction

function! AddQuote()
python << EOF
vimlib.AddQuote()
EOF
endfunction

function! CallCompite()
python << EOF
vimlib.CallCompile()
EOF
endfunction

function! SelectWord()
python << EOF
vimlib.SelectWord()
EOF
endfunction

function! CPath()
exec "!pwd | pbcopy"
call feedkeys("\<CR>")
endfunction

function! Utu()
python << EOF
vimlib.Utu()
EOF
endfunction
