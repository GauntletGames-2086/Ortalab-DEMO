local joker_loc_txt = {
	["name"] = "Shrine",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult per",
		"{C:spectral}Spectral{} card used",
		"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
		"{C:inactive}(Artist: KoszeTrawe){}"
	}
}

local shrine = SMODS.Joker({
	name = "Shrine",
	key = "shrine",
	config = {extra = {xmult = 1, xmult_add = 0.25}},
	pos = {x = 9, y = 10},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	yes_pool_flag = 'shady_trading_redeemed',
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

shrine.order = 55

function shrine.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.xmult_add, center.ability.extra.xmult}}
end

shrine.calculate = function(self, card, context) --Shrine Logic
	if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
		card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_add
			G.E_MANAGER:add_event(Event({
				func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}}); return true
				end}))
	end
	if context.joker_main and card.ability.extra.xmult > 1 then
		return {
			message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
			Xmult_mod = card.ability.extra.xmult
		}
	end
end

return shrine