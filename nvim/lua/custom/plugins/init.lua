-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    '42Paris/42header',
    lazy = false,
    init = function()
      vim.g.user42 = 'tozaki'
      vim.g.mail42 = 'tozaki@student.42.fr'
    end,
  },
}
