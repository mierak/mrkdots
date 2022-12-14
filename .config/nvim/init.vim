call plug#begin('~/.local/share/nvim/plugged')
Plug 'jreybert/vimagit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'frazrepo/vim-rainbow'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'folke/which-key.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'olimorris/onedarkpro.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

lua << EOF
require("onedarkpro").setup {
  colors = {
    onedark = {
      bg = "#1e222a"
	},
  },
  options = {
    transparency = true,
  },
}
EOF
colorscheme onedark

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}
EOF

lua require("nvimtree")
lua require("lsp")

set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=500
set number relativenumber
set title

" Setup GitGutters for dotfiles in home dir
augroup GitGutterDotsGroup
    autocmd!
    autocmd BufWinEnter * if @% =~# '.config\|.local/bin\|.local/share' | let g:gitgutter_git_args = '--git-dir=$HOME/.dots/ --work-tree=$HOME' | else | let g:gitgutter_git_args = ''
augroup END
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
" Rainbow brackets
let g:rainbow_active = 1
lua require'colorizer'.setup()

let mapleader="\<Space>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fh <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope help_tags<cr>
nnoremap <leader>fo <cmd>Telescope treesitter<cr>

" Map tab navigation
map <C-l> <cmd>tabn<cr>
map <C-h> <cmd>tabp<cr>

" Map NerdTree
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
nnoremap <leader>tf <cmd>NvimTreeFocus<cr>

" Enable autocompletion
set wildmode=longest,list,full

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Restart sxhkd when it changes
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !killall sxhkd && sxhkd &

" Reload dunst when it changes
autocmd BufWritePost ~/.config/dunst/dunstrc !killall dunst && dunst &

lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
