" How do I reload my config without closing vim??
" :so %
" :PlugInstall
" :PlugUpdate
"
" If you want to uninstall something, remove the line, run ":so %", then run
" ":PlugClean"

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

" Format comments to match line length with gw in visual mode.
set textwidth=80
set formatoptions=acq

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

" [buffer number] followed by filename:
set statusline=[%n]\ %t
" show line#:column# on the right hand side
set statusline+=%=%l:%c

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
"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set paths to homebrew pythons
" let g:python_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

" Dart
let dart_style_guide = 2
" autocmd FileType dart call deoplete#custom#buffer_option('auto_complete', v:false)

" lsc
" set shortmess-=F
" let g:lsc_server_commands = {'dart': 'dart_language_server'}

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/FelikZ/ctrlp-py-matcher'
Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'elmcast/elm-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'flowtype/vim-flow'
Plug 'vim-scripts/loremipsum'
" Plug 'altercation/vim-colors-solarized'
" Plug 'overcache/NeoSolarized'
Plug 'git@github.com:lifepillar/vim-solarized8.git', { 'branch' : 'neovim' }
Plug 'google/vim-searchindex'
Plug 'dart-lang/dart-vim-plugin'
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" I previously tried using lsc, but it makes nvim slow in big files.
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Also do: :CocInstall coc-flutter and coc-snippets
" Then coc I couldn't get fully working, like autocompletion of fn params.
" So here I'm trying lsp:
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select for flutter-tools.
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'

call plug#end()

" Colors!
" Note to self: Seems like on GLinux this has to match the terminal theme...
syntax enable
set background=dark
" colorscheme solarized
" colorscheme solarized8
autocmd vimenter * ++nested colorscheme solarized8

lua <<EOF

require("trouble").setup {
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>N', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
lspconfig['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
lspconfig['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
lspconfig['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require("flutter-tools").setup{
    lsp = {
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "tabedit",
        },
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
          analysisExcludedFolders = {},
        },
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
          analysisExcludedFolders = {},
        },
    },
}

-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip.loaders.from_snipmate").lazy_load({ paths = {"./snips"} })

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

EOF
