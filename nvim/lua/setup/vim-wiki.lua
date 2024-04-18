vim.api.nvim_exec2([[
  function! VimwikiLinkHandler(link)
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
  endfunction
]], {})
vim.cmd [[

  let g:vimwiki_key_mappings =
  \ {
  \ 'headers': 0,
  \ 'text_objs': 0,
  \ }

  set backupdir=$HOME/tmp
]]

