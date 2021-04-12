" How do I reload my config without closing vim??
" :so %
" :PlugInstall
" :PlugUpdate

set number
set ignorecase
set smartcase
set scrolloff=12 " space between cursor and bottom of screen before scroll
let mapleader = ","

" Preserve undo/redo history
set undofile

" 2 space indentation
set tabstop=2
set softtabstop=2
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

" Colors!
syntax enable
set background=light

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
" Use ag for indexing, which is faster. Also, ignore irrelevant files like.
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
" Use ctrlp-py-matcher, which is more accurate.
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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
" let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set paths to homebrew pythons
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Dart
let dart_style_guide = 2
" autocmd FileType dart call deoplete#custom#buffer_option('auto_complete', v:false)

" coc-snippets (installed with :CocInstall coc-snippets)
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher'
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
Plug 'vim-scripts/loremipsum'
Plug 'honza/vim-snippets'
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'dart-lang/dart-vim-plugin'
"Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
" I previously tried using lsc, but it makes nvim slow in big files.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Also do: :CocInstall coc-flutter
Plug 'google/vim-searchindex'

call plug#end()

" Solarized colors
syntax enable
set background=dark
"colorscheme solarized

" Ubuntu Desktop stuff
let g:python3_host_prog='/usr/bin/python3'

" Rust stuff
" setup rust_analyzer LSP (IDE features)
" TODO use lsc or whatever instead of lsp for rust?
" lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
" autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
" autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy
