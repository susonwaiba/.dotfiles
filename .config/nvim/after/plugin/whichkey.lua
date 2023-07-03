local wk = require("which-key")

wk.register({
	f = { name = "+Find" },

	T = { name = "+Todo" },
	x = { name = "+Trouble" },

	n = { name = "+Notes" },
	["nw"] = { name = "+Workspace" },
	["nm"] = { name = "+Mode" },

	l = { name = "+LSP" },
	["ls"] = { name = "+LSP Symbol" },
	d = { name = "+Diagnostic" },

	w = { name = "+Workspace" },

	g = { name = "+Git" },

	h = { name = "+Harpoon" },

	r = { name = "+Run" },

}, { prefix = "<leader>" })

