let vimsettings = "~/.vim/settings"
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, "*.vim"), "\n")

  if (fpath == expand(vimsettings) . "/set-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  exe 'source' fpath
endfor
