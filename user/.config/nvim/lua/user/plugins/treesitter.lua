local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "clojure",
      "cmake",
      "comment",
      "cpp",
      "css",
      "cuda",
      "dart",
      "dockerfile",
      "dot",
      "elixir",
      "erlang",
      "fish",
      "go",
      "graphql",
      "haskell",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "julia",
      "kotlin",
      "latex",
      "llvm",
      "lua",
      "make",
      "markdown",
      "python",
      -- "tree-sitter-query",
      "r",
      "regex",
      "rust",
      "scss",
      "solidity",
      "swift",
      "todotxt",
      "toml",
      "tsx",
      "typescript",
      "verilog",
      "vim",
      "yaml",
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
