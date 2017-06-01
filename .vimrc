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
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set softtabstop=4

" $B8!:w;~%G%U%)%k%H$G(Bvery magic
"nnoremap / /\v
" Ctrl+A$B$GA4J8A*Br(B
nnoremap <C-a> ggVG
