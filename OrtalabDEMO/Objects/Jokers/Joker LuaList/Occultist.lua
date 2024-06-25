local joker_loc_txt = {
	["name"] = "Occultist",
	["text"] = {
		"All {C:spectral}Spectral{} card and {C:spectral}Spectral Packs{}",
		"in the shop are free",
		"{C:inactive}(Artist: Flare, Salad){}"
	}
}

local occultist = SMODS.Joker({
	name = "Occultist",
	key = "occultist",
	config = {},
	pos = {x = 8, y = 10},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	yes_pool_flag = 'shady_trading_redeemed',
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

occultist.order = 143

local CardSet_cost = Card.set_cost --Oculstist Logic
function Card.set_cost(self)
	CardSet_cost(self)
	if (self.ability.set == 'Spectral' or (self.ability.set == 'Booster' and self.ability.name:find('Spectral'))) and #SMODS.find_card('j_olab_occultist') > 0 then 
		self.cost = 0 
	end
end

return occultist