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
			SMODS.Joker.register(self)
		end
	end,
})

the_mysterium.order = 132

function the_mysterium.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.x_mult}}
end

the_mysterium.calculate = function(self, card, context) --The Mysterium Logic
	if context.joker_main then
		if table.contains(card.ability.extra.secret_hand_list, context.scoring_name) then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
				Xmult_mod = card.ability.extra.x_mult
			}
		end
	end
end

return the_mysterium