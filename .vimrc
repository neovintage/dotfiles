execute pathogen#infect()
syntax enable
filetype plugin on
set ttimeoutlen=0
set clipboard=unnamed
set noswapfile


""
"" Whitespace
""
set backspace=indent,eol,start
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
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
let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --others --exclude-standard && git ls-files . --cached'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|elm\-stuff|hg|sass\-cache)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
