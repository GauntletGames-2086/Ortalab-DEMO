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
	calc_dollar_bonus = function(self, card)
		return card.ability.extra.dollars
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

inverse_midas.order = 76

function inverse_midas.loc_vars(card, info_queue, center)
	info_queue[#info_queue+1] = G.P_CENTERS.m_gold
	return {vars = {center.ability.extra.dollars, center.ability.extra.dollars_add}}
end

inverse_midas.calculate = function(self, card, context) --Beyond The Mask Logic
	if context.discard and not context.blueprint and not context.other_card.debuff and
	context.other_card.ability.name == 'Gold Card' then
		card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_add
		return {
			message = localize('k_upgrade_ex'),
			colour = G.C.MONEY,
			delay = 0.45, 
			remove = true,
			card = card
		}
	end
end

return inverse_midas