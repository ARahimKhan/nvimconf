return {
  "ARahimKhan/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "qwen35",
      },
      inline = {
        adapter = "qwen25",
      },
    },
    adapters = {
      qwen2 = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen25",
          schema = {
            num_ctx = {
              default = 16384,
            },
            model = {
              default = "qwen2.5-coder:7b",
            },
          },
        })
      end,
      qwen3 = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen35",
          schema = {
            num_ctx = {
              default = 16384,
            },
            model = {
              default = "qwen3.5:4b",
            },
          },
        })
      end,
    },
    opts = {
      log_level = "DEBUG",
    },
    display = {
      diff = {
        enabled = true,
        layout = "vertical", -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
    },
  },
}
