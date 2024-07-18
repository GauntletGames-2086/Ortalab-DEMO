local joker_loc_txt = {
	["name"] = "Graffiti",
	["text"] = {
		"{C:mult}+#1#{} Mult",
		"per hand remaining",
		"{C:inactive}(Currently {C:mult}+#2#{} Mult){}",
		"{C:inactive}(Artist: Flare){}"
	}
}

local graffiti = SMODS.Joker({
	name = "Graffiti",
	key = "graffiti",
	config = {extra = {mult_add = 6}},
	pos = {x = 1,y = 2},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 5,
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

graffiti.order = 22

function graffiti.loc_vars(self, info_queue, center)
	return {vars = {center.ability.extra.mult_add, center.ability.extra.mult_add*G.GAME.current_round.hands_left}}
end

graffiti.calculate = function (self, card, context) --Graffiti logic
	if context.joker_main then
		if card.ability.extra.mult_add*G.GAME.current_round.hands_left > 0 then
			return {
				message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult_add*G.GAME.current_round.hands_left}},
				mult_mod = card.ability.extra.mult_add*G.GAME.current_round.hands_left,
				colour = G.C.MULT
			}
		end
	end
end

return graffiti
