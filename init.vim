" OMG How do I reload my config without closing vim??
" :so ~/.config/nvim/init.vim
" :PlugInstall

set number
set ignorecase
set smartcase
set scrolloff=12 " space between cursor and bottom of screen before scroll
let mapleader = ","

" Preserve undo/redo history
set undofile

" 2 space indentation
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" character limit column
highlight ColorColumn ctermbg=0
set colorcolumn=80

" Easy split switching
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Copy to system clipboard by hitting leader first
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard by hitting leader first
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Remap escape
imap jk <Esc>

" react to the mouse as well
set mouse=a

" eslint
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake
nmap <Leader>n :lnext<CR> " next error/warning
nmap <Leader>N :lprev<CR> " previous error/warning

" vim-javascript
let g:javascript_plugin_jsdoc = 1 " jsdoc syntax highlighting

" disable folding
set nofoldenable

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" vim-plug
call plug#begin('~/.vim/plugged')

" call greppage on the current line
nnoremap <leader>kk :call grepg#RunGrepGCommand(getline('.'))<CR>

" use vim-jsx on .js files too
let g:jsx_ext_required = 0

" elm syntax highlighting
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" flow syntax highlighting
let g:javascript_plugin_flow = 1

" deoplete code completion
let g:deoplete#enable_at_startup = 1

" Set paths to homebrew pythons
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
Plug 'mxw/vim-jsx'
Plug 'evidanary/grepg.vim'
Plug 'https://github.com/yaymukund/vim-haxe.git'
Plug 'tpope/vim-fugitive'
Plug 'elmcast/elm-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'flowtype/vim-flow'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'dart-lang/dart-vim-plugin'

call plug#end()
