" jump to this CoC settings file from anywhere: <leader>coc


" Custom node path
let g:coc_node_path = '/usr/bin/node'

" we need following CoC extensions
let g:coc_global_extensions = [
    \'coc-ccls',
    \'coc-cmake',
    \'coc-css',
    \'coc-eslint',
    \'coc-html',
    \'coc-json',
    \'coc-prettier',
    \'coc-pyright',
    \'coc-sh',
    \'coc-snippets',
    \'coc-tsserver',
    \'coc-vimlsp',
    \'coc-yaml',
    \'coc-toml',
\]

" there's a problem with coc-ccls, it doesn't property link its libraries. Let's do this manually...
silent !ln -sf $HOME/.config/coc/extensions/node_modules/coc-ccls/node_modules/ws/lib $HOME/.config/coc/extensions/node_modules/coc-ccls/lib

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" show documentation of word under cursor
" function! ShowDocumentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
function! ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" create alternative format command: Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




" Keymaps

" use K to show documentation in preview window (reqruires neoclide/coc.nvim)
nnoremap <silent> K :call ShowDocumentation()<CR>

" Use `[g` and `]g` to navigate diagnostics (requires neoclide/coc.nvim)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Show all diagnostics (requires neoclide/coc.nvim)
" nnoremap <silent> <leader>q  :<C-u>CocList diagnostics<cr>

" Manage CoC extensions (requires neoclide/coc.nvim)
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>

" Show CoC commands (requires neoclide/coc.nvim)
nnoremap <silent> <leader>cm  :<C-u>CocList commands<cr>

" Find symbol of current document (requires neoclide/coc.nvim)
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>

" Search workspace symbols (requires neoclide/coc.nvim)
nnoremap <silent> <leader>ci  :<C-u>CocList -I symbols<cr>

" " jump to next error / warning in file
" nnoremap <leader>e :call CocAction('diagnosticNext')<CR>

" jump to previous error / warning in file
nnoremap <leader>E :call CocAction('diagnosticPrevious')<CR>

" Python sort imports
nnoremap <leader>fi :CocCommand python.sortImports<CR>

" autoformat code (requires neoclide/coc.nvim)
" xmap <leader>F <Plug>(coc-format-selected)
" nmap <leader>F :LSPFormat<CR>
" nmap <leader>F :Format<CR>

" go to definition and similar (requires neoclide/coc.nvim)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" do default action for next item (requires neoclide/coc.nvim)
nnoremap <silent> <leader>J  :<C-u>CocNext<CR>

" do default action for previous item (requires neoclide/coc.nvim)
nnoremap <silent> <leader>K  :<C-u>CocPrev<CR>

" resume latest CoC list (requires neoclide/coc.nvim)
nnoremap <silent> <leader>P  :<C-u>CocListResume<CR>

" rename symbol (requires neoclide/coc.nvim)
nmap <leader>r <Plug>(coc-rename)

" go to definition (requires neoclide/coc.nvim)
" nmap <silent> <leader>d :w<CR><Plug>(coc-definition)




