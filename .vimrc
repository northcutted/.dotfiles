" Basics
set nocompatible              " Use Vim defaults
filetype off                  " Required for Vundle.vim

" UI Configuration
set number                    " Line numbers
set cursorline                " Highlight current line
set showmatch                 " Highlight matching parenthesis
set ignorecase                " Ignore case in searches
set smartcase                 " Don't ignore case if search has uppercase characters
set incsearch                 " Incremental search
set hlsearch                  " Highlight search results
set wildmenu                  " Visual auto-complete for command menu
set ruler                     " Show cursor position always
set laststatus=2              " Always show status line
set title                     " Show title in console title bar

" Whitespace
set nowrap                    " Don't auto-wrap text
set tabstop=4                 " A tab is four spaces
set shiftwidth=4              " Indent/outdent by four spaces
set softtabstop=4             " Space counts as tabstop while editing
set expandtab                 " Use spaces instead of tabs
set smartindent               " Smart autoindenting
set autoindent                " Maintain indent of current line
set smarttab                  " Use smart tabbing
set shiftround                " Round indent to nearest tabstop
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start

" macOS specific
set clipboard=unnamed         " Use the macOS clipboard
set mouse=a                   " Enable mouse support

" Vundle setup
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Add other plugins here
call vundle#end()
filetype plugin indent on     " Enables filetype-specific behaviors

" Other plugins, custom functions, configurations can be added below

Plugin 'sheerun/vim-polyglot'

filetype plugin indent on

syntax on
colorscheme desert
