set guifont=Hack_Nerd_Font:h11

" Important
set encoding=utf8

set number relativenumber

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
" syntax on
" https://stackoverflow.com/a/33380495
if !exists("g:syntax_on")
    syntax enable
endif

" Enables cursor line position tracking:
" set cursorline
" Removes the underline causes by enabling cursorline:
" highlight clear CursorLine

" START Conoline - see https://github.com/miyakogi/conoline.vim
let g:conoline_auto_enable = 1

" For dark colorschemes
let g:conoline_color_normal_dark = 'guibg=#181818'
let g:conoline_color_normal_nr_dark = 'guibg=#181818'
let g:conoline_color_insert_dark = 'guibg=#000000'
let g:conoline_color_insert_nr_dark = 'guibg=#000000'

" For light colorschemes
let g:conoline_color_normal_light = 'guibg=#eaeaea'
let g:conoline_color_normal_nr_light = 'guibg=#eaeaea'
let g:conoline_color_insert_light = 'guibg=#ffffff'
let g:conoline_color_insert_nr_light = 'guibg=#ffffff'

" Use colors defined by colorscheme in normal mode.
" let g:conoline_use_colorscheme_default_normal = 0
" Use colors defined by colorscheme in insert mode.
" let g:conoline_use_colorscheme_default_insert = 0
"END Conoline

" Highlight all search matches
set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'miyakogi/conoline.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
