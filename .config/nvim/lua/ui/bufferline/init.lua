local M = {}

local createTab = function(tabnr)
  local current_tab = vim.fn.tabpagenr()
  local tab = tabnr
  local file_name = vim.fn.fnamemodify(vim.fn.bufname(vim.fn.tabpagebuflist(tabnr)[1]), ":t")

  if file_name ~= "" then
    if tabnr == current_tab then
      tab = "%#BufflineCurrentTab#" .. " " .. file_name .. " "
    else
      tab = "%#BufflineTab#" .. " " .. file_name .. " "
    end
  else
    if tabnr == current_tab then
      tab = "%#BufflineCurrentTab#" .. " [No Name] "
    else
      tab = "%#BufflineTab#" .. " [No Name] "
    end
  end

  return tab .. "%X" .. "%#BufflineEmptyColour#"
end


M.getTabline = function()
  local num_tabs = vim.fn.tabpagenr("$")
  if num_tabs <= 1 then
    return ""
  end

  local tabline = ""
  for tabnr = 1, num_tabs do
    tabline = tabline .. createTab(tabnr)
  end

  return tabline
end

M.setup = function()
  vim.o.showtabline = 2
  vim.o.tabline = "%!v:lua.require('ui.bufferline').getTabline()"
end

return M
