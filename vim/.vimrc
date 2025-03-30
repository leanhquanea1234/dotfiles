if exists('$TMUX')
    let &t_SI = "\e[5 q"  " Beam (insert mode)
    let &t_SR = "\e[3 q"  " Underline (replace mode)
    let &t_EI = "\e[0 q"  " Block (normal mode)
else
    let &t_SI = "\e[6 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
endif

" Set leader key to space
let mapleader = " "
let maplocalleader = " "

" Remove search highlights after searching
nnoremap <Esc> :nohlsearch<CR>

" Exit Vim's terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Exit insert/visual mode with jk
inoremap jk <Esc>
vnoremap jk <Esc>

" Replace ; with : for quick command mode
nnoremap ; :

" Close buffer (quit)
nnoremap <leader>x :q<CR>

" OPTIONAL: Disable arrow keys in normal mode
nnoremap <left> :echo "Use h to move!!"<CR>
nnoremap <right> :echo "Use l to move!!"<CR>
nnoremap <up> :echo "Use k to move!!"<CR>
nnoremap <down> :echo "Use j to move!!"<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Easily split windows
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>

" Stay in indent mode in visual mode
vnoremap < <gv
vnoremap > >gv
