runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
set showcmd
set expandtab
set smarttab

" set up texmate bindings for NERDCommenter
map <C-;> <Plug>NERDCommenterToggle

map <F2> :NERDTreeToggle<CR>

syntax on
set t_Co=256
set background=dark
colorscheme elflord

filetype plugin indent on

set nofoldenable

"define :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let Pos = line2byte( line( "." ) ) 
    :Tidy
    exe "goto " . Pos 
endfun

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nmap <C-H> :call DoTidy()<CR>

"shortcut for visual mode to run on the the current visual selection"
au Filetype perl vmap <C-H> :Tidy<CR>

let perl_extended_vars=1
let perl_include_pod=1
let perl_string_as_statement=1
let perl_sync_dist=1000

