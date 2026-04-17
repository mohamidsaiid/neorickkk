return {
  "romus204/tree-sitter-manager.nvim",
  config = function()
    require("tree-sitter-manager").setup({
      -- List the languages you want installed by default
      ensure_installed = { 
        "c", "lua", "vim", "vimdoc", "query", 
        "markdown", "markdown_inline", "python", "javascript" 
      },
      
      -- Automatically install missing parsers when opening a new file
      auto_install = true,
      
      -- Enable native Treesitter highlighting
      highlight = true,
    })
  end
}
