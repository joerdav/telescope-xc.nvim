# WIP: telescope-xc.nvim

This is an extension for the telescope neovim plugin. To run `xc` tasks using telescope.

What is `xc`? <https://xcfile.dev/>

What is telescope? <https://github.com/nvim-telescope/telescope.nvim>

## Installation

`xc` should be installed and available in your `PATH`. 

- <https://xcfile.dev/getting-started/#installation>

Use [lazy.nvim](https://github.com/folke/lazy.nvim)

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "joerdav/telescope-xc.nvim" },
        },
        config = function()
            require("telescope").setup()
            require("telescope").load_extension("xc")
            vim.keymap.set('v', '<leader>xc', require("telescope").extensions["xc"].run_task)
        end
    }
