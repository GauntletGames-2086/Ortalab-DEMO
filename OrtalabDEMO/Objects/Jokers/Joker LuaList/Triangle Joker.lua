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
	config = {extra = {mult_add = 0, mult_total = 3}},
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
})

triangle_joker.order = 65

function triangle_joker.loc_def(center)
	return {center.ability.extra.mult_add, center.ability.extra.mult_total}
end

triangle_joker.calculate = function(self, context) --Triangle Joker Logic
	if context.cardarea == G.jokers and context.before and #context.full_hand == 3 and not context.blueprint then
		self.ability.extra.mult_total = self.ability.extra.mult_total + self.ability.extra.mult_add
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MULT,
			card = self
		}
	end
	if SMODS.end_calculate_context(context) then
		return {
			message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult_total}},
			mult_mod = self.ability.extra.mult_total
		}
	end
end

return triangle_joker