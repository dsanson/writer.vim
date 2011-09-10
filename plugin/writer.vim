" Vim plugin for writing prose
" Last Change:	2011-08-02
" Maintainer:	Honza Pokorny <me@honza.ca>
" License:	BSD license

if exists("w:loaded_writer")
    finish
endif

let w:loaded_writer = 1
let w:writer_on = 0

let w:save_cpo = &cpo
set cpo&vim

function! w:Toggle()
    if has('gui')
        if (w:writer_on == 0)
			let w:savedfont = &guifont
            let w:numbers = &number
			let w:relative = &relativenumber
			let w:spacing = &linespace
			let w:cursor = &cursorline
			let w:width = &textwidth
			let w:status = &laststatus
			let w:display = &display
			let w:backspace = &backspace
			let w:joinspace = &joinspaces

            if exists('g:writer_guifont')
				exe ":set guifont=" . g:writer_guifont
			else
				set guifont=Monaco:h15
		    endif	
            set nonumber
            set norelativenumber
            set linespace=5
            set nocursorline
            set textwidth=75
            set laststatus=0
			set display=lastline
			set backspace=indent,eol,start
            let w:writer_on = 1
        else
            exe ":set guifont=" . w:savedfont
            exe ":set linespace=" . w:spacing
            exe ":set textwidth=" . w:width
            exe ":set laststatus=" . w:status
			exe ":set display=" . w:display
			exe ":set backspace=" . w:backspace
            if (w:numbers == 1)
                set number
            endif
            if (w:relative == 1)
                set relativenumber
            endif
            if (w:cursor == 1)
                set cursorline
            endif
			if (w:joinspace == 1)
				set joinspaces
			endif
            let w:writer_on = 0
        endif
    else
        echo 'no gui, sorry'
    endif
endfunction

if !exists(":WriterToggle")
    command -nargs=0 WriterToggle :call w:Toggle()
endif

let &cpo = w:save_cpo
