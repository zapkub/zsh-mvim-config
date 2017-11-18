call plug#begin('~/.vim/plugged')

" Accesibility
Plug 'easymotion/vim-easymotion'

" File System
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dsimidzija/vim-nerdtree-ignore'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'voronkovich/ctrlp-nerdtree.vim'

" Coding
Plug 'tpope/vim-commentary'

"" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template' 
Plug 'jason0x43/vim-js-indent'

"" Javascript
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

" Theme
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
call plug#end()

 
" Setup nerdtree and CtrlP =======
map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_show_hidden = 1
"
" Enable synchornize nerdtree folder with current folder
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
" End add nerdtree synchornize function


" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if only nerdtree visible
autocmd BufEnter * lcd %:p:h
let g:ctrlp_dont_split = 'nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" setup ctrlp
let g:ctrlp_abbrev = {
  \ 'gmode': 'i',
  \ 'abbrevs': [
    \ {
      \ 'pattern': ' ',
      \ 'expanded': '',
      \ 'mode': 'pfrz',
    \ },
    \ ]
  \ }
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|next)$|node_modules'
" END nerdtree and CtrlP





" START Omni completetion setup
" setting omni completetion for accept on type
"" allow type detail
" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
let g:tsuquyomi_completion_detail = 1

set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" END Omni completetion 


set number
syntax on
colorscheme monokai

" move between split pane by Backspace, Tab
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W

" use tab 4 spaces
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spacesi

