local joker_loc_txt = {
	["name"] = "Bowling Ball Solar System",
	["text"] = {
		"Create a random {C:planet}Planet",
		"card if a {C:attention}10",
		"is held in hand",
		"{C:inactive}(Artist: Flare){}"
	}
}

local bowling_ball_solar_system = SMODS.Joker({
	name = "Bowling Ball Solar System",
	key = "bowling_ball_solar_system",
	config = {},
	pos = {x = 0, y = 5},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 6,
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

bowling_ball_solar_system.order = 26

bowling_ball_solar_system.calculate = function (self, context)
	if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
		local has_10 = false
		for k, v in ipairs(G.hand.cards) do
			if v:get_id() == 10 then has_10 = true end
		end
		if has_10 == true then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
			G.E_MANAGER:add_event(Event({
				trigger = 'before',
				delay = 0.0,
				func = (function()
						local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'bowling_ball')
						card:add_to_deck()
						G.consumeables:emplace(card)
						G.GAME.consumeable_buffer = 0
					return true
				end)}))
			return {
				message = localize('k_plus_tarot'),
				card = card
			}
		end
	end
end

return bowling_ball_solar_system