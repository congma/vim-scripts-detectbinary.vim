Detect binary file and set `filetype=binary` in Vim
===================================================

This Vim script tried to check if the current file is "binary" using the
external command `file`.  If it thinks it is, `filetype` is set to `binary`.
The script doesn't interfere with Vim's other plugins for binary-formats, such
as archive readers.

The script does nothing more than setting this `filetype`.  Typically, you'll
want to use this information for further customizing, possibly using
autocommands.


Installation
------------

Copy the script `scripts-detectbinary.vim` to `~/.vim/scripts.vim`.  If you
already have your own `scripts.vim` file, you can source this one there.


Example autocommands
--------------------

In your `~/.vimrc` file:

```viml
if has('autocmd')
  augroup vimrc_BinaryFT
    autocmd!
    " Prevent damaging binary file.
    autocmd FileType binary setlocal binary nomodifiable
  augroup END
endif
```

You can add more fancy settings if you think it's really a good idea though ...

```viml
if has('autocmd')
  augroup vimrc_BinaryFT
    autocmd!
    " Prevent damaging binary file & better display, using local options.
    autocmd FileType binary
          \ setlocal binary list nobreakindent nosmartindent noautoindent |
          \          nomodifiable syntax=
    " Global options that toggle when switching from text to binary or v. v.
    " May leave artifacts when showing binary and text files in split windows.
    " Can be cleared by :redraw!
    autocmd TabEnter,BufEnter,WinEnter *
          \ if &filetype == 'binary' |
          \   set display+=uhex showbreak= |
          \ else |
          \   set display-=uhex showbreak=>\ |
	  \ endif
  augroup END
endif
```

<!--
vim: ai formatoptions=12tcaqn spell spelllang=en
-->
