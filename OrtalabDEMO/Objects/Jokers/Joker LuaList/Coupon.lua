local joker_loc_txt = {
	["name"] = "Black Friday",
	["text"] = {
		"{C:red}-#1#{} Chips",
		"All cards in the shop",
		"are {C:money}#2#%{} off",
		"{C:inactive}(Artist: Flare){}"
	}
}

local coupon = SMODS.Joker({
	name = "Black Friday",
	key = "coupon",
	config = {extra = {minus_chips = 40, money_off = 20, already_triggered = false}},
	pos = {x = 3,y = 13},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

coupon.order = 79

function coupon.loc_def(center)
	return {center.ability.extra.minus_chips, center.ability.extra.money_off}
end

coupon.calculate = function(self, context) --Coupon Logic
	if SMODS.end_calculate_context(context) then
		return {
			message = localize{type='variable',key='a_chips_minus',vars={self.ability.extra.minus_chips}},
			chip_mod = -self.ability.extra.minus_chips, 
			colour = G.C.RED
		}
	end
end

return coupon