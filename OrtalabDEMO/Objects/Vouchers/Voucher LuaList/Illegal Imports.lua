local voucher_loc_txt = {
	["name"] = "Illegal Imports",
	["text"] = {
		"{C:spectral}Spectral{} cards appear",
		"{C:attention}2X{} more frequently in the shop",
		"{C:inactive}(Artist: Flare){}"
	}
}
local illegal_imports = SMODS.Voucher({
	name = "Illegal Imports", --name
	key = "illegal_imports", --slug
	config = {}, --config
	pos = {x = 4, y = 3}, --spritePos
	loc_txt = voucher_loc_txt, --loc_txt
	cost = 10, --cost
	unlocked = true, --unlocked
	discovered = true, --discovered
	available = false, --available
	requires = {'v_shady_trading'}, --requires
	atlas = "Ortalab_Vouchers" --atlas
})

illegal_imports.order = 26

function illegal_imports.redeem(center)
	if center.name == 'Illegal Imports' then
		G.GAME.spectral_rate = 4
	end
end

return illegal_imports