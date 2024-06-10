local joker_loc_txt = {
	["name"] = "Chastful Joker",
	["text"] = {
		"Played cards with",
		"{C:hearts}#2#{} suit give",
		"{C:chips}+#1#{} Chips when scored", 
		"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
	}
}

local chastful_joker = SMODS.Joker({
	name = "Chastful Joker",
	key = "chastful_joker",
	config = {extra = {chips = 30, suit = 'Hearts'}},
	pos = {x = 7, y = 1},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 4,
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

chastful_joker.order = 3

function chastful_joker.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}}
end

chastful_joker.calculate = function(self, card, context) --Chastful Joker Logic
	if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
		return {
			chips = card.ability.extra.chips,
			card = card
		}
	end
end

return chastful_joker