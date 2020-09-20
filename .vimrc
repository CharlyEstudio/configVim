set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set noshowmode

" Others
set nohlsearch
set hidden
set softtabstop=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set cmdheight=2

call plug#begin('~/.vim/plugged')
" AirLine => Footer
Plug 'vim-airline/vim-airline'

" Desinstalar estas dependencias en terminal, para que funcione vim-devicons
" brew tap homebrew/cask-fonts
" brew cask install font-hack-nerd-font

" Flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" Git DashBoard
Plug 'junegunn/vim-github-dashboard'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" Config ParamagicDev in GitHub
" https://github.com/prettier/vim-prettier/issues/214

" ColorSchema
" Plug 'flazz/vim-colorschemes'
" Plug 'dracula/vim'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'

" Identar tabs con lineas
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Color Parentesís
Plug 'kien/rainbow_parentheses.vim'
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

" Tpope plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'

" Javascript / React
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jxnblk/vim-mdx-js'

" html / csss
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/0.x'
      \}

" Markdown previewing, ensure you have nodejs and yarn
Plug 'iamcco/markdown-preview.vim', {'do': 'cd app & yarn install'}

" Snippets
Plug 'SirVer/ultisnips'

" Linting
Plug 'dense-analysis/ale'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" CoC recommended config
let g:coc_start_at_startup = 1
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-ultisnips',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-tag',
      \ 'coc-omni',
      \ 'coc-syntax',
      \ 'coc-yaml',
      \ 'coc-solargraph',
      \ 'coc-phpls',
      \ 'coc-html',
      \ 'coc-tailwindcss',
      \ 'coc-markdownlint',
      \ 'coc-git'
      \]

" Autocompletion Lua
Plug 'nvim-lua/completion-nvim'

Plug 'tweekmonster/gofmt.vim'

" Archivos GIT
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" --- vim go (polyglot) settings.
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

colorscheme gruvbox

" Config AirLine => Footer
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'jsformatter'

" Config Key
let mapleader=" "

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
     \ "Staged"    : "#0ee375",  
     \ "Modified"  : "#d9bf91",  
     \ "Renamed"   : "#51C9FC",  
     \ "Untracked" : "#FCE77C",  
     \ "Unmerged"  : "#FC51E6",  
     \ "Dirty"     : "#FFBD61",  
     \ "Clean"     : "#87939A",   
     \ "Ignored"   : "#808080"   
     \ }

" Ignore Node Modules
let g:NERDTreeIgnore = ['^node_modules$']

" sync open file with NERDTree
" Check if NERDTree is open or active
"function! IsNERDTreeOpen()        
" return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" vim-prettier
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 1
autocmd BufWritePre, TextChanged, InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" always show signcolumns
set signcolumn=yes

" Ver archivos agregados en GIT
nnoremap <C-p> :GFiles<CR>

map <C-z> <Plug>(easymotion-s2)
" nmap <Leader>z <Plug>(easymotion-s2)

" Cambiando a Ctrl + n para NERDTree
" nmap <Leader>as :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" Cambiando a Ctrl + s para guardar
" nmap <Leadeer>s :w<CR>
map <C-s> :w<CR>

" Guardar y Salir
nmap <Leader>sq :wq<CR>

" Salir
nmap <Leader>q :q<CR>

" Salir sin guardar
nmap <Leader>e :q!<CR>

" Comando C#
nmap <leader>rt :OmnisharpRunTest<cr>
nmap <leader>rf :OmnisharpRunTestInFile<cr>

" Comandos Flutter
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" ColorsPairs
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ejecutar en NodeJS
nmap <C-x> :!node %<CR>
