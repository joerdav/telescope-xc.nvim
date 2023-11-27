local M = {}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require('telescope.config').values

function M.run_task(opts)
	opts = opts or {}
	local handle = io.popen("xc -short")

	if (handle == nil) then
		print('could not run xc')
		return
	end
	local output = handle:read("*a")
	handle:close()


	local list = {}
	for token in string.gmatch(output, "[^%c]+") do
		table.insert(list, token)
	end
	pickers.new(opts, {
		prompt_title = "tasks",
		finder = finders.new_table {
			results = list
		},
		previewer = require("telescope.previewers").new_termopen_previewer {
			get_command = function(entry)
				local task = entry.value
				return { "xc", "-d", task }
			end,
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if selection == nil then
					return
				end
				local xc_task_command = '!xc ' .. selection[1]
				vim.api.nvim_exec2(xc_task_command, {})
			end)
			return true
		end,
	}):find()
end

return M
