"open the possibilities for scripting
set nocompatible

" no bell
" set visualbell 

set title

"for spellign the language
"set spelllang=en

set background=dark

" syntax
syntax on
filetype on
"filetype plugin on
"filetype indent on

" lines for history
set history=1000

"Which color scheme
colorscheme koehler

"Upper/Lower case are the same
set ignorecase

"Show line numbers
set number
set cursorline
set cursorcolumn
highlight CursorLine guibg=lightblue ctermbg=blue
highlight CursorColumn guibg=lightblue ctermbg=blue

set formatprg=par\ -w70j

" highlight search
set hlsearch

" dynamically search
set incsearch

" Show the mode
set showmode

set laststatus=2

" matching of brackets
set showmatch
" mouse mode
set selectmode=mouse

" tab indenting
set tabstop=8

" smart indent
" set smartindent

" copy indent
set copyindent

" four spaces indenting
set shiftwidth=8

" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab autoindent

" spaces instead of tabs
set expandtab

"remember folds
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

" fold method
"set foldmethod=syntax
set foldmethod=manual

"to fold parts of the code
set nofoldenable

"set textwidth=78

" cursor position
set ruler

" status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

"display name of file
set modeline
set ls=2

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :200  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
" set viminfo='10,\"100,:200,%,n~/.viminfo

"Number of characters in one column
"set columns=100
au BufRead,BufNewFile *.src,*.fcm set filetype=fortran
au BufRead,BufNewFile *.inp,*.str set filetype=charmm

" sane indentation
set pastetoggle=<F12>

" map keys
imap jj <Esc>

" formatting
map Q gq
  
" map colon to semicolon
map ; :

map vv <C-V>

" map sav to save the file in insert mode
imap <F10> <Esc>:w<CR><Esc>

" map for 

" use dictionary for word completion
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k 

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"set nohlsearch          " turn off highlight searches, but:
                        " Turn hlsearch off/on with CTRL-N
map <silent> <F11> :se invhlsearch<CR>

" term color
set term=screen-256color

"For Tmux Colors
set t_Co=256

"Recompile a tex file with pdflatex
command! Reload :! (pdflatex % &>/dev/null) &
au BufWritePost *.tex silent Reload
"Open the Zathura editor
command! Open   :! (file="%"; pdflatex "$file" $>/dev/null && zathura "${file/.tex/.pdf}" &>/dev/null) &

"Reformat automatically the paragraphs
set tw=70
set wm=0
""set linebreak
""set fo+=t
""set ai 

set fo=at

"set spell
"Use the the z= command to find alternate spellings underneath your cursor.
set spelllang=en_us
set spell

"Keep 5 lines below and above the cursor 
set scrolloff=9999
