if did_filetype()
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if executable('file')
    silent let s:type = system('file -biLp ' . shellescape(expand('%:p')))
    if (!v:shell_error) && s:type =~ '\<charset=binary\>'
		\ && s:type !~ '^inode'
	setfiletype binary
    endif
endif

let &cpo = s:cpo_save
unlet s:cpo_save s:type
