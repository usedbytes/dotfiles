
function! s:Ffiles(fname)
	let l:fnames = split(system('find ' . $SEARCH_PATHS . ' -name '.a:fname), "\n")
	let l:nitems = len(l:fnames)
	if (l:nitems) == 0
		echom "No files found"
		return
	elseif (l:nitems) == 1
		execute 'edit' l:fnames[0]
		return
	endif
	let l:numberedlist = ["Choose a file:"] + map(copy(l:fnames), 'string(v:key+1).": ".v:val')
	let l:chosen = inputlist(l:numberedlist)
	if l:chosen < 1 || l:chosen > nitems
		echom "Invalid index"
		return
	endif
	execute 'edit' l:fnames[l:chosen - 1]
endfunction

command! -nargs=1 Find call s:Ffiles(<f-args>)
