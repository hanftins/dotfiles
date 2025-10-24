-- Constants
MODIFIERS = {"cmd"}    -- Modifiers used for app shortcuts

-- App configuration
APPS = {
  {shortcut = "1", name = "Ghostty"},
  {shortcut = "2", name = "Xcode"},
  {shortcut = "3", name = "Safari"},
  {shortcut = "4", name = "Notes"},
  {shortcut = "5", name = "Finder"},
}

-- Bind application shortcuts
for _, app in ipairs(APPS) do
  hs.hotkey.bind(MODIFIERS, app.shortcut, function()
    hs.application.launchOrFocus(app.name)
  end)
end