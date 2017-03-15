execute pathogen#infect()
syntax enable
filetype on
filetype plugin on
filetype indent on
set ttimeoutlen=0
set clipboard=unnamed
set noswapfile
set autoindent


""
"" Whitespace
""
set backspace=indent,eol,start
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType crystal,ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd FileType go set sw=4 sts=4 ts=4 et
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and
  " cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" Remap indentation
vmap <leader>] >gv
nmap <leader>] >gv
vmap <leader>[ <gv
nmap <leader>[ <gv


""
"" Status Line
""
set laststatus=2
set statusline=%F%m%r%h%w
set statusline+=\ [line:\ %l\/%L]
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


""
"" Syntastic
""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_setup_keybindings = 0
let g:loaded_syntastic_crystal_crystal_checker = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["eruby", "ecr"] }

""
"" Mac OS X
""
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>
vmap <F2> :w !pbcopy<CR><CR>


""
"" CtrlP
""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|elm\-stuff|hg|sass\-cache)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }


""
"" Searching - the_silver_searcher (ag)
"" use :Ag to search
""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif


""
"" Nerdcommenter
""
map <leader><leader> <plug>NERDCommenterToggle<CR>
imap <leader><leader> <plug>NERDCommenterToggle<CR>
vmap <leader>] >gv
vmap <leader>[ <gv
nmap <leader>] >>
nmap <leader>[ <<
omap <leader>] >>
omap <leader>[ <<
