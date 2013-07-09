set nocompatible

filetype plugin indent on

"load vim plugins from .vim/bundle
call pathogen#infect()

" Syntax highlighting
syntax on

set background=dark

set showmatch " Show matching brackets.

" No sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Map F2 to toggle cursorline
map <F2> :set cursorline!<CR>

" Indent Stuff
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" C, C++, and Java files have 4 spaces per tab
for ext in ["c", "cpp", "java"]
  execute 'au FileType ' . ext . ' set expandtab'
  execute 'au FileType ' . ext . ' set shiftwidth=4'
  execute 'au FileType ' . ext . ' set softtabstop=4'
  execute 'au FileType ' . ext . ' set tabstop=4'
endfor

" Ctrl-hjkl for switching between splits
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-l> <C-W>l<C-W>_
map <C-h> <C-W>h<C-W>_

" Disable text wrapping
set nowrap

" Disable max line width
set textwidth=0

" Do not copy line numbers but show them
set nonu
set number
" Also format them...
"highlight LineNr term=NONE cterm=NONE ctermfg=LightGrey ctermbg=Black gui=NONE guifg=LightGrey guibg=Black

" Search Settings
" If search is all lowercase then case is ignored, but if search contains uppercase letters then search is case-sensitive
set ignorecase
set smartcase

" Make the tab key match bracket pairs
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" nerdtree leader mapping
map <leader>n :NERDTree <CR>

" Substitutions
" Replace all words on a line instead of just the first
set gdefault

" Cursor Line
set cursorline

" Allow cursor past last character
set virtualedit=onemore


"Make backspace behave correctly
set backspace=indent,eol,start

colorscheme desert

" Show whitespace: tabs and trailing spaces
set listchars=tab:>\ ,trail:.
set list


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""
" Ruby
"""""""""""""
    " Header function
    au FileType ruby inoremap $head #!/usr/bin/env ruby<CR>####################################################<CR> Author:   Edward Poore (edwa)<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>###################################################<CR><BS><CR>
    au FileType ruby inoremap $cy #!/usr/bin/env ruby<CR>####################################################<CR>  Copyright: Cypress Semiconductor<CR> Author:   Edward Poore (edwa)<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>###################################################<CR><BS><CR>
    au FileType ruby inoremap $main def main<CR><CR>end #main<CR><CR>main<UP><UP><UP><TAB>
    au FileType ruby inoremap $fh   fh = File.open(file)<CR>data = fh.read<CR>fh.close<CR>
    au FileType ruby inoremap $files fh = File.open(ARGV[0])<CR>files = fh.read.split(/\n/)<CR>fh.close<CR>files.each do \|file\|<CR><CR>end<CR><UP><UP><TAB><TAB>
    au FileType ruby com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType ruby com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" Perl
"""""""""""""

    " Header function
    au FileType perl inoremap $head #!/usr/local/bin/perl<CR>####################################################<CR> Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   Edward Poore<CR>Initials: edwa<CR>Phone:    859-977-7597<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>###################################################<CR><BS><CR>
    " Auto write updated time
"    au BufWritePre *.pl,*.perl 10s/^# Updated:.*$/\=strftime("# Updated:  %x %X (%Z)")/
    " Comment Chars
    " au FileType perl let commentchars = "#"
    au FileType perl com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType perl com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" C
"""""""""""""

    " Header function
    au FileType c,cpp inoremap $head /****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   Edward Poore<CR>Initials: edwa<CR>Phone:    859-977-7597<CR><CR>File:    <C-R>=expand("%:t")<CR><CR>Created: <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>***************************************************/<CR><BS><CR>
    " Main function
    au FileType c,cpp inoremap $main int main(int argc, char** argv) {<CR><CR>}<UP><TAB>
    " Includes
    au FileType c inoremap $inc #include <stdio.h><CR><CR>
    au FileType cpp inoremap $inc #include <iostream><CR><CR>using namespace std;<CR><CR>
    " Auto write updated time
"    au BufWritePre *.c,*.cc,*.cpp 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/
    " Comment Chars
    " au FileType c,cpp let commentchars = "//"
    au FileType c,cpp com! -range   C   <line1>,<line2>s/^\([^/][^/]\|$\)/\/\/\1/
    au FileType c,cpp com! -range   CC  <line1>,<line2>s/^\/\///

"""""""""""""
" Java
"""""""""""""

    " Header function
    "au FileType java 
    "inoremap $head /****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR>Author:   Edward Poore<CR>Initials: edwa<CR>Phone:    859-977-7597<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History::<CR><CR><BS>***************************************************/<CR><BS><CR>
    "TODO add javadoc
    " Main function
    au FileType java inoremap $main public class <C-R>=expand("%:t:r")<CR> {<CR><CR><CR><CR>}<UP><UP><TAB>public static void main(String [] args) {<CR><CR>}<UP><TAB><TAB>
    " Includes
    au FileType java inoremap $inc import java.util.*;<CR><CR>
    " Auto write updated time
"    au BufWritePre *.java 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/
    " Comment Chars
    " au FileType java let commentchars = "//"
    au FileType java com! -range   C   <line1>,<line2>s/^\([^/][^/]\|$\)/\/\/\1/
    au FileType java com! -range   CC  <line1>,<line2>s/^\/\///

"""""""""""""
" Python
"""""""""""""

    " Use real tabs
    au FileType python set expandtab!
    " Comment Chars
    " au FileType python let commentchars = "#"
    au FileType python com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType python com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" Skill
"""""""""""""

"""""""""""""
" Verilog
"""""""""""""

    " Indentation settings
    au FileType verilog set tabstop=2
    au FileType verilog set shiftwidth=2
    " Header function
    au FileType verilog inoremap $head <ESC>:set autoindent!<CR>i/****************************************************<CR>Copyright (c) <C-R>=strftime("%Y")<CR> by Cypress Semiconductor<CR><CR>Author:   Edward Poore<CR>Initials: edwa<CR>Phone:    859-977-7597<CR><CR>File:     <C-R>=expand("%:t")<CR><CR>Created:  <C-R>=strftime("%x %X (%Z)")<CR><CR>Updated:<CR>Revision History:<CR><CR><BS>***************************************************/<CR><BS><CR><ESC>:set autoindent<CR>i
    " Main function
    au FileType verilog inoremap $main module <C-R>=expand("%:t:r")<CR>( );<CR><CR>endmodule<UP><TAB>
    " Always block with clock
    au FileType verilog inoremap $always always@(posedge clk)<CR>begin<CR>end<ESC>O<TAB>
    " Auto write updated time
"    au BufWritePre *.v 10s/^ \* Updated:.*$/\=strftime(" * Updated: %x %X (%Z)")/
    " Comment Chars
    " au FileType verilog let commentchars = "//"
    au FileType verilog com! -range   C   <line1>,<line2>s/^\([^/][^/]\|$\)/\/\/\1/
    au FileType verilog com! -range   CC  <line1>,<line2>s/^\/\///

"""""""""""""
" Makefile
"""""""""""""

    " Use real tabs
    au FileType Makefile set expandtab!
    " Comment Chars
    " au FileType Makefile let commentchars = "#"
    au FileType Makefile com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType Makefile com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" TCL
"""""""""""""

    " Comment Chars
    " au FileType sh,tcsh,csh,bash let commentchars = "#"
    au FileType tcl com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType tcl com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" Shell
"""""""""""""

    " Comment Chars
    " au FileType sh,tcsh,csh,bash let commentchars = "#"
    au FileType sh,tcsh,csh,bash com! -range    C   <line1>,<line2>s/^\([^#]\|$\)/#\1/
    au FileType sh,tcsh,csh,bash com! -range    CC  <line1>,<line2>s/^#//

"""""""""""""
" Spice Netlist
"""""""""""""

    " Comment Chars
    " au FileType spice let commentchars = "*"
    au FileType spice com! -range    C   <line1>,<line2>s/^\([^*]\|$\)/*\1/
    au FileType spice com! -range    CC  <line1>,<line2>s/^\*//

"""""""""""""
" Liberty
"""""""""""""

    " Comment Chars
    " au FileType liberty let commentchars = "*"
    au FileType liberty com! -range    C   <line1>,<line2>s/^\([^*]\|$\)/*\1/
    au FileType liberty com! -range    CC  <line1>,<line2>s/^\*//

"""""""""""""
" VIM
"""""""""""""

    " Comment Chars
    " au FileType vim let commentchars = "\""
    au FileType vim com! -range    C   <line1>,<line2>s/^\([^"]\|$\)/"\1/
    au FileType vim com! -range    CC  <line1>,<line2>s/^"//
