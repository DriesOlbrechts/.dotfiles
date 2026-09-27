-- Two-step picker for monorepos: pick a project, then find/grep inside it.

---@type table<string, true> a directory holding one of these is a project
local MARKERS = {
	["package.json"] = true,
	["Cargo.toml"] = true,
	["go.mod"] = true,
	["composer.json"] = true,
	["pyproject.toml"] = true,
}

---@type table<string, true> never descend into these
local PRUNE = {
	[".git"] = true,
	["node_modules"] = true,
	["vendor"] = true,
	["target"] = true,
	["dist"] = true,
	["build"] = true,
}

---@class dodo.monorepo.Config: snacks.picker.Config
---@field markers? table<string, true> override the marker files
---@field prune? table<string, true> override the pruned directories
---@field depth? number how deep below the root to look

---@type string[] MARKERS as a list, for the upward vim.fs.root lookup
local MARKER_NAMES = vim.tbl_keys(MARKERS)

--- The monorepo root: git toplevel of the current buffer, else the cwd.
local function root()
	return vim.fs.normalize(vim.fs.root(0, ".git") or vim.fn.getcwd())
end

--- The project the current buffer sits in: nearest ancestor holding a marker.
--- Clamped to the repo, since an unnamed buffer (or a stray ~/package.json)
--- otherwise resolves the "project" to somewhere above it, like $HOME.
local function project()
	local cwd = root()
	local found = vim.fs.root(0, MARKER_NAMES)
	if not found then
		return cwd
	end
	found = vim.fs.normalize(found)
	return (found == cwd or vim.startswith(found, cwd .. "/")) and found or cwd
end

---@type dodo.monorepo.Config
local source = {
	---@type snacks.picker.finder
	finder = function(opts)
		local cwd = root()
		local markers, prune = opts.markers or MARKERS, opts.prune or PRUNE
		local items, seen = {}, {} ---@type snacks.picker.finder.Item[], table<string, true>
		for path, type in vim.fs.dir(cwd, {
			depth = opts.depth or 4,
			-- note: vim.fs.dir hands skip a path relative to cwd, not a basename
			skip = function(rel)
				return not prune[vim.fs.basename(rel)]
			end,
		}) do
			local dir = vim.fs.dirname(path)
			-- "." is the monorepo root itself, not one of its projects
			if type == "file" and markers[vim.fs.basename(path)] and dir ~= "." and not seen[dir] then
				seen[dir] = true
				items[#items + 1] = { cwd = cwd, file = dir, text = dir, dir = true }
			end
		end
		return items
	end,
	format = "file",
	confirm = "monorepo_files",
	actions = {
		monorepo_files = function(picker, item)
			picker:close()
			if item then
				Snacks.picker.files({ cwd = Snacks.picker.util.path(item) })
			end
		end,
		monorepo_grep = function(picker, item)
			picker:close()
			if item then
				Snacks.picker.grep({ cwd = Snacks.picker.util.path(item) })
			end
		end,
	},
	win = {
		input = {
			keys = {
				["<c-g>"] = { "monorepo_grep", mode = { "n", "i" }, desc = "Grep in Project" },
			},
		},
	},
}

local M = {
	source = source,
	keys = {
		{
			"<leader>fm",
			function()
				Snacks.picker.pick("monorepo")
			end,
			desc = "find file in monorepo project",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.files({ cwd = project() })
			end,
			desc = "find files in the current file's project",
		},
		{
			"<leader>sP",
			function()
				Snacks.picker.grep({ cwd = project() })
			end,
			desc = "ripgrep over the current file's project",
		},
	},
}

return M
