if did_filetype()
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

if executable('file')
    silent let s:osname = system('uname -s')
    if s:osname == 'Darwin'	" Mac OS X
	let s:mimearg = 'I'
    else
	let s:mimearg = 'i'
    endif
    silent let s:type = system('file -b'
		\ . s:mimearg . 'Lp ' . shellescape(expand('%:p')))
    if (!v:shell_error) && s:type =~ '\<charset=binary\>'
		\ && s:type !~ '^inode'
		\ && s:type !~ '\<application/x-empty\>'
	setfiletype binary
    endif
endif

let &cpo = s:cpo_save
unlet s:cpo_save s:type
