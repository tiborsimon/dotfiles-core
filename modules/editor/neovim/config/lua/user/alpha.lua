local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	-- [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

  -- [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
  -- [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
  -- [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
  -- [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
  -- [[██   ████ ███████  ██████    ████   ██ ██      ██]],

  [[                                                     ]],
  [[                                                     ]],
  [[                                                     ]],
  [[                                                     ]],
  [[                                                     ]],
  [[                                                     ]],
  [[                                                     ]],
  [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
  [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
  [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
  [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],

}
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("SPC f f", "  Find file"),
	dashboard.button("SPC f r", "  Recently used files"),
	dashboard.button("SPC p", "  Find project"),
	dashboard.button("SPC / l", "  Find text"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
}

-- dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
