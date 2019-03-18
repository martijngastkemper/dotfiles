" Vundle setup {{{{

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'dkarter/bullets.vim'
    Plugin 'FelikZ/ctrlp-py-matcher'
    Plugin 'lumiliet/vim-twig'
    Plugin 'sahibalejandro/vim-php'
    Plugin 'shawncplus/phpcomplete.vim'
    Plugin 'StanAngeloff/php.vim'
    
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

" }}}}

" Misc {{{{

    " no swap files
    set noswapfile

" }}}}

" ctrlp.vim {{{{

    " Ignore some files and folders
    set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,.idea
    set wildignore+=vendor,node_modules,public/js/build/prod/* 

    " Use ctrlp-py-matcher for improved performance 
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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

" gitgutter {{{{

    " Update after 100ms instead of the default 4000ms
    set updatetime=100

" }}}}
