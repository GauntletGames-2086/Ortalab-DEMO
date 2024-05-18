local joker_loc_txt = {
	["name"] = "Fine Wine",
	["text"] = {
		"{C:red}+#1#{} discards, gains {C:red}+1{} discard",
		"when blind is selected",
		"{C:green}#2# in #3#{} chance this joker is",
		"destroyed at end of round",
		"{C:inactive}(Artist: Flare){}"
	}
}

local fine_wine = SMODS.Joker({
	name = "Fine Wine",
	key = "fine_wine",
	config = {extra = {discards = 1, odds = 5}},
	pos = {x = 4, y = 13},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
})

fine_wine.order = 80

function fine_wine.loc_def(center)
	return {center.ability.extra.discards, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
end

fine_wine.calculate = function(self, context) --Fine Wine Logic
	if not context.blueprint then
		if context.setting_blind and not self.getting_sliced then
			self.ability.extra.discards = self.ability.extra.discards + 1
			ease_discard(self.ability.extra.discards)
			card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
		end
		if context.end_of_round and not context.individual and not context.repetition then
			if pseudorandom('fine_wine') < G.GAME.probabilities.normal/self.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						self.T.r = -0.2
						self:juice_up(0.3, 0.4)
						self.states.drag.is = true
						self.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(self)
									self:remove()
									self = nil
								return true; end})) 
						return true
					end
				}))
				return {
					message = localize('k_drank_ex')
				}
			else
				return {
					message = localize('k_safe_ex')
				}
			end
		end
	end
end

return fine_wine