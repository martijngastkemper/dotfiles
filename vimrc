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

" ctrlp.vim {{{{

    " Ignore some files and folders
    set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,.idea
    set wildignore+=vendor,node_modules,public/js/build/prod/* 

    " Use ctrlp-py-matcher for improved performance 
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" }}}}

