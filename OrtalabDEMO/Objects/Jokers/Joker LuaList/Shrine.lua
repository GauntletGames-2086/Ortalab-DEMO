local joker_loc_txt = {
	["name"] = "Shrine",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult per",
		"{C:spectral}Spectral{} card used",
		"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
		"{C:inactive}(Artist: ){}"
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
})

shrine.order = 55

function shrine.loc_def(center)
	return {center.ability.extra.xmult_add, center.ability.extra.xmult}
end

shrine.calculate = function(self, context) --Shrine Logic
	if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
		self.ability.extra.xmult = self.ability.extra.xmult + self.ability.extra.xmult_add
			G.E_MANAGER:add_event(Event({
				func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={self.ability.extra.xmult}}}); return true
				end}))
	end
	if SMODS.end_calculate_context(context) and self.ability.extra.xmult > 1 then
		return {
			message = localize{type='variable',key='a_xmult',vars={self.ability.extra.xmult}},
			Xmult_mod = self.ability.extra.xmult
		}
	end
end

return shrine