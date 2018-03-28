inoremap <silent> <buffer> <C-@>
    \ <C-r>=ledger#autocomplete_and_align()<CR>
vnoremap <silent> <buffer> <C-@> :LedgerAlign<CR>
