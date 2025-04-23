return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Use the latest version
    opts = {
      -- Add any custom options here
      provider = "claude",
      claude = {
        endpoint = "https:/api.anthropic.com",
        model = "claude-3-7-latest"
      }
    },
    build = "make", -- If you want to build from source, use "make BUILD_FROM_SOURCE=true"
    dependencies = {
      -- Core dependencies
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",

      -- Optional dependencies
      "nvim-tree/nvim-web-devicons", -- For file icons
      "zbirenbaum/copilot.lua",      -- For 'copilot' provider

      -- Image pasting support
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true, -- Required for Windows users
          },
        },
      },

      -- Markdown rendering support
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
