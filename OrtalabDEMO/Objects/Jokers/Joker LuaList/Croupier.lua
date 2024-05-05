local joker_loc_txt = {
	["name"] = "Croupier",
	["text"] = {
		"Booster packs contain",
		"{C:attention}1{} additional card",
		"{C:inactive}(Artist: ){}"
	}
}

local croupier = SMODS.Joker({
	name = "Croupier",
	key = "croupier",
	config = {},
	pos = {x = 6, y = 11},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

croupier.order = 62

local CardOpen_ref = Card.open
function Card.open(self) --Required for Croupier Logic
	if next(find_joker('Croupier')) then
		if self.ability.set == "Booster" then
			self.ability.extra = self.ability.extra + 1
		end
	end
	return CardOpen_ref(self)
end

return croupier