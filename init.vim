set number

" character limit column
highlight ColorColumn ctermbg=0
set colorcolumn=100

" Easy split switching
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" eslint
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake

" disable folding
set nofoldenable

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'

call plug#end()
