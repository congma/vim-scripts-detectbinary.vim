if did_filetype()
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if executable('file') && (!&binary)
    let s:type = system('file -bEpi ' . shellescape(expand('%:p')))
    if s:type =~ '\<charset=binary\>'
	setfiletype binary
	setlocal binary
    endif
endif

let &cpo = s:cpo_save
unlet s:cpo_save s:type
