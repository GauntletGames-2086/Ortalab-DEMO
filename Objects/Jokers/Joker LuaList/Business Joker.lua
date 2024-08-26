local joker_loc_txt = {
	["name"] = "Business Joker",
	["text"] = {
		"Rerolls cost",
		"{C:money}$1{} less",
		"{C:inactive}(Artist: AlexZGreat)"
	}
}

local business_joker = SMODS.Joker({
	name = "Business Joker",
	key = "business_joker",
	config = {extra = {reroll_cut = 1}},
	pos = {x=1,y=0},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = false,
	atlas = "Ortalab_Jokers",
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.reroll_cut}}
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({func = function()
			G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_cut
			G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.reroll_cut)
			return true end 
		}))
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.E_MANAGER:add_event(Event({func = function()
			G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.reroll_cut
			return true end 
		}))
	end,
})

business_joker.order = 30

return business_joker