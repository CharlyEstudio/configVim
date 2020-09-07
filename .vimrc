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
set tabstop=2
set shiftwidth=2

" always uses spaces instead of tab characters
set expandtab

set laststatus=2
set noshowmode

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

call plug#end()

colorscheme gruvbox

" Config AirLine => Footer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

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
function! IsNERDTreeOpen()        
 return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

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

" Using CocList
" Show all diagnostics
" nnoremap <leader>all  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>ext  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>com  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>osy  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>sym  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>jact  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>kactp  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>plat  :<C-u>CocListResume<CR>
