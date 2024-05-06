local joker_loc_txt = {
	["name"] = "Dawn",
	["text"] = {
		"Retrigger all played",
		"cards in {C:attention}first",
		"{C:attention}hand{} of round",
		"{C:inactive}(Artist: Flare){}"
	}
}

local dawn = SMODS.Joker({
	name = "Dawn",
	key = "dawn",
	config = {extra = 1},
	pos = {x = 4, y = 7},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

dawn.order = 28

function dawn.loc_def(center)
	return {center.ability.extra+1}
end

dawn.calculate = function(self, context) --Dawn Logic
	if context.first_hand_drawn then
		if not context.blueprint then
			local eval = function() return G.GAME.current_round.hands_played == 0 end
			juice_card_until(self, eval, true)
		end
	end
	if context.repetition and context.cardarea == G.play then
		if G.GAME.current_round.hands_played == 0 then
			return {
				message = localize('k_again_ex'),
				repetitions = self.ability.extra,
				card = self
			}
		end
	end
end

return dawn