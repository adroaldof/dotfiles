" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall

" Filetype off is required by vundle
filetype off

" Where the files will be placed
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/ " Submodules
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" YADR's vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vundles/ to edit them:

" runtime css.vundle
" runtime html.vundle
runtime appearance.vundle
runtime codestyles.vundle
runtime docker.vundle
runtime extras.vundle
runtime javascript.vundle
runtime project.vundle
runtime search.vundle
runtime typescript.vundle
runtime vim-improvements.vundle


"Filetype plugin indent on is required by vundle
filetype plugin indent on
