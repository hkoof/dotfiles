" use pathogen to manage plugins
" call pathogen#infect()
" call pathogen#helptags()

" set backup, if not, specify [ set nobackup ]
set backup

" to make copy paste possible we need this from vim version 8 on
set mouse=

" specify backup directory
set backupdir=~/.vimbackup

" show line number, if not, specify [ set nonumber ]
set nonumber

" highlights parentheses
set showmatch

" enables filetype recognition
" filetype plugin indent on
filetype plugin indent on

" show color display, if not, specify [ syntax off ]
syntax on

" change colors for comments if it's set [ syntax on ]
" highlight Comment ctermfg=LightCyan

" set default color scheme
set t_Co=256
colorscheme solarized
if has("gui_running")
    set background=light
else
    set background=dark
endif

" wrap lines, if not, specify [ set nowrap ]
set nowrap

"""" Programming settings, expecially useful for python
"
" set tab and indent spaces
" DEPRECATED set smartindent
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
" set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Remove trailing whitespace from python files just before saving (writing)
" the file.
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"The following line sets the smartindent mode for *.py files. It means that
"after typing lines which start with any of the keywords in the list (ie. def,
"class, if, etc) the next line will automatically indent itself to the next
"level of indentation:
"
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Another approach is to create a key mapping which detects when you type a
" colon (:) followed by a RETURN (<CR>), and adds a <TAB> keypress to the end.
"" im :<CR> :<CR><TAB>

" View man pages in vim:
"   :Man 3 printf
"
runtime ftplugin/man.vim

au BufNewFile,BufRead *.rest set filetype=rst
iab hkodt <c-r>=strftime("%y-%m-%d %H:%M")<cr>
iab hkodate <c-r>=strftime("%y-%m-%d")<cr>
iab hkotime <c-r>=strftime("%H:%M")<cr>
