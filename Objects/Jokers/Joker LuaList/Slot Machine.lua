local joker_loc_txt = {
	["name"] = "Slot Machine",
	["text"] = {
		"If played hand contains three {C:attention}Lucky 7s{}",
		"create a random {C:spectral}Spectral{} card",
		"{C:inactive}(Artist: Flare){}"
	}
}

local slot_machine = SMODS.Joker({
	name = "Slot Machine",
	key = "slot_machine",
	config = {extra = 1},
	pos = {x = 0, y = 12},
	loc_txt = joker_loc_txt,
	rarity = 2,
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

slot_machine.order = 66

slot_machine.calculate = function(self, card, context) --Slot Machine Logic
	if context.joker_main then
		local total_lucky_7s = 0
		for i = 1, #context.scoring_hand do
			if context.scoring_hand[i].ability.name == "Lucky Card" and context.scoring_hand[i]:get_id() == 7 then
				total_lucky_7s = total_lucky_7s + 1
			end
		end
		if total_lucky_7s >= 3 then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			G.E_MANAGER:add_event(Event({
				trigger = 'before',
				delay = 0.0,
				func = (function()
						local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
						card:add_to_deck()
						G.consumeables:emplace(card)
						G.GAME.consumeable_buffer = 0
					return true
				end)}))
			return {
				message = localize('k_plus_spectral'),
				colour = G.C.SECONDARY_SET.Spectral,
				card = card
			}
		end
	end
end

return slot_machine