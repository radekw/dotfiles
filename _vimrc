set backspace=indent,eol,start
set history=100
set ruler
set showcmd
set incsearch
if !exists("syntax_on")
  syntax on
endif

set nu
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set mouse=a
set fileformat=unix
set fileformats=unix,dos,mac
set dir=/tmp
set bdir=/tmp
"colorscheme desert
"colorscheme darkblue
set guifont=Monaco:h11
set ch=2

autocmd Filetype default set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd Filetype yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd Filetype json set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd Filetype ruby set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd Filetype python set tabstop=4 softtabstop=4 shiftwidth=4 expandtab commentstring=#\ %s
autocmd Filetype bash set tabstop=4 softtabstop=4 shiftwidth=4 expandtab commentstring=#\ %s
autocmd Filetype sh set tabstop=4 softtabstop=4 shiftwidth=4 expandtab commentstring=#\ %s
autocmd Filetype javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd Filetype terraform set tabstop=2 softtabstop=2 shiftwidth=2 expandtab commentstring=#\ %s
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4 commentstring=#\ %s
autocmd Filetype groovy set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=0

execute pathogen#infect()

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

let g:vim_json_syntax_conceal = 0

" highlight extra spaces
highlight ExtraTrailingWhitespace ctermbg=red guibg=red
match ExtraTrailingWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraTrailingWhitespace /\s\+$/
autocmd InsertEnter * match ExtraTrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraTrailingWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" no md folding
set nofoldenable
