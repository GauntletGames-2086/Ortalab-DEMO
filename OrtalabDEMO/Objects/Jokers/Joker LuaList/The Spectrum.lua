local joker_loc_txt = {
	["name"] = "The Spectrum",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult if played",
		"hand does not",
		"contain a {C:attention}#2#",
		"{C:inactive}(Artist: Coronacht, Flare){}"
	}
}

local the_spectrum = SMODS.Joker({
	name = "The Spectrum",
	key = "the_spectrum",
	config = {extra = {x_mult = 2, type = 'Flush'}},
	pos = {x = 9, y = 4},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.GameObject.register(self)
		end
	end,
})

the_spectrum.order = 135

function the_spectrum.loc_def(center)
	return {center.ability.extra.x_mult, localize(center.ability.extra.type, 'poker_hands')}
end

the_spectrum.calculate = function(self, context) --The Spectrum Logic
	if SMODS.end_calculate_context(context) then
		if (context.scoring_name ~= 'Flush Five' or 
		context.scoring_name ~= 'Flush House' or 
		context.scoring_name ~= 'Straight Flush' or 
		context.scoring_name ~= 'Flush') then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
				Xmult_mod = self.ability.extra.x_mult
			}
		end
	end
end

return the_spectrum