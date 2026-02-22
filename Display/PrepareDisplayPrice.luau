-- PrepareDisplayPrice.lua
-- Formats a price with optional Robux icon

local ICONS = {
	Robux = ""
}

local function prepare(price: number, isRobux: boolean): string
	if typeof(price) ~= "number" or typeof(isRobux) ~= "boolean" then
		return "Buy"
	end

	if isRobux then
		return ICONS.Robux .. tostring(price)
	else
		return tostring(price)
	end
end

return prepare
