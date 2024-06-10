local joker_loc_txt = {
	["name"] = "Frowny Face",
	["text"] = {
		"Played numbered cards",
		"give {C:mult}+#1#{} Mult when scored",
		"{C:inactive}(Artist: GoldenDiscoPig){}"
	}
}

local frowny_face = SMODS.Joker({
	name = "Frowny Face",
	key = "frowny_face",
	config = {extra = {mult = 4}},
	pos = {x = 6, y = 15},
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

frowny_face.order = 104

function frowny_face.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.mult}}
end

frowny_face.calculate = function(self, card, context) --Frowny Face Logic
	if context.individual and context.cardarea == G.play and not (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
		return {
			mult = card.ability.extra.mult,
			card = card
		}
	end
end

return frowny_face