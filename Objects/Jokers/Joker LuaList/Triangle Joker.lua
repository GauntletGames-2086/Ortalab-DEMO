local joker_loc_txt = {
	["name"] = "Triangle Joker",
	["text"] = {
		"This Joker gains {C:mult}+#1#{} Mult if played hand",
		"has exactly {C:attention}3{} cards",
		"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
		"{C:inactive}(Artist: im_salad){}"
	}
}

local triangle_joker = SMODS.Joker({
	name = "Triangle Joker",
	key = "triangle_joker",
	config = {extra = {mult_add = 3, mult_total = 0}},
	pos = {x = 9, y = 11},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

triangle_joker.order = 65

function triangle_joker.loc_vars(self, info_queue, center)
	return {vars = {center.ability.extra.mult_add, center.ability.extra.mult_total}}
end

triangle_joker.calculate = function(self, card, context) --Triangle Joker Logic
	if context.cardarea == G.jokers and context.before and #context.full_hand == 3 and not context.blueprint then
		card.ability.extra.mult_total = card.ability.extra.mult_total + card.ability.extra.mult_add
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT,
			card = card
		}
	end
	if context.joker_main then
		return {
			message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult_total}},
			mult_mod = card.ability.extra.mult_total
		}
	end
end

return triangle_joker