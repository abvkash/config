set nocompatible backspace=2 clipboard^=unnamed,unnamedplus

set viminfo+=n~/.vim/viminfo dir=~/.vim/swaps undodir=~/.vim/undo undofile

set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smartindent
autocmd FileType make setlocal noexpandtab

set hlsearch incsearch ignorecase smartcase

set nowrap hidden mouse+=a autochdir
set splitbelow splitright
set path+=** wildmenu 
set re=2

syntax on
set background=dark number relativenumber cursorline
colorscheme habamax
hi Normal ctermfg=NONE ctermbg=NONE
hi CursorLine ctermbg=NONE

inoremap <C-c> <ESC>
noremap x "_x
noremap X "_X

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20
let g:netrw_dirhistmax=0

set errorformat+=%A%\\s%#File\ \"%f\"\\,\ line\ %l\\,\ in%.%#
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
