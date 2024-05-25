vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Git Branch",
  callback = function()
    local git = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
    if git then
      local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
      vim.b.git_branch = branch
    else
      vim.b.git_branch = ""
    end
  end,
})
