# ValueConverter.lua

A small utility module for Roblox that helps convert common values into clean, readable formats.

Perfect for UI, stats, timers, storage displays, distances, temperatures, and all those little things you end up rewriting over and over.

Drop it in ReplicatedStorage and use it anywhere.

## What This Is For

This module focuses on one thing only: turning raw numbers into strings or values that actually make sense to players.

No magic. No state. Just simple helper functions.

## Installation

1. Create a ModuleScript called `ValueConverter.lua`
2. Paste the code inside
3. Put it in `ReplicatedStorage`

Done.

## Requiring the Module

```lua
local ValueConverter = require(game.ReplicatedStorage:WaitForChild("ValueConverter"))
```

## Time Conversions

### Seconds to days, hours, minutes, seconds

```lua
ValueConverter.SecondsToDHMS(93784)
-- "1d 2h 3m 4s"

ValueConverter.SecondsToDHMS(120, false)
-- "2m"
```

### Compact time format

```lua
ValueConverter.SecondsToCompact(93784)
-- "1d 2h 3m"
```

### Minutes to HH:MM

```lua
ValueConverter.MinutesToHM(135)
-- "02:15"
```

## Numbers and Formatting

### Add commas to numbers

```lua
ValueConverter.NumberWithCommas(12345678)
-- "12,345,678"
```

### Shorten large numbers

```lua
ValueConverter.ShortenNumber(15320)
-- "15.3K"

ValueConverter.ShortenNumber(4200000)
-- "4.2M"
```

### Percentages

```lua
ValueConverter.Percentage(25, 200)
-- "12.5%"
```

## Storage and Sizes

### Bytes to readable format

```lua
ValueConverter.BytesToReadable(1048576)
-- "1.00 MB"
```

## Distance Conversions

```lua
ValueConverter.MetersToKilometers(1500)
-- "1.50 km"

ValueConverter.KilometersToMiles(10)
-- "6.21 mi"

ValueConverter.MilesToKilometers(5)
-- "8.05 km"
```

## Temperature Conversions

```lua
ValueConverter.CelsiusToFahrenheit(25)
-- 77

ValueConverter.FahrenheitToCelsius(32)
-- 0

ValueConverter.CelsiusToKelvin(0)
-- 273.15
```

## Booleans

```lua
ValueConverter.BoolToYesNo(true)
-- "Yes"

ValueConverter.BoolToYesNo(false)
-- "No"
```

## Notes

* All inputs are safely clamped or rounded where needed
* No dependencies
* No side effects
* Works in both UI and gameplay logic
* Easy to extend with your own converters

## License

Use it freely. Modify it. Ship it.
If it saves you time, that’s the win.
This is licensed under MIT license.

Happy building.
