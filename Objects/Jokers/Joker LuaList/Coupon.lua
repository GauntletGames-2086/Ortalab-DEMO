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
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

coupon.order = 79

function coupon.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.minus_chips, center.ability.extra.money_off}}
end

coupon.calculate = function(self, card, context) --Coupon Logic
	if context.joker_main then
		return {
			message = localize{type='variable',key='a_chips_minus',vars={card.ability.extra.minus_chips}},
			chip_mod = -card.ability.extra.minus_chips, 
			colour = G.C.RED
		}
	end
end

return coupon