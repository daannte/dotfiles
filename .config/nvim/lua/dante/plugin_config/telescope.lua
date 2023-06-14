local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    prompt_prefix = ' > ',
    layout_config = {
      horizontal = {
        preview_width = 0.50,
        results_width = 0.8,
      }
    },
    path_display = { "truncate" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      }
    },
  },
}
