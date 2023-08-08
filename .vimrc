"" Note: Need to be using Vim 8 at least. Requires the native package manager
""

filetype plugin on
set ttimeoutlen=0
set clipboard=unnamed
set noswapfile
set autoindent

""
""
""
syntax on
colorscheme nord

""
"" Whitespace
""
set backspace=indent,eol,start
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType crystal,ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sw=2 sts=2 et
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

""
"" ALE
""
let g:ale_fixers = {'typescript': ['deno']}
let g:lsp_diagnostics_enabled = 0

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
  \ 'dir':  '\v[\/]\.(git|elm\-stuff|hg|sass\-cache|node\-modules)$',
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


""
"" Writing section
""
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END
