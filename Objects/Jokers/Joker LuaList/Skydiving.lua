local joker_loc_txt = {
	["name"] = "Skydiving",
	["text"] = {
		"Sets played {C:attention}poker hand",
		"level to 1",
		"Gain {X:mult,C:white}#1#X{} Mult",
		"per level {C:attention}removed",
		"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
		"{C:inactive}(Artist: AlexZGreat)"
	}
}

local skydiving = SMODS.Joker({
	name = "Skydiving",
	key = "skydiving",
	config = {extra = {curr_xmult = 1, xmult_add = 0.3}},
	pos = {x=3,y=5},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	atlas = "Ortalab_Jokers",
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.xmult_add, center.ability.extra.curr_xmult}}
	end,
	calculate = function(self, card, context)
		if not context.blueprint and context.cardarea == G.jokers and context.before and G.GAME.hands[context.scoring_name].level ~= 1 then
			if G.GAME.hands[context.scoring_name].level < 1 then
				return {
					card = card,
					level_up = true,
					message = localize('k_level_up_ex')
				}
			else
				local levels_to_remove = G.GAME.hands[context.scoring_name].level - 1
				card.ability.extra.curr_xmult = card.ability.extra.curr_xmult + (levels_to_remove*card.ability.extra.xmult_add)
				level_up_hand(card, context.scoring_name, nil, -levels_to_remove)
				return {
					card = card,
					colour = G.C.RED,
					message = localize{type='variable',key='a_xmult',vars={card.ability.extra.curr_xmult}}
				}
			end
		end
		if context.joker_main and card.ability.extra.curr_xmult > 1 then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.curr_xmult}},
				Xmult_mod = card.ability.extra.curr_xmult
			}
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

skydiving.order = 45

return skydiving