local joker_loc_txt = {
	["name"] = "The Solo",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult if played",
		"hand is a {C:attention}#2#",
		"{C:inactive}(Artist: ItsFlowwey){}"
	}
}

local the_solo = SMODS.Joker({
	name = "The Solo",
	key = "the_solo",
	config = {extra = {x_mult = 4, type = 'High Card'}},
	pos = {x = 5, y = 4},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

the_solo.order = 131

function the_solo.loc_def(center)
	return {center.ability.extra.x_mult, localize(center.ability.extra.type, 'poker_hands')}
end

the_solo.calculate = function(self, context) --The Solo Logic
	if SMODS.end_calculate_context(context) then
		if context.scoring_name == 'High Card' then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
				Xmult_mod = self.ability.extra.x_mult
			}
		end
	end
end

return the_solo