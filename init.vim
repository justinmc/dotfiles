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
set smartindent
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
set formatoptions=q

" Remap escape
imap jk <Esc>

" react to the mouse as well
set mouse=a

" eslint. Justin disabled because slowing down saving non-JS files.
" let g:neomake_javascript_enabled_makers = ['eslint']
" autocmd! BufWritePost,BufEnter * Neomake
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

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-plug
call plug#begin('~/.vim/plugged')

" use vim-jsx on .js files too
let g:jsx_ext_required = 0

" elm syntax highlighting
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" flow syntax highlighting
let g:javascript_plugin_flow = 1

" Set paths to homebrew pythons
" let g:python_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'

" Dart
let dart_style_guide = 2

" lsc
" set shortmess-=F
" let g:lsc_server_commands = {'dart': 'dart_language_server'}

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" Justin disabled neomake because it's slowing down saving non-JS files.
" Plug 'https://github.com/neomake/neomake.git'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/hail2u/vim-css3-syntax.git'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'elmcast/elm-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'flowtype/vim-flow'
Plug 'vim-scripts/loremipsum'
Plug 'maxmx03/solarized.nvim'
Plug 'google/vim-searchindex'
Plug 'lukas-reineke/indent-blankline.nvim'

" Removed dart-vim-plugin because syntax highlighting is now done with tree-sitter.
" Plug 'dart-lang/dart-vim-plugin'
if has('nvim')
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" I previously tried using lsc, but it makes nvim slow in big files.
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Also do: :CocInstall coc-flutter and coc-snippets
" Then coc I couldn't get fully working, like autocompletion of fn params.
" So here I'm trying lsp:
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
" Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
" Plug 'mfussenegger/nvim-jdtls'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select for flutter-tools.
" TODO(justinmc): Completion is often very slow in practice. This seems to be
" the completion plugin of choice, so it's probably my config's fault.
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
" Justin - This is suspcious for performance problems, so I'm disabling it for
" now. However, I'm totally not convinced that it is the problem.
" Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

" Colors!
" Note to self: Seems like on GLinux this has to match the terminal theme...
syntax enable
set termguicolors
set background=dark
colorscheme solarized

lua <<EOF

-- local config = {
--     cmd = {'/usr/local/google/home/jmccandless/bin/jdt-language-server-1.9.0-202203031534/bin/jdtls'},
--     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- }
-- Justin: This was starting even when opening dart files, so I disabled for now.
-- require('jdtls').start_or_attach(config)

require('gitsigns').setup()

require("trouble").setup {
}

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-p>"] = require("telescope.actions").cycle_history_next,
        ["<A-Down>"] = require("telescope.actions").cycle_history_next,
        ["<A-Up>"] = require("telescope.actions").cycle_history_prev
      }
    }
  },
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

--   nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
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
lspconfig['ts_ls'].setup{
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
--[[
lspconfig['dartls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
]]--
require("flutter-tools").setup{
    -- TODO(justinmc): Is there anything you can do to improve performance here?
    lsp = {
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
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require 'cmp'
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None,
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
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
  -- Justin - I'm not clear if or how much this stuff helps performance.
  -- I think that completion can't happen if the flutter linter thing hasn't
  -- finished running. Maybe that's more to do with my problems?
  performance = {
    async_budget = 100,
    fetching_timeout = 100,
    throttle = 50,
    debounce = 50,
  },
}

require('ibl').setup()
require('which-key').setup()
require('nvim-autopairs').setup()
require('nvim-treesitter.configs').setup({
  indent = { enable = true },
})

EOF
