local highlights = require('themes.hl')
local function setup(theme)
  local colours = require('themes.schemes.' .. theme).colours
  highlights.highlight_all(colours)
end

return { setup = setup }
