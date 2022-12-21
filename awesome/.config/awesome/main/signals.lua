-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
-- require("deco.titlebar")

-- reading
-- https://awesomewm.org/apidoc/classes/signals.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- focus next client in screen when the currently focussed client is closed
client.connect_signal("unmanage", function(c)
	naughty.notify({ text = tostring(c.name) })
	local next_client = c.screen.clients[1]
	if next_client then
		next_client:emit_signal("request::activate", "client_unmanaged")
	end
end)

-- focus a client when it gets tagged
client.connect_signal("tagged", function(c)
	local visible_clients = c.screen.clients
	if not visible_clients then
		return
	end
	local client_found = false
	for _, cl in ipairs(visible_clients) do
		if cl.window == c.window then
			client_found = true
			break
		end
	end
	if client_found then
		-- if the client is visible in the new screen
		-- usually happens when moving clients between screens
		c:emit_signal("request::activate", "client_tagged")
	else
		-- client is moved to a different tag
		local next_client = visible_clients[1]
		if not next_client then
			return
		end
		next_client:emit_signal("request::activate", "client_tagged")
	end
end)

-- focus first client on tag switch
tag.connect_signal("property::selected", function(t)
	if not t.selected then
		return
	end
	local c = t.screen.clients[1]
	if c then
		c:emit_signal("request::activate", "tag_switch")
	end
end)
-- }}}
