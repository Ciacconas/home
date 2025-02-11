local mp = require("mp")
local decay_delay = 0.05 -- rate of time by which playback speed is decreased
local osd_duration = math.max(decay_delay, mp.get_property_number("osd-duration") / 1000)
local auto_dec_timer = nil

local fast_speed = 2.8
local slow_speed = 0.3

-- local rubberband_af = {
-- 	{ name = "rubberband", enabled = true, params = { channels = "together", transients = "smooth" } },
-- }

local function grad_dec_speed()
	local new_speed = mp.get_property("speed") - 0.1

	if new_speed < slow_speed then
		-- mp.osd_message("bottom", osd_duration)
		new_speed = slow_speed
		if auto_dec_timer ~= nil then
			auto_dec_timer:kill()
		end
	end

	mp.set_property("speed", new_speed)
	mp.osd_message((">> x%.1f"):format(new_speed), osd_duration)
end

local function grad_dec_speed_to_1()
	local new_speed = mp.get_property("speed") - 0.1

	if new_speed < 1 then
		-- mp.osd_message("bottom", osd_duration)
		new_speed = 1
		if auto_dec_timer ~= nil then
			auto_dec_timer:kill()
		end
	end

	mp.set_property("speed", new_speed)
	mp.osd_message((">> x%.1f"):format(new_speed), osd_duration)
end

local function auto_down_speed()
	auto_dec_timer = mp.add_periodic_timer(decay_delay, grad_dec_speed)
end
local function auto_down_speed_to_1()
	auto_dec_timer = mp.add_periodic_timer(0.02, grad_dec_speed_to_1)
end

local function fast_play(table)
	if table == nil or table["event"] == "down" then --or table["event"] == "repeat" then
		if auto_dec_timer ~= nil then
			auto_dec_timer:kill()
		end
		mp.set_property("speed", fast_speed)
		mp.osd_message((">> x%.1f"):format(fast_speed), osd_duration)
	elseif table["event"] == "up" then
		auto_down_speed_to_1()
		-- mp.set_property("speed", 1.0)
		-- mp.osd_message("1.0x", osd_duration)
	end
end

local function slow_play(table)
	if table == nil or table["event"] == "down" then -- or table["event"] == "repeat" then
		-- mp.set_property_native("af", rubberband_af)
		-- mp.osd_message(mp.get_property("af"))
		auto_down_speed()
	elseif table["event"] == "up" then
		if auto_dec_timer ~= nil then
			auto_dec_timer:kill()
		end
		mp.set_property("speed", 1.0)
		mp.osd_message("1.0x", osd_duration)
		-- mp.osd_message("xxxxxx", osd_duration)
	end
end

mp.add_forced_key_binding("MBTN_RIGHT", "hold_slow_mouse", slow_play, { complex = true, repeatable = false })
mp.add_forced_key_binding("MBTN_LEFT", "hold_fast_mouse", fast_play, { complex = true, repeatable = false })
mp.add_forced_key_binding("Ctrl+LEFT", "hold_slow", slow_play, { complex = true, repeatable = false })
mp.add_forced_key_binding("Ctrl+RIGHT", "hold_fast", fast_play, { complex = true, repeatable = false })

local function show_af(table)
	-- mp.osd_message("1231424", osd_duration)
	mp.osd_message(mp.get_property("af"), osd_duration)
end
mp.add_forced_key_binding("ALT+y", "show_af", show_af, { complex = true, repeatable = false })
