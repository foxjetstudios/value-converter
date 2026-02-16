-- Put this in ReplicatedStorage > ValueConverter.lua

local ValueConverter = {}

function ValueConverter.SecondsToDHMS(seconds: number, includeSeconds: boolean?): string
	seconds = math.max(0, math.floor(seconds))
	includeSeconds = (includeSeconds ~= false)

	local days    = math.floor(seconds / 86400)
	local hours   = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	local secs    = seconds % 60

	local parts = {}

	if days > 0 then table.insert(parts, string.format("%dd", days)) end
	if hours > 0 then table.insert(parts, string.format("%dh", hours)) end

	if minutes > 0 then
		table.insert(parts, string.format("%dm", minutes))
	elseif #parts == 0 and not includeSeconds then
		return "0m"
	end

	if includeSeconds and (secs > 0 or #parts == 0) then
		table.insert(parts, string.format("%ds", secs))
	end

	return table.concat(parts, " ")
end

function ValueConverter.SecondsToCompact(seconds: number): string
	seconds = math.max(0, math.floor(seconds))
	local days = math.floor(seconds / 86400)
	local hours = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	return string.format("%dd %dh %dm", days, hours, minutes)
end

function ValueConverter.MinutesToHM(minutes: number): string
	minutes = math.max(0, math.floor(minutes))
	local hrs = math.floor(minutes / 60)
	local mins = minutes % 60
	return string.format("%02d:%02d", hrs, mins)
end

function ValueConverter.BytesToReadable(bytes: number, decimals: number?): string
	decimals = decimals or 2
	if bytes < 1024 then
		return string.format("%d B", bytes)
	end

	local units = { "KB", "MB", "GB", "TB", "PB" }
	local i = 0
	local size = bytes
	while size >= 1024 and i < #units do
		size = size / 1024
		i += 1
	end
	return string.format("%." .. decimals .. "f %s", size, units[i])
end

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

function ValueConverter.NumberWithCommas(num: number): string
	local s = tostring(math.floor(num))
	local pattern = "(%d)(%d%d%d)$"
	while true do
		s, k = s:gsub("^(%d+)(%d%d%d)", "%1,%2")
		if k == 0 then break end
	end
	return s
end

function ValueConverter.ShortenNumber(num: number): string
	local absNum = math.abs(num)
	if absNum >= 1e9 then
		return string.format("%.1fB", num / 1e9)
	elseif absNum >= 1e6 then
		return string.format("%.1fM", num / 1e6)
	elseif absNum >= 1e3 then
		return string.format("%.1fK", num / 1e3)
	else
		return tostring(num)
	end
end

function ValueConverter.CelsiusToFahrenheit(c: number): number
	return (c * 9/5) + 32
end

function ValueConverter.FahrenheitToCelsius(f: number): number
	return (f - 32) * 5/9
end

function ValueConverter.CelsiusToKelvin(c: number): number
	return c + 273.15
end

function ValueConverter.KelvinToCelsius(k: number): number
	return k - 273.15
end

function ValueConverter.Percentage(part: number, total: number, decimals: number?): string
	if total == 0 then return "0%" end
	decimals = decimals or 1
	return string.format("%." .. decimals .. "f%%", (part / total) * 100)
end

function ValueConverter.BoolToYesNo(value: boolean): string
	return value and "Yes" or "No"
end

return ValueConverter
