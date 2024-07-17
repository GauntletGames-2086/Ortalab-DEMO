local joker_loc_txt = {
	["name"] = "Mystery Soda",
	["text"] = {
		"Sell this card to create",
		"two free {C:attention}tags",
		"{C:inactive}(Artist: im_salad){}"
	}
}

local mystery_soda = SMODS.Joker({
	name = "Mystery Soda",
	key = "mystery_soda",
	config = {},
	pos = {x = 8, y = 14},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = false,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

mystery_soda.order = 94

mystery_soda.calculate = function(self, card, context) --Mystery Soda Logic
	if context.selling_self then
		local available_tags = {}
		local selected_tags = {}
		for k, v in pairs(G.P_TAGS) do
			table.insert(available_tags,k)
		end
		for i = 1, 2 do
			selected_tags[i] = pseudorandom_element(available_tags, pseudoseed('mystery_soda'))
		end
		G.E_MANAGER:add_event(Event({
			func = (function()
				add_tag(Tag(selected_tags[1], false, 'Big'))
				add_tag(Tag(selected_tags[2], false, 'Big'))
				play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
				play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
				return true
			end)
		}))
	end
end

return mystery_soda