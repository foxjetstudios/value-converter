-- Put this in ReplicatedStorage > ValueConverter.lua

local ValueConverter = {}

-- Time

function ValueConverter.SecondsToDHMS(seconds: number, includeSeconds: boolean?): string
	seconds = math.max(0, math.floor(seconds))
	includeSeconds = includeSeconds ~= false

	local days = math.floor(seconds / 86400)
	local hours = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	local secs = seconds % 60

	local parts = {}

	if days > 0 then table.insert(parts, days .. "d") end
	if hours > 0 then table.insert(parts, hours .. "h") end
	if minutes > 0 then table.insert(parts, minutes .. "m") end

	if includeSeconds and (secs > 0 or #parts == 0) then
		table.insert(parts, secs .. "s")
	end

	return #parts > 0 and table.concat(parts, " ") or "0s"
end

function ValueConverter.SecondsToCompact(seconds: number): string
	seconds = math.max(0, math.floor(seconds))

	local days = math.floor(seconds / 86400)
	local hours = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)

	local parts = {}
	if days > 0 then table.insert(parts, days .. "d") end
	if hours > 0 then table.insert(parts, hours .. "h") end
	if minutes > 0 or #parts == 0 then table.insert(parts, minutes .. "m") end

	return table.concat(parts, " ")
end

function ValueConverter.MinutesToHM(minutes: number): string
	minutes = math.max(0, math.floor(minutes))
	local hrs = math.floor(minutes / 60)
	local mins = minutes % 60
	return string.format("%02d:%02d", hrs, mins)
end

-- Numbers

function ValueConverter.NumberWithCommas(num: number): string
	local s = tostring(math.floor(num))
	local k
	repeat
		s, k = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
	until k == 0
	return s
end

function ValueConverter.ShortenNumber(num: number, decimals: number?): string
	decimals = decimals or 1
	local absNum = math.abs(num)

	local function format(value, suffix)
		local str = string.format("%." .. decimals .. "f", value)
		str = str:gsub("%.?0+$", "")
		return str .. suffix
	end

	if absNum >= 1e12 then
		return format(num / 1e12, "T")
	elseif absNum >= 1e9 then
		return format(num / 1e9, "B")
	elseif absNum >= 1e6 then
		return format(num / 1e6, "M")
	elseif absNum >= 1e3 then
		return format(num / 1e3, "K")
	else
		return tostring(num)
	end
end

function ValueConverter.Percentage(part: number, total: number, decimals: number?): string
	if total <= 0 then return "0%" end
	decimals = decimals or 1
	return string.format("%." .. decimals .. "f%%", (part / total) * 100)
end

-- Storage / Data

function ValueConverter.BytesToReadable(bytes: number, decimals: number?): string
	bytes = math.max(0, bytes)
	decimals = decimals or 2

	if bytes < 1024 then
		return bytes .. " B"
	end

	local units = { "KB", "MB", "GB", "TB", "PB" }
	local size = bytes
	local index = 1

	while size >= 1024 and index < #units do
		size /= 1024
		index += 1
	end

	return string.format("%." .. decimals .. "f %s", size, units[index])
end

-- Distance

function ValueConverter.MetersToKilometers(meters: number, decimals: number?): string
	decimals = decimals or 2
	return string.format("%." .. decimals .. "f km", meters / 1000)
end

function ValueConverter.KilometersToMiles(km: number, decimals: number?): string
	decimals = decimals or 2
	return string.format("%." .. decimals .. "f mi", km * 0.621371)
end

function ValueConverter.MilesToKilometers(miles: number, decimals: number?): string
	decimals = decimals or 2
	return string.format("%." .. decimals .. "f km", miles / 0.621371)
end

-- Temperature

function ValueConverter.CelsiusToFahrenheit(c: number): number
	return (c * 9 / 5) + 32
end

function ValueConverter.FahrenheitToCelsius(f: number): number
	return (f - 32) * 5 / 9
end

function ValueConverter.CelsiusToKelvin(c: number): number
	return c + 273.15
end

function ValueConverter.KelvinToCelsius(k: number): number
	return k - 273.15
end

-- Boolean

function ValueConverter.BoolToYesNo(value: boolean): string
	return value and "Yes" or "No"
end

function ValueConverter.BoolToOnOff(value: boolean): string
	return value and "On" or "Off"
end

-- new functions

function ValueConverter.Clamp(num: number, min: number, max: number): number
	return math.clamp(num, min, max)
end

function ValueConverter.Round(num: number, decimals: number?): number
	decimals = decimals or 0
	local factor = 10 ^ decimals
	return math.floor(num * factor + 0.5) / factor
end

function ValueConverter.IsWithin(num: number, min: number, max: number): boolean
	return num >= min and num <= max
end

function ValueConverter.FormatCurrency(amount: number, symbol: string?, decimals: number?): string
	symbol = symbol or "$"
	decimals = decimals or 2
	local formatted = ValueConverter.NumberWithCommas(ValueConverter.Round(amount, decimals))
	return symbol .. formatted
end

return ValueConverter
