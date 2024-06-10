local joker_loc_txt = {
	["name"] = "Damp Joker",
	["text"] = {
		"Upgrades the last",
		"played {C:attention}poker hand{}",
		"scored this blind",
		"{C:inactive}(Artist: Gappie)"
	}
}

local damp_joker = SMODS.Joker({
	name = "Damp Joker",
	key = "damp_joker",
	config = {},
	pos = {x=3,y=7},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	loc_vars = function(self, info_queue, center)
		return
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and not context.individual then
			if G.GAME.last_hand_played then
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
				update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(G.GAME.last_hand_played, 'poker_hands'),chips = G.GAME.hands[G.GAME.last_hand_played].chips, mult = G.GAME.hands[G.GAME.last_hand_played].mult, level=G.GAME.hands[G.GAME.last_hand_played].level})
                level_up_hand(context.blueprint_card or card, G.GAME.last_hand_played, nil, 1)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
			end
			return
		end
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

damp_joker.order = 144

return damp_joker