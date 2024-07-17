local joker_loc_txt = {
	["name"] = "Generous Joker",
	["text"] = {
		"Played cards with",
		"{C:diamonds}#2#{} suit give",
		"{C:chips}+#1#{} Chips when scored", 
		"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
	}
}

local generous_joker = SMODS.Joker({
	name = "Generous Joker",
	key = "generous_joker",
	config = {extra = {chips = 30, suit = 'Diamonds'}},
	pos = {x = 6, y = 1},
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

generous_joker.order = 2

function generous_joker.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}}
end

generous_joker.calculate = function(self, card, context) --Generous Joker Logic
	if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
		return {
			chips = card.ability.extra.chips,
			card = card
		}
	end
end

return generous_joker