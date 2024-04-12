return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    main = "rainbow_delimiters",
    opts = {},
    config = function() require("rainbow-delimiters.setup").setup {} end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      -- -- uncomment for column zebra-striping instead
      -- local highlight = {
      --   "CursorColumn",
      --   "Whitespace",
      -- }
      -- require("ibl").setup {
      --   indent = { highlight = highlight, char = "" },
      --   whitespace = {
      --     highlight = highlight,
      --     remove_blankline_trail = false,
      --   },
      --   scope = { enabled = false },
      -- }
      -- -- require("ibl").setup()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      -- local highlightIndent = {
      --   "RainbowRedIndent",
      --   "RainbowYellowIndent",
      --   "RainbowBlueIndent",
      --   "RainbowOrangeIndent",
      --   "RainbowGreenIndent",
      --   "RainbowVioletIndent",
      --   "RainbowCyanIndent",
      -- }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        -- vim.api.nvim_set_hl(0, "RainbowRedIndent", { fg = "#E06C75" })
        -- vim.api.nvim_set_hl(0, "RainbowYellowIndent", { fg = "#E5C07B" })
        -- vim.api.nvim_set_hl(0, "RainbowBlueIndent", { fg = "#61AFEF" })
        -- vim.api.nvim_set_hl(0, "RainbowOrangeIndent", { fg = "#D19A66" })
        -- vim.api.nvim_set_hl(0, "RainbowGreenIndent", { fg = "#98C379" })
        -- vim.api.nvim_set_hl(0, "RainbowVioletIndent", { fg = "#C678DD" })
        -- vim.api.nvim_set_hl(0, "RainbowCyanIndent", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        scope = { highlight = highlight, char = "┃" },
        indent = { highlight = highlight, char = "┆" },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}