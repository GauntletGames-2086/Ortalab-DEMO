local joker_loc_txt = {
	["name"] = "Roscharch Test",
	["text"] = {
		"For each played 2 or 5, either give",
		"{C:chips}+#1#{} Chips or {C:mult}+#2#{} when scored",
		"{C:inactive}(Artist: Flare){}"
	}
}

local roscharch_test = SMODS.Joker({
	name = "Roscharch Test",
	key = "roscharch_test",
	config = {extra = {chips = 25, mult = 5}},
	pos = {x = 8, y = 15},
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

roscharch_test.order = 101

function roscharch_test.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, center.ability.extra.mult}}
end

roscharch_test.calculate = function(self, card, context) --Roscharch Logic
	if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 5 or context.other_card:get_id() == 2) then
		if pseudorandom('roscharch_test') <= 0.5 then
			return {
				mult = card.ability.extra.mult,
				card = card
			}
		else
			return {
				chips = card.ability.extra.chips,
				card = card
			}
		end
	end
end

return roscharch_test