" Ejecutar en NodeJS
nmap <C-x> :!node %<CR> 

set number
set mouse=a
set numberwidth=2
set clipboard=unnamed
syntax on
set showcmd
set ruler
set encoding=utf8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set smarttab
set cindent
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'SirVer/ultisnips'
call plug#end()

let g:indentLine_color_term=239
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

colorscheme gruvbox
let g:gruvbox_contrats_dark="hard"
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let NERDTreeQuitOnOpen=1
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:gruvbox_invert_selection='0'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:vim_be_good_log_file = 1

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

let mapleader=" "

nmap <Leader>as :NERDTreeFind<CR>

nmap <C-z> <Plug>(easymotion-s2)
nmap <C-p> :GFiles<CR>
nmap <C-b> :GBranches<CR>

nmap <C-s> :w<CR>
nmap <Leader>q :q<CR>

" Ejecutar Instalar Plugins
nmap <Leader>i :PlugInstall<CR>

" CoC config
let g:coc_start_at_startup=1
let g:coc_global_extensions=[
      \ 'coc-actions',
      \ 'coc-angular',
      \ 'coc-browser',
      \ 'coc-calc',
      \ 'coc-cfn-lint',
      \ 'coc-clangd',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-flutter',
      \ 'coc-fzf-preview',
      \ 'coc-git',
      \ 'coc-gist',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-omnisharp',
      \ 'coc-phpactor',
      \ 'coc-phpls',
      \ 'coc-python',
      \ 'coc-stylelintplus',
      \ 'coc-stylelint',
      \ 'coc-sourcekit',
      \ 'coc-sql',
      \ 'coc-template',
      \ 'coc-tsserver',
      \ 'coc-xml',
      \ 'coc-yaml',
      \]

" Comandos Flutter
nnoremap <Leader>fs :FlutterRun<CR>
nnoremap <Leader>fe :FlutterQuit<CR>
nnoremap <Leader>fr :FlutterHotRelead<CR>
nnoremap <Leader>ft :FlutterHotRestart<CR>
nnoremap <Leader>fd :FlutterVisualDebug<CR>
