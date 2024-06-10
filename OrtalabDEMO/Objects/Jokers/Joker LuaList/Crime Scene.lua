local joker_loc_txt = {
	["name"] = "Crime Scene",
	["text"] = {
		"Jokers that have been",
		"{C:attention}sold{} or {C:attention}destroyed{}",
		"cannot appear in the shop",
		"{C:inactive}(Artist: Grassy){}"
	}
}

local crime_scene = SMODS.Joker({
	name = "Crime Scene",
	key = "crime_scene",
	config = {},
	pos = {x = 6, y = 5},
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

crime_scene.order = 121

local CardDissolve = Card.start_dissolve --Crime Scene Logic
function Card.start_dissolve(self)
	if next(SMODS.find_card('j_olab_crime_scene')) and self.ability.set == 'Joker' then
		self.config.center.no_pool_flag = 'crime_scene_pool_disable'
	end
	return CardDissolve(self)
end

return crime_scene