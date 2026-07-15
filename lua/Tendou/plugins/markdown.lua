return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- หรือ nvim-web-devicons
    opts = {
        heading = {
            sign = true,
            icons = { ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ' },
        },
    },
}
