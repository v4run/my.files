-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local clientkeys = gears.table.join(
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey, "Control" }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		-- awful.key({ modkey }, "o", function(c)
		-- 	c:move_to_screen()
		-- end, { description = "move to screen", group = "client" }),
		-- awful.key({ modkey }, "t", function(c)
		-- 	c.ontop = not c.ontop
		-- end, { description = "toggle keep on top", group = "client" }),
		-- awful.key({ modkey }, "n", function(c)
		-- 	-- The client currently has the input focus, so it cannot be
		-- 	-- minimized, since minimized clients can't have the focus.
		-- 	c.minimized = true
		-- end, { description = "minimize", group = "client" }),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		-- awful.key({ modkey, "Control" }, "m", function(c)
		-- 	c.maximized_vertical = not c.maximized_vertical
		-- 	c:raise()
		-- end, { description = "(un)maximize vertically", group = "client" }),
		-- awful.key({ modkey, "Shift" }, "m", function(c)
		-- 	c.maximized_horizontal = not c.maximized_horizontal
		-- 	c:raise()
		-- end, { description = "(un)maximize horizontally", group = "client" })
		awful.key({ modkey, "Shift" }, ".", function(c)
			c:move_to_screen(1)
		end, { description = "move client to the next screen", group = "screen" }),
		awful.key({ modkey, "Shift" }, ",", function(c)
			c:move_to_screen(-1)
		end, { description = "move client to the previous screen", group = "screen" }),
		awful.key({ modkey }, "Return", function(c)
			local master = awful.client.getmaster()
			if c.window == master.window then
				-- TODO: Fix tiled_clients order issue
				-- if #c.screen.clients <= 1 then
				-- 	return
				-- end
				-- local next_client = c.screen.tiled_clients[2]
				-- c:swap(next_client)
				local next_client
				-- find the first cilent with the same tag
				for _, current_client in ipairs(client.get()) do
					if
						current_client.window ~= c.window
						and current_client.first_tag.name == c.first_tag.name
						and current_client.screen.index == c.screen.index
					then
						next_client = current_client
						break
					end
				end
				if next_client then
					c:swap(next_client)
					next_client:emit_signal("request::activate", "master_swap")
				end
			else
				c:swap(master)
			end
		end, { description = "move to master", group = "client" })
	)

	return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_)
		return _M.get()
	end,
})
