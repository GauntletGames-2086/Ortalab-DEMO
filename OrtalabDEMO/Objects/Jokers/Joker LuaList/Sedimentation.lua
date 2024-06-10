local joker_loc_txt = {
	["name"] = "Sedimentation",
	["text"] = {
		"{C:red}+#1#{} Mult for each",
		"card above {C:attention}#3#{}",
		"in your full deck",
		"{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
		"{C:inactive}(Artist: Gappie){}"
	}
}

local sedimentation = SMODS.Joker({
	name = "Sedimentation",
	key = "sedimentation",
	config = {extra = {mult_per_card = 4}},
	pos = {x = 5, y = 13},
	loc_txt = joker_loc_txt,
	rarity = 2,
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

sedimentation.order = 81

function sedimentation.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.mult_per_card, math.max(0,center.ability.extra.mult_per_card*(G.playing_cards and (#G.playing_cards - G.GAME.starting_deck_size) or 0)), G.GAME.starting_deck_size}}
end

sedimentation.calculate = function(self, card, context) --Sedimentation Logic
	if context.joker_main then
		if (#G.playing_cards - G.GAME.starting_deck_size) > 0 then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult_per_card*(#G.playing_cards - G.GAME.starting_deck_size)}},
				mult_mod = card.ability.extra.mult_per_card*(#G.playing_cards - G.GAME.starting_deck_size), 
				colour = G.C.MULT
			}
		end
	end
end

return sedimentation