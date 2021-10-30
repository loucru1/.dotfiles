" Find files using Telescope command-line sugar.
nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap  <silent> ;b <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap  <silent> ;g <cmd>lua require('loucru1.telescope').git_branches()<cr>
nnoremap  <silent> ;t  <cmd>TodoTelescope<cr>
nnoremap  <silent> ;d :lua require('loucru1.telescope').search_dotfiles()<CR>
nnoremap  <silent> ;q <cmd>TodoQuickFix<cr>
nnoremap  <silent> \\ <cmd>Telescope buffers<cr>
nnoremap  <silent> ;; <cmd>Telescope help_tags<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
