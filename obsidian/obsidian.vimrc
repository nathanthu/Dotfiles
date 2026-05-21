" Obsidian Vim configuration file

" Unmap space to prevent conflicts
unmap <Space>

" map j and k to to visual moves
noremap j gj
noremap k gk

" map jj to escape in insert mode   
inoremap jj <Esc>

" TODO: need to fix the pasting to also include c-c
noremap <Space>p "0p

" Does not work :(
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-l> <Right>
"inoremap <C-k> <Up>

" little trick :)
inoremap <C-h> <Esc>i
inoremap <C-j> <Esc>ji
inoremap <C-k> <Esc>ki
"inoremap <C-l> <Esc>li

noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" ----------------------------------------------------------------------------
" Folding Commands
" https://vimhelp.org/fold.txt.html#fold-commands
" ----------------------------------------------------------------------------
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>
exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

" ----------------------------------------------------------------------------
" Sidebar Management
" ----------------------------------------------------------------------------

" Toggle left side bar
exmap toggleLeftSideBar obcommand app:toggle-left-sidebar
nmap <C-n> :toggleLeftSideBar<CR>

" Toggle right side bar
exmap toggleRightSideBar obcommand app:toggle-right-sidebar
nmap <C-,> :toggleRightSideBar<CR>

" Focus the file explorer
exmap focusFileExplorer obcommand file-explorer:open
nmap <C-h> :focusFileExplorer<CR>

" Reveal the current file in the file explorer 
exmap revealActiveFile obcommand file-explorer:reveal-active-file
nmap <Space>rv :revealActiveFile<CR>

" ----------------------------------------------------------------------------
" Editor Features
" ----------------------------------------------------------------------------

" Insert code block
exmap insertCodeBlock obcommand editor:insert-codeblock
nmap <Space>bc :insertCodeBlock<CR>

" Insert math block
exmap insertMathBlock obcommand editor:insert-mathblock
nmap <Space>bm :insertMathBlock<CR>

" Toggle inline code (turn word into code when on word)
exmap toggleCode obcommand editor:toggle-code
nmap <Space>è :toggleCode<CR>

" Toggle inline math (turn expression into math when on word)
exmap toggleMath obcommand editor:toggle-inline-math
nmap <Space>$ :toggleMath<CR>

" Toggle bold (turn word into bold when on word)
exmap toggleBold obcommand editor:toggle-bold
nmap <Space>* :toggleBold<CR>

" Toggle italic (turn word into italic when on word)
exmap toggleItalic obcommand editor:toggle-italics
nmap <Space>µ :toggleItalic<CR>

" Toggle strikethrough (turn word into strikethrough when on word)
exmap toggleStrikethrough obcommand editor:toggle-strikethrough
nmap <Space>~ :toggleStrikethrough<CR>

" Toggle spell check
exmap toggleSpellcheck obcommand editor:toggle-spellcheck
nmap <Space>sc :toggleSpellcheck<CR>

" ----------------------------------------------------------------------------
" Open operations
" ----------------------------------------------------------------------------

" Open file explorer
exmap telescope obcommand darlal-switcher-plus:switcher-plus:open
nmap <Space>ff :telescope<CR>

" Open omnisearch all files
exmap globalSearch obcommand omnisearch:show-modal
nmap <Space>gg :globalSearch<CR>

" Open omnisearch in file
exmap infileSearch obcommand omnisearch:show-modal-infile
nmap <Space>fd :infileSearch<CR>

" Open command palette
exmap openPalette obcommand command-palette:open
nmap <Space>op :openPalette<CR>

exmap openSettings obcommand app:open-settings
nmap <Space>os :openSettings<CR>

" Open graph
exmap openGraph obcommand graph:open
nmap <Space>og :openGraph<CR>
 

" ----------------------------------------------------------------------------
" Tab Management
" ----------------------------------------------------------------------------

" Close current tab
exmap closeTab obcommand workspace:close
nmap <Space>x :closeTab<CR>

" Go to tab n+1
exmap nextTab obcommand workspace:next-tab
nmap <Tab> :nextTab<CR>

" Go to tab n-1
exmap previousTab obcommand workspace:previous-tab
nmap <S-Tab> :previousTab<CR>

" Go to previous tab, navigate back in timeline
exmap navigateBack obcommand app:go-back
nmap H :navigateBack<CR>

" Go to next tab, navigate forward in timeline
exmap navigateForward obcommand app:go-forward
nmap L :navigateForward<CR>

" Open link in new tab
exmap openLeaf obcommand editor:open-link-in-new-leaf
nmap gf :openLeaf<CR>

" Go back tab
exmap goBack obcommand app:go-back
nmap H :goBack<CR>

" Go forward tab
exmap goForward obcommand app:go-forward
nmap L :goForward<CR>

" ----------------------------------------------------------------------------
" File Editing
" ----------------------------------------------------------------------------

" Edit file title
exmap editTitle obcommand workspace:edit-file-title
nmap <Space>t :editTitle<CR>

" Delete file
exmap deleteFile obcommand app:delete-file
nmap <Space>d :deleteFile<CR>

" Yank to system clipboard
set clipboard=unnamedplus

" ----------------------------------------------------------------------------
" Headings
" ----------------------------------------------------------------------------

exmap setHeading0 obcommand editor:set-heading-0
nmap <Space>h² :setHeading0<CR>

exmap setHeading1 obcommand editor:set-heading-1
nmap <Space>h& :setHeading1<CR>

exmap setHeading2 obcommand editor:set-heading-2
nmap <Space>hé :setHeading2<CR>

exmap setHeading3 obcommand editor:set-heading-3
nmap <Space>h" :setHeading3<CR>

exmap setHeading4 obcommand editor:set-heading-4
nmap <Space>h' :setHeading4<CR>

exmap setHeading5 obcommand editor:set-heading-5
nmap <Space>h( :setHeading5<CR>

exmap setHeading6 obcommand editor:set-heading-6
nmap <Space>h- :setHeading6<CR>
