filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/fonts'
Plugin 'HerringtonDarkholme/yats.vim'

Plugin 'wakatime/vim-wakatime'
Plugin 'editorconfig/editorconfig-vim'

" jump around documents
Plugin 'Lokaltog/vim-easymotion'

" full path fuzzy search
Plugin 'kien/ctrlp.vim'

" some markdown support
Plugin 'plasticboy/vim-markdown.git'

" formatting for js
Plugin 'pangloss/vim-javascript'

" more js syntax options
Plugin 'maksimr/vim-jsbeautify'

" some yaml support
Plugin 'avakhov/vim-yaml.git'

Plugin 'vim-latex/vim-latex'

Plugin 'klen/python-mode'
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'
call vundle#end()
filetype indent plugin on

" Powerline setup
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=8
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

" syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" http://vim.wikia.com/wiki/Omni_completion
" Usage: in InsertMode press Ctrl+X and Ctrl+O to get a popup with suggestions
set omnifunc=syntaxcomplete#Complete


" vim config files, which are usually sourced: /etc/vim/vimrc, ~/.vimrc
autocmd Filetype gitcommit setlocal spell textwidth=72
syntax enable " enable syntax processing
set background=dark
"colorscheme solarized
setglobal modeline      " parses vim instructions in the file like // vim:ts=4:sw=4:et:
set shiftwidth=4        " number of spaces idented by default
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set incsearch           " Incremental search
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Always display the statusline in all windows
set showtabline=2       " Always display the tabline, even if there is only one tab
set noshowmode          " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set scrolloff=5         " always show 5 lines before/after the cursor
set title
