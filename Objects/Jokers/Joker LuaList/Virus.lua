local joker_loc_txt = {
	["name"] = "Virus",
	["text"] = {
		"If {C:attention}first hand{} of round has only",
		"{C:attention}1{} card, destroy it and",
		"convert {C:attention}#1# random cards",
		"in hand to played card",
		"{C:inactive}(Artist: GoldenDiscoPig){}"
	}
}

local virus = SMODS.Joker({
	name = "Virus",
	key = "virus",
	config = {extra = {duped_cards = 2, joker_triggered = false}},
	pos = {x = 5, y = 10},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	process_loc_text = function(self)
		SMODS.Joker.process_loc_text(self)
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_infect', "Infected!")
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_destroy', "Destoyed!")
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

virus.order = 51

function virus.loc_vars(self, info_queue, center)
	return {vars = {center.ability.extra.duped_cards}}
end

virus.calculate = function(self, card, context) --Virus Logic
	if context.first_hand_drawn and not context.blueprint then
		local eval = function() return G.GAME.current_round.hands_played == 0 end
		juice_card_until(card, eval, true)
	end
	if context.destroying_card and not context.blueprint and card.ability.extra.joker_triggered == true then
		card.ability.extra.joker_triggered = false
		return true
	end
	if not context.other_joker and not context.repetition and not context.individual and not context.end_of_round and not context.discard and not context.pre_discard then
		if context.cardarea == G.jokers then
			if context.before and G.GAME.current_round.hands_played == 0 then
				if #context.full_hand == 1 then
					local card_to_dupe = context.full_hand[1]
					local hand = {}
					for i=1, #G.hand.cards do
						if not (G.hand.cards[i]:get_id() == card_to_dupe:get_id() and G.hand.cards[i].ability.name == card_to_dupe.ability.name and G.hand.cards[i].edition == card_to_dupe.edition) and G.hand.cards[i].infected ~= true then hand[#hand+1] = G.hand.cards[i] end
					end
					card.ability.extra.joker_triggered = true
					local infected_card_1
					local infected_card_2
					if hand[1] ~= nil then 
						infected_card_1 = pseudorandom_element(hand, pseudoseed('virus'))
						hand[infected_card_1] = nil
						infected_card_1.infected = true
						infected_card_1:flip()
						if hand[1] ~= nil then 
							infected_card_2 = pseudorandom_element(hand, pseudoseed('virus'))
							hand[infected_card_2] = nil
							infected_card_2.infected = true
							infected_card_2:flip()
						end
						if infected_card_1 then
							G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
								if infected_card_2 then
									copy_card(card_to_dupe, infected_card_2)
									infected_card_2:flip()
								end
								copy_card(card_to_dupe, infected_card_1)
								infected_card_1:flip()
								return true 
								end 
							}))
						end
					end
					return {
						message = localize('k_infect'),
						colour = G.C.CHIPS,
						delay = 1, 
						card = card
					}
				end
			end
		end
	end
end

return virus