-- PrepareDisplayName.lua
-- Formats a player's display name with optional badges/icons

local ICONS = {
	Admin    = "🛡️",
	Verified = "",
	Premium  = ""
}

local function prepare(displayName: string, hasVerifiedBadge: boolean, premiumMembership: Enum.MembershipType, isAdmin: boolean): string
	if typeof(displayName) ~= "string" then
		return "Player"
	end

	local finalName = displayName

	if isAdmin then
		finalName ..= ICONS.Admin
	elseif hasVerifiedBadge then
		finalName ..= ICONS.Verified
	elseif premiumMembership == Enum.MembershipType.Premium then
		finalName ..= ICONS.Premium
	end

	return finalName
end

return prepare
