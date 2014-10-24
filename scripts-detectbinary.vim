if did_filetype()
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if executable('file')
    let s:type = system('file -bEpiL ' . shellescape(expand('%:p')))
    if s:type =~ '\<charset=binary\>' && s:type !~ '^inode'
	setfiletype binary
    endif
endif

let &cpo = s:cpo_save
unlet s:cpo_save s:type
