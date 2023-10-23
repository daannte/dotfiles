local vim_modes = {
	n = "n",
	i = "i",
	v = "v",
}

local default_opts = {
	silent = true,
	noremap = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
	local all_opts = opts
	if all_opts == nil then
		all_opts = {}
	end
	for k, v in pairs(default_opts) do
		all_opts[k] = all_opts[k] or v
	end
	return all_opts
end

--- @param vimmode (string|nil)
--- @return string
local get_mode = function(vimmode)
	local mode_string = vim_modes[vimmode]
	if mode_string == nil then
		return "n"
	end
	return mode_string
end

--- @param command (string)
--- @return string
local get_cmd_string = function(command)
	if string.sub(command, 1, 1) == ":" then
		return command .. [[<CR>]]
	end
	return command
end

--- @param vimmode (string|nil)
--- @param keymaps string String
--- @param command string String
--- @param options (table|nil)
--- @return nil
local mapkey = function(vimmode, keymaps, command, options)
	local mode = get_mode(vimmode)
	local cmd = get_cmd_string(command)
	local opts = get_opts(options)

	vim.keymap.set(mode, keymaps, cmd, opts)
end

return { mapkey = mapkey }
