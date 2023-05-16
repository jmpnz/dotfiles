" Source some custom functions the most important
" strips trailing whitespaces.
source ~/.vim/functions.vim

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Disable swap and backup files
set noswapfile
set nobackup

" Force plugins to be loaded correctly
filetype off

" Set encoding to utf-8
set encoding=utf-8

" Visual hints for pesky characters
set list
set listchars=tab:▸\ ,nbsp:¬,trail:·

" Use default colors
colo default

" Use 256 colors
set t_Co=256

" Set termguicolors
set termguicolors

" Set background dark
set background=dark

" Use OS clipboard
set clipboard=unnamed

" Show line numbers
set number

" Enable the mouse
set mouse=a

" Set syntax highlightning
syntax on

" Activate filetype detection
filetype plugin indent on

" All hail the map leader
let mapleader=','

" Wild menus
set wildmenu

" Show partial commands
set showcmd

" Show file stats
set ruler

" Show status
set laststatus=2

" Don't fail loudly
set confirm
set cmdheight=2

" Tabs are spaces and the usual bullshit
set wrap
set textwidth=100
set formatoptions=tcqrn1

set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Good search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Don't re-open already opened buffers.
set switchbuf=useopen
" Watch for file changes
set autoread

" Reselect visual block after adjusting indentation
vnoremap < <gv
vnoremap > >gv

" Backspace should do its thing
set backspace=indent,eol,start

" <C-L> to clear search highlight
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" When returning from a search reset

" Remove trailing whitespace
autocmd! BufWritePre * call StripTrailingWhitespaces()

" Set fzf mappings.
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>


" Visual selection for default colorscheme.
hi Visual  guifg=LightBlue guibg=Black gui=none

" Nice cursor behavior
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Run clang-format on C++ buffers.
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatCppBuffer()
