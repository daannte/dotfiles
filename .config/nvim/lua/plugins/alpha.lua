local config = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	local logo = [[
	               ▄▄██████████▄▄             
	               ▀▀▀   ██   ▀▀▀             
	       ▄██▄   ▄▄████████████▄▄   ▄██▄     
	     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   
	    ████▄ ▄███▀              ▀███▄ ▄████  
	   ███▀█████▀▄████▄      ▄████▄▀█████▀███ 
	   ██▀  ███▀ ██████      ██████ ▀███  ▀██ 
	    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  
	       ███           ▀▀           ███     
	       ██████████████████████████████     
	   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ 
	   ███  ███ ███   ██    ██   ███▄███  ███ 
	   ▀██▄████████   ██    ██   ████████▄██▀ 
	    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  
	     ▀███▄  ▀███████    ███████▀  ▄███▀   
	       ▀███    ▀▀██████████▀▀▀   ███▀     
	         ▀    ▄▄▄    ██    ▄▄▄    ▀       
	               ▀████████████▀             
]]

	dashboard.section.header.val = vim.split(logo, "\n")

	dashboard.section.buttons.val = {
		dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
		dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
		dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
	}

	dashboard.config.opts.noautocmd = true

	alpha.setup(dashboard.config)
end

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = config,
}
