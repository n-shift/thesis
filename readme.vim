" This file is used only for readme.md stats regeneration. Not meant to be
" used inside your actual config.

" Open readme.md
edit readme.md

" Place cursor on the structure
/## Structure
+
" Delete entire structure
normal dG
" ### Directory overview
" ```
" <exa --tree>
" ```
let @e = system("nu -c \"exa --tree\"")
normal o### Directory overview
normal o```
normal "ep
normal G
normal o```
" ### Length overview
" ```
" <tokei>
" ```
let @t = system("nu -c \"tokei\"")
normal o### Length overview
normal o```
normal "tp
normal G
normal o```
" Save and quit
xit
