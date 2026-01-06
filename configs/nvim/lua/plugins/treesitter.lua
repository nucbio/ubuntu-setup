-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,  -- Load immediately
  priority = 100,  -- Load early
  opts = {
    ensure_installed = {
      "bash", "c", "diff", "html", "lua", "luadoc",
      "markdown", "markdown_inline", "query", "vim", "vimdoc",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = { enable = false, disable = { "ruby" } },
  },
}
