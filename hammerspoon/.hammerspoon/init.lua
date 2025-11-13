-- Constants
MODIFIERS = { "cmd" } -- Modifiers used for app shortcuts

-- App configuration
APPS = {
	{ shortcut = "1", name = "Ghostty" },
	{ shortcut = "2", name = "Safari" },
	{ shortcut = "3", name = "Xcode" },
	{ shortcut = "4", name = "Simulator" },
	{ shortcut = "5", name = "Finder" },
	{ shortcut = "6", name = "Notes" },
}

-- Bind application shortcuts
for _, app in ipairs(APPS) do
	hs.hotkey.bind(MODIFIERS, app.shortcut, function()
		hs.application.launchOrFocus(app.name)
	end)
end
