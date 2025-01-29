return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },
  {
    "echasnovski/mini.files",
    keys = {
      { "<leader>e", "<leader>fm", desc = "Open mini.files (Directory of Current File)", remap = true },
      { "<leader>E", "<leader>fM", desc = "Open mini.files (cwd)", remap = true },
    },
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
}
