local joker_loc_txt = {
	["name"] = "The Mysterium",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult if played",
		"hand is a Secret Hand",
		"{C:inactive}(Artist: ItsFlowwey){}"
	}
}

local the_mysterium = SMODS.Joker({
	name = "The Mysterium",
	key = "the_mysterium",
	config = {extra = {x_mult = 4, secret_hand_list = {}}},
	pos = {x = 6, y = 4},
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

the_mysterium.order = 132

function the_mysterium.loc_def(center)
	return {center.ability.extra.x_mult}
end

the_mysterium.calculate = function(self, context) --The Mysterium Logic
	if SMODS.end_calculate_context(context) then
		if table.contains(self.ability.extra.secret_hand_list, context.scoring_name) then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
				Xmult_mod = self.ability.extra.x_mult
			}
		end
	end
end

return the_mysterium