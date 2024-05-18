local joker_loc_txt = {
	["name"] = "Beyond The Mask",
	["text"] = {
		"Earn {C:money}#1#${} at end of round",
		"Gains {C:money}#2#${} per discarded {C:attention,E:1}Gold{} Card",
		"Discarded {C:attention,E:1}Gold{} Cards are destroyed",
		"{C:inactive}(Artist: Flare){}"
	}
}

local inverse_midas = SMODS.Joker({
	name = "Beyond The Mask",
	key = "inverse_midas",
	config = {extra = {dollars = 1, dollars_add = 1}},
	pos = {x = 0, y = 13},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
})

inverse_midas.order = 76

function inverse_midas.loc_def(center)
	return {center.ability.extra.dollars, center.ability.extra.dollars_add}
end
function inverse_midas.tooltip(card, info_queue)
	info_queue[#info_queue+1] = G.P_CENTERS.m_gold
end

inverse_midas.calculate = function(self, context) --Beyond The Mask Logic
	if context.discard and not context.blueprint and not context.other_card.debuff and
	context.other_card.ability.name == 'Gold Card' then
		self.ability.extra.dollars = self.ability.extra.dollars + self.ability.extra.dollars_add
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MONEY,
			delay = 0.45, 
			remove = true,
			card = self
		}
	end
end

return inverse_midas