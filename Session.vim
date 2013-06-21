let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <D-`> x~i
imap <C-`> x~i
imap <D-O> <S-D-CR>
imap <D-BS> 
imap <M-BS> 
imap <M-Down> }
inoremap <D-Down> <C-End>
imap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
imap <D-B> <D-B>
imap <D-/> :call ToggleComment()
inoremap <D-i> 
inoremap <D-u> 
imap <D-H> I
imap <D-L> <End>
imap <D-]> <D-]>
imap <D-[> <D-[>
imap <D-2> 
imap <D-0> 
imap <S-CR> o
imap <S-D-CR> O
imap <D-CR> <S-CR>
imap <D-r> :call Run()
imap <D-e> <D-e>
imap <D->> :<Up>
map  <BS>
nmap 	 I	
vmap 	 I	
omap 	 I	
noremap  o
map  :call SelectWord()
map  :Utu
map  :Utu
noremap   a h
noremap " a""<Left>
vmap ' call AddQuote()
map <C-\-> :Utu
imap ´ A
imap ® l~i
imap ¬ $a
imap Ò Ò
imap Ó Ó
imap Î lDa
imap Ï F
imap ø <D-CR>
imap Ø <S-D-CR>
imap ƒ f
imap ˙ ^i
noremap _ :call AddScore()
imap ‰ x~i
imap ∑ ea
nmap gx <Plug>NetrwBrowseX
imap ： :
imap ／ /
map tl xph
map th hxp
nmap <S-Tab> I<Del>
map <C--> :Utus
map <D-O> s
map <M-Down> }
noremap <D-Down> <C-End>
map <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
noremap <S-Space> i l
map <D-F> :!open .
map <D-e> :w:call Test()
map <D-V> :w:source $MYVIMRC
map <D-B> :call Build()
map <D-/> :call ToggleComment()
map <D-K> :call HelpFinder()
map <D-k> :call Help()
map <D-]> l
map <D-[> h
vmap <D-2> 
vmap <D-0> 
map <S-BS> x
vmap <S-Tab> I<Del>
map <D->> :<Up>
omap <S-Tab> I<Del>
map <D-r> :call Run()
map <BS> X
inoremap  <Home>
inoremap  <Left>
inoremap  <Del>
inoremap  <End>
inoremap  <Right>
inoremap  i
inoremap  <Down>
inoremap  <Up>
inoremap . .:call CallCompite()
map ® ~
map ¬ $
map Ò A
map Ó I
map Ø O
map ˙ ^
map ˚ ddkP
map ∆ ddp
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=monaco
set guitablabel=%M%t
set helplang=en
set hlsearch
set langmenu=none
set listchars=tab:⋮\ ,nbsp:·,trail:·
set nomore
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set noswapfile
set tabstop=4
set termencoding=utf-8
set wildmenu
set window=48
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/msg_client.go
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnquota/quota.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnquota/quota_test.go
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnquota/refresh_api.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnquota/refresh_api_test.go
badd +180 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/refresh_svr.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/refresh_svr_test.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/txc.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/txc_test.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cnc.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cnc_test.go
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/relay/domain_client.go
badd +30 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/iomcm/memcache.go
badd +30 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/msg_client_test.go
badd +67 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/relay/relay.go
badd +46 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/relay/relay_test.go
badd +33 ~/Projects/qiniu/base/biz/src/qbox.us/api/mq/mq_api.go
badd +389 ~/Projects/qiniu/biz/biz/src/qbox.us/mq/mq.go
badd +38 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/txc/txc.go
badd +1 ~/Projects/qiniu/service/service/src/qboxcdnrefresh/qboxcdnrefresh.conf
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnquota/cdnquota.go
badd +55 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnquotacnc/cdnquota_svr.go
badd +13 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnrefresh/cdnclient.go
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnutil/msg_client.go
badd +12 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnrefresh/util.go
badd +51 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cnc/cnc.go
badd +2 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/quota.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/refresh_svr.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/refresh_svr_test.go
badd +3 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/cdnmgr.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/cdnmgr_svr.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnmgr/cdnmgr_svr_test.go
badd +616 /usr/local/go/src/pkg/time/time.go
badd +57 ~/Projects/qiniu/base/biz/src/qbox.us/servend/account/account_interface.go
badd +147 /usr/local/go/src/pkg/strconv/atoi.go
badd +11 ~/Developer/go/test/append.go
badd +38 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnmgr/tongxing.go
badd +47 ~/Projects/qiniu/base/biz/src/qbox.us/domainmatcher/domainmatcher.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/mq_clieng.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/mq_client.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/api/conf/conf.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/msg_client/msg_client.go
badd +176 ~/.vimrc
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/biz/bwlist/bwlist_svr.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/shell/qrsync/test.conf
badd +1028 /usr/local/go/src/pkg/fmt/print.go
badd +9 ~/Developer/go/test/array.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnmgr/cdnmgr_svr.go
badd +688 ~/Projects/golang/go/src/pkg/time/time.go
badd +378 /usr/local/go/src/pkg/strings/strings.go
badd +44 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cdnrefresh.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cdnrefresh_test.go
badd +47 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnrelay/relay.go
badd +33 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnrelay/memcache.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/oldrelay/relay.go
badd +4 ~/Developer/go/test/_.go
badd +1 ~/Developer/go/test/underscore.go
badd +131 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/msg_client.go
badd +256 /usr/local/go/src/pkg/net/http/client.go
badd +19 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnrefresh/cdnrefresh.go
badd +5 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/refresh.go
badd +48 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/refresh_test.go
badd +9 /usr/local/go/src/pkg/errors/errors.go
badd +77 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/cdnmgr_svr.go
badd +17 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/msg_client_test.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh.go
badd +18 /usr/local/go/src/pkg/strconv/itoa.go
badd +89 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/cnc/cnc.go
badd +72 ~/Projects/qiniu/base/com/src/qbox.us/log/logext.go
badd +47 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/cnc/cnc_test.go
badd +74 ~/Projects/qiniu/biz/biz/src/qbox.us/cacheclear/cdnrefresh/cnc/cnc_test.go
badd +36 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/txc/txc.go
badd +95 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/refresh/txc/txc_test.go
badd +495 /usr/local/go/src/pkg/net/url/url.go
badd +129 /usr/local/go/src/pkg/encoding/json/encode.go
badd +63 /usr/local/go/src/pkg/encoding/json/decode.go
badd +1610 /usr/local/go/src/pkg/net/http/server.go
badd +37 ~/Projects/qiniu/base/qiniu/src/github.com/qiniu/rpc/rpc_client.go
badd +196 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota.go
badd +54 ~/Projects/qiniu/base/com/src/qbox.us/xlog/xlog.go
badd +200 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota_test.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quotastat.go
badd +11 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quotastat_test.go
badd +1048 ~/Projects/qiniu/rs/src/qbox.us/rs/rs_svr.go
badd +37 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnquotacnc/cdnquota_test.go
badd +89 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/cdnmgr_svr_test.go
badd +43 ~/Projects/qiniu/service/service/src/qboxcdnrefresh/qboxcdnrefresh.go
badd +1 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnrelay/relay_test.go
badd +43 ~/Projects/qiniu/base/biz/src/qbox.us/domainmatcher/domainmatcher_test.go
badd +12 ~/Projects/qiniu/base/biz/src/qbox.us/auditlog2/auditlog2.go
badd +1 ~/Projects/qiniu/service/service/src/qboxcdnrelay/qboxcdnrelay.go
badd +22 ~/Projects/qiniu/service/service/src/qboxcdnquota/qboxcdnquota.go
badd +5 ~/Projects/qiniu/service/service/src/qboxcdnquota/qboxcdnquota.conf
badd +23 ~/Projects/qiniu/biz/biz/src/qbox.us/mq/mq_svr.go
badd +32 ~/Projects/qiniu/rs/src/qbox.us/rs2/qtbl/qtbl_test.go
badd +127 ~/Projects/qiniu/base/com/src/qbox.us/net/webroute/webroute.go
badd +47 ~/Projects/qiniu/biz/biz/src/qbox.us/mq/mq_svr_test.go
badd +1 ~/Projects/qiniu/service/service/src/qboxmq/qboxmq.conf
badd +31 ~/Projects/qiniu/service/service/src/qboxmq/qboxmq.go
badd +48 ~/Projects/qiniu/base/com/src/qbox.us/net/webroute/README.md
badd +12 ~/Projects/qiniu/base/mockacc/src/qbox.us/account/mockacc.go
badd +104 ~/Projects/qiniu/base/biz/src/qbox.us/mockacc/digest_auth.go
badd +34 ~/Projects/qiniu/base/biz/src/qbox.us/servend/oauth/oauth_servend.go
badd +14 ~/Projects/qiniu/base/biz/src/qbox.us/api/cdnmgr/cdnmgr_api.go
badd +40 ~/Projects/qiniu/new-sdk/go-sdk/src/qiniu/auth/digest/digestAuth.go
badd +89 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnrefresh/relay.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/shell/shutil/cdnmgr/shell_cdnmgr.go
badd +140 ~/Projects/qiniu/base/qiniu/src/github.com/qiniu/api/resumable/io/resumable_api.go
badd +36 ~/Developer/go/test/mutex.go
badd +12 ~/Developer/go/test/func_ret_nil.go
badd +11 ~/Projects/qiniu/base/com/src/qbox.us/net/httputil/httputil.go
badd +82 /usr/local/go/src/pkg/net/http/httptest/server.go
badd +16 ~/Developer/go/test/httptest.go
badd +1 ~/Projects/qiniu/base/com/src/qbox.us/cc/time/day.go
badd +919 /usr/local/go/src/pkg/time/format.go
badd +8 /usr/local/go/src/pkg/time/sleep.go
badd +12 ~/Downloads/a.go
badd +33 /usr/local/go/src/pkg/net/http/httptest/recorder.go
badd +8 ~/Developer/go/test/test_life/a.go
badd +16 ~/Developer/go/test/test_life/a_test.go
badd +18 ~/Developer/go/test/test_life/b_test.go
badd +28 /usr/local/go/src/pkg/net/http/httptest/server_test.go
badd +11 ~/Projects/qiniu/biz/biz/src/qbox.us/mqtest/mqtest.go
badd +48 /usr/local/go/src/pkg/net/http/pprof/pprof.go
badd +30 ~/Projects/qiniu/biz/biz/src/qbox.us/mqtest/mqtest_test.go
badd +35 ~/Projects/qiniu/base/com/src/qbox.us/ts/testing.go
badd +19 ~/Projects/qiniu/base/biz/src/qbox.us/admin_api/mq/mq_admin_api.go
badd +22 ~/Projects/qiniu/base/biz/src/qbox.us/mockacc/baseacc.go
badd +62 ~/Projects/qiniu/base/qiniu/src/github.com/qiniu/mockhttp/mockhttp.go
badd +118 ~/Projects/qiniu/godir/src/github.com/qiniu/api/auth/digest/digest_auth.go
badd +1 /src/code.google.com/p/go.net/html/atom/gen.go
badd +47 ~/Projects/qiniu/io/io/src/qbox.us/up/up_svr.go
badd +49 ~/Projects/qiniu/biz/cfg/src/qbox.us/uc/uc_access.go
badd +65 ~/Projects/qiniu/base/com/src/qbox.us/digest_auth/digest_auth.go
badd +48 ~/Projects/qiniu/io/io/src/qbox.us/up/auth.go
badd +69 ~/Projects/qiniu/base/biz/src/qbox.us/servend/digest_auth/digest_auth_servend.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/mockacc/account.go
badd +48 ~/Projects/qiniu/base/biz/src/qbox.us/mockacc/account_stg.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/mockacc/digest_auth/mock_digest_auth.go
badd +37 ~/Projects/qiniu/biz/biz/src/qbox.us/rsf/rsf_test.go
badd +38 ~/Developer/go/test/json.go
badd +2 ~/Developer/sh/sync_hd.sh
badd +63 ~/Projects/qiniu/new-sdk/android-sdk/src/com/qiniu/resumable/ResumableIO.java
badd +22 ~/Projects/qiniu/godir/src/github.com/qiniu/api/rs/token.go
badd +19 ~/Developer/go/test/upload.go
badd +25 ~/Projects/qiniu/godir/src/github.com/qiniu/api/rs/rs_api.go
badd +29 /usr/local/go/src/pkg/net/http/cgi/child.go
badd +48 ~/Projects/qiniu/base/com/src/qbox.us/net/httputil/httpcli.go
badd +3 ~/.profile
badd +28 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnrelay/domain_client.go
badd +1 ~/Projects/qiniu/base/qiniu/src/github.com/qiniu/httptest/httptest.go
badd +118 ~/Projects/qiniu/base/com/src/qbox.us/cc/httptest/httptest.go
badd +23 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnrefresh/cdnclient_test.go
badd +18 ~/Projects/qiniu/biz/biz/src/qbox.us/cdn_old/cdnrefresh/msg_client.go
badd +23 ~/Projects/qiniu/service/service/src/qboxcdnrelay/qboxcdnrelay.conf
badd +80 /usr/local/go/src/pkg/net/http/request.go
badd +20 ~/Projects/qiniu/base/biz/src/qbox.us/api/uc/uc_api.go
badd +28 ~/Projects/qiniu/service/service/src/qboxcdnmgr/qboxcdnmgr.go
badd +34 ~/Projects/qiniu/service/service/src/qboxcdnmgr/qboxcdnmgr.conf
badd +21 ~/Projects/qiniu/base/biz/src/qbox.us/admin_api/uc/user_center_api.go
badd +13 ~/Projects/qiniu/base/com/src/qbox.us/tstool/uctest/uctest.go
badd +1 ~/Projects/qiniu/base/com/src/qbox.us/tstool/uctest/uctest_test.go
badd +47 ~/Projects/qiniu/base/com/src/qbox.us/tstool/mqtest/mqtest.go
badd +41 ~/Projects/qiniu/base/com/src/qbox.us/tstool/mqtest/mqtest_test.go
badd +47 ~/Projects/qiniu/base/com/src/qbox.us/tstool/httptest/httptest.go
badd +60 ~/Projects/qiniu/base/com/src/qbox.us/tstool/httptest/httptest_test.go
badd +2 ~/Developer/sh/sync_m9.sh
badd +43 ~/Projects/qiniu/new-sdk/python-sdk/qiniu/io.py
badd +34 ~/Projects/qiniu/new-sdk/python-sdk/qiniu/io_test.py
badd +13 ~/Projects/qiniu/new-sdk/python-sdk/qiniu/auth_token.py
badd +48 ~/.vim/vimlib.py
badd +136 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/domainmatcher.go
badd +57 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/domainmatcher_test.go
badd +802 ~/Projects/qiniu/io/io/src/qbox.us/up/up_svr_test.go
badd +174 ~/Projects/qiniu/service/service/src/qboxup/qboxup.go
badd +1 ~/Projects/qiniu/service/service/src/qboxup/qboxup.conf
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/httptest.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/mqtest/mqtest.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/mqtest/mqtest_test.go
badd +213 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/uctest/uctest.go
badd +29 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/uctest/uctest_test.go
badd +9 ~/Developer/go/test/intstring.go
badd +633 ~/Projects/golang/go/src/pkg/path/filepath/path_test.go
badd +76 /usr/local/go/src/pkg/io/ioutil/tempfile.go
badd +365 /usr/local/go/src/pkg/encoding/base64/base64.go
badd +48 ~/Projects/golang/go/src/pkg/crypto/tls/handshake_messages_test.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/servend/account/account_interface_test.go
badd +1 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/httptest_test.go
badd +8 ~/Developer/go/uc.go
badd +4 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/server_req_except.go
badd +47 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/server_req_except_test.go
badd +29 /usr/local/go/src/pkg/net/http/response.go
badd +0 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/response_server.go
badd +0 ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/response_server_test.go
badd +0 ~/Developer/python/test/a.py
badd +23 ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/main.go
args ~/Developer/sh/sync_hd.sh
edit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/cdnmgr_svr_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 83 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 106 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((19 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 02l
wincmd w
argglobal
edit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/cdnmgr_svr.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 260 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
260
normal! 010l
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 83 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 106 + 95) / 190)
tabedit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 84 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 105 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 182 - ((0 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
182
normal! 0
wincmd w
argglobal
edit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 015l
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 84 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 105 + 95) / 190)
tabedit ~/Projects/qiniu/base/com/src/qbox.us/net/httputil/httpcli.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 74 - ((0 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
74
normal! 0
2wincmd w
tabedit ~/Projects/qiniu/base/biz/src/qbox.us/servend/account/account_interface.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 39 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
normal! 05l
2wincmd w
tabedit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 81 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 108 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 168 - ((31 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
168
normal! 0
wincmd w
argglobal
edit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/quota.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 015l
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 81 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 108 + 95) / 190)
tabedit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/mqtest/mqtest_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 90 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 99 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 16 - ((15 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 04l
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
argglobal
edit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/mqtest/mqtest.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 70 - ((29 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
70
normal! 01l
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 90 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 99 + 95) / 190)
tabedit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/httptest_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 78 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 111 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 46 - ((45 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 0
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
argglobal
edit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/httptest.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 015l
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 78 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 111 + 95) / 190)
tabedit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/response_server_test.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 96 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 93 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 0
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
argglobal
edit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/httptest/response_server.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 28 - ((27 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 016l
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 96 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 93 + 95) / 190)
tabedit ~/Projects/qiniu/base/biz/src/qbox.us/tstool/uctest/uctest.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 46 - ((45 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 0
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
2wincmd w
tabedit ~/Projects/qiniu/service/service/src/qboxcdnmgr/qboxcdnmgr.go
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 25 - ((12 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
25
normal! 0
lcd ~/Projects/qiniu/base/biz/src/qbox.us/servend
2wincmd w
tabedit ~/Projects/qiniu/service/service/src/qboxcdnmgr/qboxcdnmgr.go
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 84 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 105 + 95) / 190)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 57 - ((36 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
57
normal! 0
lcd ~/Projects/qiniu/service/service/src
wincmd w
argglobal
edit ~/Projects/qiniu/biz/biz/src/qbox.us/cdnmgr/cdnmgr_svr_test.go
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'go'
setlocal filetype=go
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal nomacmeta
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'go'
setlocal syntax=go
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 47 - ((46 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 01l
lcd ~/Projects/qiniu/service/service/src
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 84 + 95) / 190)
exe 'vert 2resize ' . ((&columns * 105 + 95) / 190)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
