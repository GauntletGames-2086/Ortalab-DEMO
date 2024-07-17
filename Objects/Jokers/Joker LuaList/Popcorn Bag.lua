local joker_loc_txt = {
	["name"] = "Popcorn Bag",
	["text"] = {
		"{C:mult}+#1#{} Mult.",
		"{C:mult}+#2#{} Mult per round played",
		"Explodes when greater than {C:mult}+20{}",
		"{C:inactive}(Artist: GoldenDiscoPig){}"
	}
}

local popcorn_bag = SMODS.Joker({
	name = "Popcorn Bag",
	key = "popcorn_bag",
	config = {extra = {a_mult = 0, a_mult_add = 4}},
	pos = {x = 1, y = 15},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	process_loc_text = function(self)
		SMODS.Joker.process_loc_text(self)
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_explode', "Exploded!")
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

popcorn_bag.order = 97

function popcorn_bag.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.a_mult, center.ability.extra.a_mult_add}}
end

popcorn_bag.calculate = function(self, card, context) --Popcorn Bag Logic
	if not context.blueprint then
		if context.end_of_round and not context.individual and not context.repetition then
			if card.ability.extra.a_mult + card.ability.extra.a_mult_add > 20 then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
								return true; end}))
						return true
					end
				})) 
				return {
					message = localize('k_explode'),
					colour = G.C.RED
				}
			else
				card.ability.extra.a_mult = card.ability.extra.a_mult + card.ability.extra.a_mult_add
				return {
					card = card,
					message = localize{type='variable',key='a_mult',vars={card.ability.extra.a_mult_add}}
				}
			end
		end
	end
	if context.joker_main then
		if card.ability.extra.a_mult > 0 then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.extra.a_mult}},
				mult_mod = card.ability.extra.a_mult
			}
		end
	end
end

return popcorn_bag