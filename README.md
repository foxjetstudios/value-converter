# Roblox UI Utilities

A collection of **handy Roblox utility modules** to make your UI cleaner, more consistent, and easier to read.

Most people use **images of Robux icons or Premium icons** when showing player name labels or price labels, which often appear at low resolution. Instead, you can use the **official Roblox symbols**! These modules help you properly format the text while keeping it sharp and professional.

This repository includes modules for:

* Formatting player display names with admin, verified, or premium badges (`DisplayName.lua`)
* Formatting prices with Robux or plain text (`DisplayPrice.lua`)
* Converting numbers, times, distances, bytes, percentages, and more (`ValueConverter.lua`)

Perfect for shops, leaderboards, menus, and any interface where polished, readable UI matters.

---

## Repository Structure

```
roblox-ui-utilities
│
├── Display
│   ├── PrepareDisplayName.lua       -- Formats player names with badges
│   └── PrepareDisplayPrice.lua      -- Formats price strings for Robux or text
│
├── Format
│   └── ValueConverter.lua    -- Converts numbers, times, distances, bytes, percentages, and more
│
└── README.md
```

---

## Getting Started

1. Place the module scripts in `ReplicatedStorage`.
2. Require them in your LocalScripts like this:

```lua
local ValueConverter = require(game.ReplicatedStorage:WaitForChild("ValueConverter"))
local prepareName = require(game.ReplicatedStorage:WaitForChild("PrepareDisplayName"))
local preparePrice = require(game.ReplicatedStorage:WaitForChild("PrepareDisplayPrice"))
```

3. Use the functions wherever you need properly formatted UI text.

---

## Examples

### Display Name

```lua
local name = prepareName("Player123", true, Enum.MembershipType.Premium, false)
print(name) -- Player123
```

### Display Price

```lua
local price = preparePrice(100, true)
print(price) -- 100
```

### Value Conversions

```lua
print(ValueConverter.SecondsToDHMS(93784)) -- "1d 2h 3m 4s"
print(ValueConverter.NumberWithCommas(12345678)) -- "12,345,678"
print(ValueConverter.MetersToKilometers(1500)) -- "1.50 km"
print(ValueConverter.ShortenNumber(4200000)) -- "4.2M"
```

---

## License

This repository is licensed under the **MIT License**.
Feel free to use, modify, and distribute these modules in your own projects.

Happy building! :)
