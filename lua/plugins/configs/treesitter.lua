local options = {
  ensure_installed = { "lua", "vim", "vimdoc" },

  highlight = {
    enable = true, -- On réessaie le highlight
    use_languagetree = false,
  },

  indent = { enable = false }, -- ON DÉSACTIVE L'INDENTATION (souvent la cause du crash 'range')
}

return options
