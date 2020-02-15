syntax on
set nu
set background=dark
filetype plugin indent on

" Highlight search results
set incsearch

"Auto indent for C programs
set cindent

" Set to auto read when a file is changed from the outside
set autoread 

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

set si "Smart indent

" Read Markdown files properly
au BufRead,BufNewFile *.md set filetype=markdown

" Fat-fingered colon shift shortcuts
cabbr Q quit
cabbr W write

" Infinite undo
if !isdirectory($HOME . "/.vim/undodir")
   call mkdir($HOME . "/.vim/undodir", "p")
endif
set undofile
set undodir=~/.vim/undodir

" Highlight current line in a dark grey colour
set cursorline
hi CursorLine cterm=NONE ctermbg=233

" Enables Pathogen
execute pathogen#infect()

" Needed to get lightline working
set laststatus=2

" Vim table mode
set TableModeToggle on

" Open nerdtree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
