"-------Format--------
""自動インデントを有効化する
set smartindent
set autoindent

"-------Look&Feel--------
set title
syntax on
set number
set cursorline
set hlsearch

"-------tab--------
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭のTab文字の表示幅（スペースいくつ分）
set shiftwidth=2
set encoding=utf-8
set fileformats=unix,dos,mac
set softtabstop=4

" 検索を必ずvery magicにする
nnoremap / /\v
" Ctrl+Aで全文選択する
nnoremap <C-a> ggVG
