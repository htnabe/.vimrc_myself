if &compatible
  set nocompatible
endif
  " Add the dein installation directory into runtimepath
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

  if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif

      call dein#end()
      call dein#save_state()
    endif

filetype plugin indent on
syntax enable

"" snippet
call dein#add('SirVer/ultisnips')
" add dirct tree
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('scrooloose/nerdtree')
"" delete white space
call dein#add('sbronson/vim-trailing-whitespace')
"" javascript
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
"" error detect
call dein#add('w0rp/ale')
"" vimでshell
call dein#add('Shougo/vimshell.vim')

"" ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" snippet
let g:UltiSnipsSnippetDirectories=["~/vim-snippets/"]

"" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <Leader>dir :NERDTreeTabsToggle<CR>
autocmd BufWritePre * :FixWhitespace
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup ENDi

"" vimshell
"" nnoremap <Leader>sh :VimShellPop<CR>
nnoremap <Leader>sh :vertical terminal<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" function
"" xaml
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
if !exists('*s:setupWrapping')
    function s:setupWrapping()
        set wrap
        set wm=2
        set textwidth=79
    endfunction
endif

"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" template
augroup templateGroup
    autocmd!
    autocmd BufNewFile *.html :0r ~/vim-template/t.html
    autocmd BufNewFile *.cpp :0r ~/vim-template/t.cpp
    autocmd BufNewFile *.py :0r ~/vim-template/t.py
augroup END

" base
 set encoding=utf-8
 set fileencoding=utf-8
 set fileencodings=utf-8
 set bomb
 set binary
 set ttyfast
 set backspace=indent,eol,start
 set tabstop=4
 set softtabstop=0
 set shiftwidth=4
 set expandtab
 set splitright
 set splitbelow
 set hidden
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase
 set nobackup
 set noswapfile
 set fileformats=unix,dos,mac
 syntax on
 set ruler
 set number
 set gcr=a:blinkon0
 set scrolloff=3
 set laststatus=2
 set modeline
 set modelines=10
 set title
 set titleold="Terminal"
 set titlestring=%F
 set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
 set autoread
 set noerrorbells visualbell t_vb=
 set clipboard+=unnamed,autoselect
 set mouse=a
 set whichwrap=b,s,h,l,<,>,[,]
