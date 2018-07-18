execute pathogen#infect()

set nocompatible

filetype on
filetype plugin indent on
syntax on

set title
set mouse=a

set shortmess=at
set nrformats+=alpha

set modeline
set modelines=5

set number
set relativenumber
set numberwidth=4
set ruler
set colorcolumn=120
set cursorline

set backspace=2

set background=dark

set hidden
set confirm
set equalalways

set lazyredraw
set noshowmode

set tabstop=3
set expandtab
set shiftwidth=3

map <F2> <ESC>:TSelectBuffer

set cinoptions+=j1
let java_comment_strings=1
let java_highlight_java_lang_ids=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='light'

let g:rustfmt_autosave = 1

let g:livepreview_previewer = "zathura"
let g:polyglot_disabled = ['latex']

fun! MyFormat()
   if &ft =~ 'javascript\|typescript\|jsx\|html\|css\|scss\|less\|graphql\|markdown\|vue\|json'
      Prettier
   elseif &ft =~ 'pug'
      echo "pug fuck you"
   elseif &ft != ''
      Autoformat
   else
      echo "No filetype!"
   endif
endfun

au BufWrite * call MyFormat()

au! BufNewFile,BufRead *.glslv,*.glslf set ft=glsl

map <F3> <ESC>:w<CR>
map <F7> <ESC>:Autoformat<CR>

set formatprg=par\ j1w120
"set formatprg=par\ P+\*P+\-P+\+P+$\ 80j
map <F6> <ESC>mkggVGgq`k

au FileType yaml,python,qaf let b:autoformat_autoindent = 0
au FileType yaml,python,qaf let b:autoformat_retab = 0
au FileType yaml,python,qaf let b:autoformat_remove_trailing_spaces = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
