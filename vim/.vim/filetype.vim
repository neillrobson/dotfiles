if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.hx setf haxe
    au! BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx setf j
    au! BufRead,BufNewFile *.journal setf ledger
augroup end
