" Vundle setup {{{{

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'FelikZ/ctrlp-py-matcher'
    Plugin 'StanAngeloff/php.vim'
    Plugin 'lumiliet/vim-twig'
    
    call vundle#end()
    filetype plugin indent on

" }}}}

" GUI {{{{{
    
    " Enable syntax highlighting
    syntax on

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
