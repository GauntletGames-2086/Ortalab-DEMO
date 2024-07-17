local joker_loc_txt = {
	["name"] = "Patient Joker",
	["text"] = {
		"Played cards with",
		"{C:spades}#2#{} suit give",
		"{C:chips}+#1#{} Chips when scored", 
		"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
	}
}

local patient_joker = SMODS.Joker({
	name = "Patient Joker",
	key = "patient_joker",
	config = {extra = {chips = 30, suit = 'Spades'}},
	pos = {x = 8, y = 1},
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

patient_joker.order = 4

function patient_joker.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}}
end

patient_joker.calculate = function(self, card, context) --Patient Joker Logic
	if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
		return {
			chips = card.ability.extra.chips,
			card = card
		}
	end
end

return patient_joker