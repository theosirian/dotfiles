execute pathogen#infect()
syntax on
set number
set relativenumber
set numberwidth=4
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set tabstop=4
set shiftwidth=4
set noexpandtab
let g:rustfmt_autosave = 1

fun! MyFormat()
	if &ft =~ 'javascript\|typescript\|jsx\|html\|css\|scss\|less\|graphql\|markdown\|vue\|json'
		Prettier
	else
		Autoformat
	endif
endfun

au BufWrite * call MyFormat()

noremap <F3> :w<CR>
inoremap <F3> <ESC>:w<CR>i

"set formatprg=par\ 80qi
"set formatprg=par\ 80ji
set formatprg=par\ P+*P+\-P+\+\ j1w80
"set formatoptions+=a
noremap <F6> mkggVGgq`k
inoremap <F6> <ESC>mkggVGgq`ki

" Theme
syntax enable
colorscheme OceanicNext
