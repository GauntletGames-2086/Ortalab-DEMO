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
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

art_gallery.order = 34

function art_gallery.loc_vars(card, info_queue, center)
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
		return {vars = {center.ability.extra.chips_add, total_cards*center.ability.extra.chips_add}}
	end
end

art_gallery.calculate = function(self, card, context) --Art Gallery Logic
	if context.joker_main then
		local total_cards = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].ability.set == 'Joker' then total_cards = total_cards + 1 end
		end
		for i = 1, #G.consumeables.cards do
			if G.consumeables.cards[i] then total_cards = total_cards + 1 end
		end
		return {
			message = localize{type='variable',key='a_chips',vars={total_cards*card.ability.extra.chips_add}},
			chip_mod = total_cards*card.ability.extra.chips_add, 
			colour = G.C.CHIPS
		}
	end
end

return art_gallery