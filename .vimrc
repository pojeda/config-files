"open the possibilities for scripting
set nocompatible

" no bell
" set visualbell 

set title

"for spellign the language
"set spelllang=en

set background=dark

"for pathogen plugin
call pathogen#infect()
syntax on
filetype plugin indent on

" syntax
"syntax on
"filetype on
"filetype plugin on
"filetype indent on

" lines for history
set history=10000

"Which color scheme
colorscheme koehler

"Upper/Lower case are the same
set ignorecase

"format with the par external program
set formatprg=par\ -w70j

" highlight search
set hlsearch

" dynamically search
set incsearch

" Show the mode
"set showmode

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

" cursor position
set ruler

" status line
"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

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
"imap jj <Esc>

" formatting a paragraph
map Q gqip
  
" map colon to semicolon
map ; :

" map for visual block
map vv <C-V>

" map for repeat command put it in the beginning of the change
map . .`[

" map for inserting new lines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" map sav to save the file in insert mode
imap <F10> <Esc>:w<CR><Esc>


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

"For command line editing
"set cedit

"split vertical to the right
"set splitright

"to search with space instead of slash
map <space> /
map <C-space> ?

"Recompile a tex file with pdflatex
command! Reload :! (pdflatex % &>/dev/null) &
au BufWritePost *.tex silent Reload
"Open the Zathura editor
command! Open   :! (file="%"; pdflatex "$file" $>/dev/null && zathura "${file/.tex/.pdf}" &>/dev/null) &

"Reformat automatically the paragraphs
set tw=70
set wm=0

""set linebreak ""set fo+=t ""set ai 

"autoformat the text useful for latex but annoying for any other
"things 
"set fo=at

"set spell
"Use the the z= command to find alternate spellings underneath your cursor.
set spelllang=en_us
"set spelllang=es
set spell

"Keep 5 lines below and above the cursor 
set scrolloff=9999

"to enable backspace 
set backspace=indent,eol,start

"autocomplete the name of files
set wildmode=longest,list

"don't show vim starting message
set shortmess+=I

"If you want to keep the cursor in place when you join lines with
"nnoremap J mzJ`z

"control the position of the new splits
set splitbelow
set splitright

"map the leader to colon
let mapleader = ","

"auto source the .vimrc whenever it is modified
if has('autocmd')
 autocmd bufwritepost .vimrc source $MYVIMRC
endif

"This part adds a header to a fortran file when it is created
"modification to work with c files is straightforward
autocmd bufnewfile *.f so $HOME/.headerfortran
autocmd bufnewfile *.f exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.f exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd bufnewfile *.f exe "1," . 13 . "g/Created By :.*/s//Created By: " .$USER
autocmd Bufwritepre,filewritepre *.f execute "normal ma"
autocmd Bufwritepre,filewritepre *.f exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.f execute "normal `a"

"update vimdiff automatically without diffupdate
if &diff
  augroup saveupdatediff
    autocmd!
    autocmd BufWritePost * diffupdate
  augroup END
endif
"Show line numbers
set number
set cursorline
set cursorcolumn
highlight CursorLine guibg=lightblue ctermbg=blue
highlight CursorColumn guibg=lightblue ctermbg=blue

"load a different color scheme when using vimdiff
"if &diff
"    colorscheme elflord
"endif

"remember folds
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

"Absolute numbers when using insert mode
"autocmd FocusLost * :set number
"autocmd InsertEnter * :set number
"Relative numbers when leaving insert mode
"autocmd InsertLeave * :set relativenumber
"autocmd CursorMoved * :set relativenumber

"abbreviation for stop command in fortran
ab stp stop 'pedro ojeda'
ab wrt write(6,*) 'p. ojeda'


