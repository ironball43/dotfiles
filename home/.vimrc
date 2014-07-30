filetyp off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ruby-matchit'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'

"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
filetype on
filetype indent on
filetype plugin on

"-------------------------------------------------------------------------------
" Basic Setting
"-------------------------------------------------------------------------------
set encoding=utf8
set fileencoding=utf-8
set scrolloff=5
set nowrap
set nobackup
set backupskip=/tmp/*,/private/tmp/*
set autoread
set hidden
set backspace=indent,eol,start
set vb t_vb=
set clipboard=unnamed
set list
set number
set ruler
set nocompatible
set nostartofline

"-------------------------------------------------------------------------------
" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" Command          Normal Mode  Insert Mode   Command Line Mode   Visual Mode
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
"Move in insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>

"Move in normal mode
nnoremap <C-a> <Home>
nnoremap <C-e> <End>

"Change pain
nnoremap <C-j> <C-w>j
noremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <TAB> <C-w>w

"Prefix-key
nnoremap [Prefix] <nop>
nmap <space> [Prefix]

"Vimrc
nnoremap <silent> [Prefix]. :<c-u>edit $MYVIMRC<cr>
nnoremap [Prefix], :<c-u>source $MYVIMRC<cr>]]"

set splitbelow

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"-------------------------------------------------------------------------------
" Tab
"-------------------------------------------------------------------------------
nnoremap [Prefix]t :tabnew<CR>
nnoremap [Prefix]n :tabnext<CR>
nnoremap [Prefix]p :tabprevious<CR>
nnoremap [Prefix]o :tabonly<CR>

"-------------------------------------------------------------------------------
" Search/Replace
"-------------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set nowrapscan
set history=1000
set hlsearch

"-------------------------------------------------------------------------------
" Indent
"-------------------------------------------------------------------------------
set autoindent
set shiftwidth=2

"-------------------------------------------------------------------------------
" Tab wide
"-------------------------------------------------------------------------------
set expandtab
set tabstop=2
set smarttab

"Reset tab wide
au BufNewFile,BufRead * set tabstop=2 shiftwidth=2

"Change tab wide in .html .erb .rb
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2

"-------------------------------------------------------------------------------
" Status
"-------------------------------------------------------------------------------
set laststatus=2
set showcmd

"-------------------------------------------------------------------------------
" syntastic
"-------------------------------------------------------------------------------
"let g:syntastic_mode_map = { 'mode': 'active' }

"-------------------------------------------------------------------------------
" lightline
"-------------------------------------------------------------------------------
set guifont=Consolas:h11
let g:Powerline_symbols = 'fancy'
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'fugitive', 'filename', 'modified' ] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
  \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode'
  \ }
  \ }

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.rb,*.erb,*.html,*.xml,*.yaml,*.json,*.js,*.coffee,*.go call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? "\u2b64" : ''
endfunction

function! MyFilename()
  return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'help\|vimfiler\|gundo' && exists('*fugitive#head')
      let fugitive_head = fugitive#head()
      return strlen(fugitive_head) ? "\u2b60" . fugitive_head : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"-------------------------------------------------------------------------------
" Fold
"-------------------------------------------------------------------------------
set foldmethod=syntax

augroup foldmethod-syntax
  autocmd!
  autocmd InsertEnter * if &l:foldmethod ==# 'syntax'
    \                   |   setlocal foldmethod=manual
    \                   | endif
  autocmd InsertLeave * if &l:foldmethod ==# 'manual'
    \                   |   setlocal foldmethod=syntax
    \                   | endif
augroup END

nnoremap t za

"-------------------------------------------------------------------------------
" Color
"-------------------------------------------------------------------------------
colorscheme  jellybeans

"-------------------------------------------------------------------------------$
" matchit
"-------------------------------------------------------------------------------$
runtime macros/matchit.vim

"-------------------------------------------------------------------------------$
" vimfiler
"-------------------------------------------------------------------------------$
"Replase default exploer with vimfiler
let g:vimfiler_as_default_explorer = 1

"Disable safe mode on startup
let g:vimfiler_safe_mode_by_default = 0

"Open directory of current buffer, such as IDE like view
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -toggle -winwidth=25 -no-quit -auto-cd<CR>

"Change default vimfiler key mapping
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

"-------------------------------------------------------------------------------
" neocomplete
"-------------------------------------------------------------------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use camel_case.
let g:neocomplete#enable_camel_case = 1
" Use underbar_completion.
let g:neocomplete#enable_underbar_completion = 1
" Use auto select
 let g:neocomplete#enable_auto_select = 1
" Set auto completion start length.
let g:neocomplete#auto_completion_start_length = 2
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" For cursor moving in insert mode(Not recommended)
let g:neocomplete#enable_insert_char_pre = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType eruby setlocal omnifunc=htmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"-------------------------------------------------------------------------------
" neosnippet
"-------------------------------------------------------------------------------
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SerTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \"\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>"
  \: "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \"\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"-------------------------------------------------------------------------------$
"vim-surround
"-------------------------------------------------------------------------------$
let g:surround_custom_mapping = {}
let g:surround_custom_mapping._ = {
      \ 'p':  "<pre> \r </pre>",
      \ 'w':  "%w(\r)",
      \ }
let g:surround_custom_mapping.help = {
      \ 'p':  "> \r <",
      \ }
let g:surround_custom_mapping.ruby = {
      \ '-':  "<% \r %>",
      \ '=':  "<%= \r %>",
      \ '9':  "(\r)",
      \ '5':  "%(\r)",
      \ '%':  "%(\r)",
      \ 'w':  "%w(\r)",
      \ '#':  "#{\r}",
      \ '3':  "#{\r}",
      \ 'e':  "begin \r end",
      \ 'E':  "<<EOS \r EOS",
      \ 'i':  "if \1if\1 \r end",
      \ 'u':  "unless \1unless\1 \r end",
      \ 'c':  "class \1class\1 \r end",
      \ 'm':  "module \1module\1 \r end",
      \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
      \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
      \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
      \ }
let g:surround_custom_mapping.javascript = {
      \ 'f':  "function(){ \r }"
      \ }
let g:surround_custom_mapping.lua = {
      \ 'f':  "function(){ \r }"
      \ }
let g:surround_custom_mapping.python = {
      \ 'p':  "print( \r)",
      \ '[':  "[\r]",
      \ }
let g:surround_custom_mapping.vim= {
      \'f':  "function! \r endfunction"
      \ }

"-------------------------------------------------------------------------------$
" vim-rails
"-------------------------------------------------------------------------------$
nnoremap [Prefix]rc :Rcontroller<space>
nnoremap [Prefix]rm :Rmodel<space>
nnoremap [Prefix]rv :Rview<space>

"-------------------------------------------------------------------------------
" endwise.vim
"-------------------------------------------------------------------------------
let g:endwise_no_mappings = 1

"-------------------------------------------------------------------------------
" alpaca_update_tags
"-------------------------------------------------------------------------------
augroup AlpacaTags
  autocmd!
    if exists(':Tags')
    autocmd BufWritePost * TagsUpdate ruby
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
  endif
augroup END

"-------------------------------------------------------------------------------
" gitgutter
"-------------------------------------------------------------------------------
let g:gitgutter_enabled = 1

"-------------------------------------------------------------------------------
" gundo
"-------------------------------------------------------------------------------
let g:gundo_auto_preview = 0

"-------------------------------------------------------------------------------
" indent_guides
"-------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1

"-------------------------------------------------------------------------------
" trailing_whitespace
"-------------------------------------------------------------------------------
autocmd BufWritePre * :FixWhitespace
