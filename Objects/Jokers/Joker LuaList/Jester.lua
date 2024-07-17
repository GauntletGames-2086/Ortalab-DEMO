local joker_loc_txt = {
	["name"] = "Jester",
	["text"] = {
		"{C:chips}+#1#{} Chips",
		"{C:inactive}(Artist: Crimson Heart){}"
	}
}

local jester = SMODS.Joker({
	name = "Jester",
	key = "jester",
	config = {extra = {chips = 25}},
	pos = {x = 0, y = 0},
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

jester.order = 1

function jester.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips}}
end

jester.calculate = function(self, card, context)
	if context.joker_main then
		return {
			message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
			chip_mod = card.ability.extra.chips, 
			colour = G.C.CHIPS
		}
	end
end

return jester