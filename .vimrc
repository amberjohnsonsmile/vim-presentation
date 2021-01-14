" IMPORT PLUGINS
execute pathogen#infect()

" GENERAL SETTINGS
" Syntax highlighting
syntax on
" Indent by filetype
filetype plugin indent on
" Map tab key to 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" Show line numbers
set number
" Highlight during search
set hls
" Ignore case during search
set ic
" Turn off vi-compatible mode
set nocp
" Disable that annoying beep
set noeb vb t_vb=
" Colorscheme
colorscheme pablo

" REMAPPINGS
inoremap jj <Esc>
inoremap jk <Esc>
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>
set backspace=indent,eol,start

" Custom key commands for switching buffers
let mapleader = " "
nnoremap <leader>n :bn<CR>
nnoremap <leader>N :bN<CR>

au FileType * set fo-=c fo-=r fo-=o

" PLUGIN SETTINGS
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ":t"

" Prettier
let g:prettier#config#tab_width = 2
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#semi = 'false'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" Debugger
function! DebugJs()
  let cmd="node --debug-brk "
  if( expand('%:e') == "coffee")
    let cmd="coffee --nodejs --debug-brk "
  endif
  exec "silent ConqueTermVSplit bash -ic \"(" . cmd . @% . " &) ; sleep 1s && node-vim-inspector\""
endfunction

" launch debug on ctrl-d
nnoremap <C-d> :call DebugJs()<CR>    
