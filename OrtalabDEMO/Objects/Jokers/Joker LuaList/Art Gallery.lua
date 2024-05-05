local joker_loc_txt = {
	["name"] = "Art Gallery",
	["text"] = {
		"{C:chips}+#1#{} Chips for",
		"each {C:attention}Joker{} and",
		"{C:tarot}Consumable{} card",
		"{C:inactive}(Currently {C:chips}+#2#{C:inactive}){}",
		"{C:inactive}(Artist: Flare){}"
	}
}

local art_gallery = SMODS.Joker({
	name = "Art Gallery",
	key = "art_gallery",
	config = {extra = {chips_add = 20}},
	pos = {x=3,y=3},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

art_gallery.order = 34

function art_gallery.loc_def(center)
	if center.ability.name == 'Art Gallery' then
		local total_cards = 0
		if G.jokers then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.set == 'Joker' then total_cards = total_cards + 1 end
			end
		end
		if G.consumeables then
			for i = 1, #G.consumeables.cards do
				if G.consumeables.cards[i] then total_cards = total_cards + 1 end
			end
		end
		return {center.ability.extra.chips_add, total_cards*center.ability.extra.chips_add}
	end
end

art_gallery.calculate = function(self, context) --Art Gallery Logic
	if SMODS.end_calculate_context(context) then
		local total_cards = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability.set == 'Joker' then total_cards = total_cards + 1 end
		end
		for i = 1, #G.consumeables.cards do
			if G.consumeables.cards[i] then total_cards = total_cards + 1 end
		end
		return {
			message = localize{type='variable',key='a_chips',vars={total_cards*self.ability.extra.chips_add}},
			chip_mod = total_cards*self.ability.extra.chips_add, 
			colour = G.C.CHIPS
		}
	end
end

return art_gallery