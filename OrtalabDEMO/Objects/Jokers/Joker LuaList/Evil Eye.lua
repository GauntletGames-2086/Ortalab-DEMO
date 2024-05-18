local joker_loc_txt = {
	["name"] = "Evil Eye",
	["text"] = {
		"Earn {C:money}$#1#{} at end of round",
		"per each unique {C:spectral}Spectral{} card {C:attention}sold",
		"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
		"{C:inactive}(Artist: ItsFlowwey){}"
	}
}

local evil_eye = SMODS.Joker({
	name = "Evil Eye",
	key = "evil_eye",
	config = {extra = {money = 2, spectral_sold = 0, spectral_type_sold = {}}},
	pos = {x = 8, y = 7},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	yes_pool_flag = 'shady_trading_redeemed',
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
})

evil_eye.order = 139

function evil_eye.loc_def(center)
	return {center.ability.extra.money, center.ability.extra.money*center.ability.extra.spectral_sold}
end

return evil_eye