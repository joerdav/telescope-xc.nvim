local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local xc = require("xc")

return telescope.register_extension {
	config = function()

	end,
	exports = {
		run_task = xc.run_task,
	},
}
