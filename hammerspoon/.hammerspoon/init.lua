-- Constants
MODIFIERS = { "cmd" } -- Modifiers used for app shortcuts

-- App configuration
APPS = {
	{ shortcut = "`", name = "Ghostty" },
	{ shortcut = "1", name = "Xcode" },
	{ shortcut = "2", name = "Simulator" },
	{ shortcut = "3", name = "Safari" },
	{ shortcut = "4", name = "Finder" },
	{ shortcut = "5", name = "Notes" },
}

-- Bind application shortcuts
for _, app in ipairs(APPS) do
	hs.hotkey.bind(MODIFIERS, app.shortcut, function()
		hs.application.launchOrFocus(app.name)
	end)
end

