local joker_loc_txt = {
	["name"] = "Scared Face",
	["text"] = {
		"Played numbered cards",
		"give {C:chips}+#1#{} Chips when scored",
		"{C:inactive}(Artist: GoldenDiscoPig){}"
	}
}

local scared_face = SMODS.Joker({
	name = "Scared Face",
	key = "scared_face",
	config = {extra = {chips = 30}},
	pos = {x = 2, y = 3},
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
			SMODS.GameObject.register(self)
		end
	end,
})

scared_face.order = 33

function scared_face.loc_def(center)
	return {center.ability.extra.chips}
end

scared_face.calculate = function(self, context) --Scared Face Logic
	if context.individual and context.cardarea == G.play and not (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
		return {
			chips = self.ability.extra.chips,
			card = self
		}
	end
end

return scared_face