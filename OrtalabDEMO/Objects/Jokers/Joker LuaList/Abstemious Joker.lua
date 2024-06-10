local joker_loc_txt = {
	["name"] = "Abstemious Joker",
	["text"] = {
		"Played cards with",
		"{C:clubs}#2#{} suit give",
		"{C:chips}+#1#{} Chips when scored", 
		"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
	}
}
local abstemious_joker = SMODS.Joker({
	name = "Abstemious Joker", --name
	key = "abstemious_joker", --slug
	config = {extra = {chips = 30, suit = 'Clubs'}}, --config
	pos = {x = 9, y = 1}, --spritePos
	loc_txt = joker_loc_txt, --loc_txt
	rarity = 1, --rarity
	cost = 4, --cost
	unlocked = true, --unlocked
	discovered = true, --discovered
	blueprint_compat = true, --blueprint_compat
	eternal_compat = true, --eternal_compat
	perishable_compat = true,
	atlas = "Ortalab_Jokers", --atlas
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

abstemious_joker.order = 5

function abstemious_joker.loc_vars(self, info_queue, center)
	return {vars = {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}}
end

abstemious_joker.calculate = function(self, card, context) --Abstemonius Joker Logic
	if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
		return {
			chips = card.ability.extra.chips,
			card = card
		}
	end
end

return abstemious_joker