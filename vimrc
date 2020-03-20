" Vundle setup {{{{

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'dkarter/bullets.vim'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'FelikZ/ctrlp-py-matcher'
    Plugin 'lumiliet/vim-twig'
    Plugin 'ludovicchabant/vim-gutentags'
    Plugin 'machakann/vim-highlightedyank'
    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'StanAngeloff/php.vim'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'

    call vundle#end()
    filetype plugin indent on

" }}}}

" GUI {{{{{

    " Enable syntax highlighting
    syntax on

    " status line
    set statusline=%f\ %y\ %m\ %r\ Line:\ %l/%L\ Col:\ %c\ Buf:\ #%n
    set laststatus=2
    set showcmd

    " linenumbers
    set number
    set relativenumber

    set scrolloff=5

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start
        
" }}}}

" Formatting {{{{

    " Use spaces instead of tab
    set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" }}}}

" Mappings {{{{

    let mapleader = ","

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " quick access to $MYVIMRC
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " fast saving
    nnoremap <leader>w :w!<cr>

    " List open buffers and type the id to navigate to it
    nnoremap § :ls<cr>:b

    " yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

" }}}}

" Search {{{{

    set incsearch
    set ignorecase
    set smartcase
    set hlsearch
    set incsearch

" }}}}

" Misc {{{{

    " no swap files
    set noswapfile

    " Enter opens tag
    augroup tag_navigation
        autocmd!
        autocmd BufRead,BufNewFile * if &l:modifiable | nnoremap <buffer> <CR> :exec("tag ".expand("<cword>"))<CR> | endif
    augroup END

" }}}}

" ctrlp.vim {{{{

    " Ignore some files and folders
    set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,.idea
    set wildignore+=node_modules,public/js/build/prod/*

    " Use ctrlp-py-matcher for improved performance
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

    " Allow dotfiles like .env and .env.template
    let g:ctrlp_dotfiles = 1

    " leader key + j to open CtrlP in buffer mode
    noremap <leader>j :CtrlPBuffer<CR>

" }}}}

" Bullets.vim {{{{

    let g:bullets_enabled_file_types = [
        \ 'markdown',
        \ 'text',
        \ 'gitcommit',
        \ 'scratch'
        \]

" }}}}

" Commentary {{{

    autocmd FileType php setlocal commentstring=//\ %s

" }}}}

" gitgutter {{{{

    " Update after 100ms instead of the default 4000ms
    set updatetime=100

" }}}}

" Gutentags {{{{

    " Move tags file out of project root
    let g:gutentags_ctags_tagfile = ".git/tags"

" }}}}
