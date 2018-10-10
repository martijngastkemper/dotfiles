" Vundle setup {{{{

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'StanAngeloff/php.vim'
    
    call vundle#end()            " required
    filetype plugin indent on    " required

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

    " improve performance of listings by ignoring some regular files
    set wildignore+=*.o,*.obj,*.jpg,*.jpeg,*.png,*.gif,*.ser,.git,.idea

    " ignore some project folders
    set wildignore+=vendor,node_modules,public/js/build/prod/* 

" }}}}

