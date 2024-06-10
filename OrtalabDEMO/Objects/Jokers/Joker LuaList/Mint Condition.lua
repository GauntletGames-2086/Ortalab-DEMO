local joker_loc_txt = {
	["name"] = "Mint Condition",
	["text"] = {
		"{C:attention}Jokers{} that earn money on {C:money}payout{}",
		"each give {X:mult,C:white}X#1#{} Mult",
		"{C:inactive}(Artist: ){}"
	}
}

local mint_condition = SMODS.Joker({
	name = "Mint Condition",
	key = "mint_condition",
	config = {extra = {Xmult = 1.5}},
	pos = {x = 6, y = 14},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

mint_condition.order = 92

function mint_condition.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.Xmult}}
end

mint_condition.calculate = function(self, card, context) --Mint Condition Logic
	if context.other_joker and not context.repetition and not context.indiviual then
		local money_bonus_check = context.other_joker:calculate_dollar_bonus()
		if (money_bonus_check or context.other_joker.ability.name == 'To the Moon') and context.other_joker ~= card then
			G.E_MANAGER:add_event(Event({
				func = function()
					context.other_joker:juice_up(0.5, 0.5)
					return true
				end
			})) 
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.Xmult}},
				Xmult_mod = card.ability.extra.Xmult
			}
		end
	end
end

return mint_condition