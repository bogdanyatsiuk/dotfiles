stackline = require "stackline"
stackline:init()

-- bind alt+shift+t to toggle stackline icons
hs.hotkey.bind({'alt', 'shift'}, 't', function()
    stackline.config:toggle('appearance.showIcons')
end)
