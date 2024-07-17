local joker_loc_txt = {
	["name"] = "Woo! All 1s",
	["text"] = {
		"Halves all {C:attention}listed{} {C:green,E:1,S:1.1}probabilities{}",
		"{C:inactive}(ex: {C:green}2 in 4{C:inactive} -> {C:green}1 in 4{C:inactive})",
		"{C:inactive}(Artist: Crimson Heart){}"
	}
}

local woo_all_1s = SMODS.Joker({
	name = "Woo! All 1s",
	key = "woo_all_1s",
	config = {},
	pos = {x = 5, y = 6},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

woo_all_1s.order = 126

return woo_all_1s