local joker_loc_txt = {
	["name"] = "Chameleon Joker",
	["text"] = {
		"Copies ability of a random joker",
		"when blind is selected",
		"{C:inactive}(Copied Joker: {C:attention}#1#{C:inactive})",
		"{C:inactive}(Artist: ){}"
	}
}

local chameleon_joker = SMODS.Joker({
	name = "Chameleon Joker",
	key = "chameleon_joker",
	config = {copied_joker = nil, copied_joker_pos = 1},
	pos = {x = 1, y = 7},
	loc_txt = joker_loc_txt,
	rarity = 3,
	cost = 8,
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

chameleon_joker.order = 137

function chameleon_joker.loc_vars(self, info_queue, card)
	if not G.jokers then return {vars = {localize('k_na')}} end
	local other_joker = nil
	for i=1, #G.jokers.cards do 
		if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.copied_by_chameleon then
			other_joker = G.jokers.cards[i]
			break
		end
	end
	if other_joker then
		return {vars = {localize{type = 'name_text', set = "Joker", key = other_joker.config.center.key, nodes = {}}}}
	else
		return {vars = {localize('k_na')}}
	end
end

chameleon_joker.calculate = function(self, card, context) --Chameleon Joker Logic
	if context.setting_blind and not card.getting_sliced then
		local jokers = {}
		for i=1, #G.jokers.cards do 
			if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= 'chameleon_joker' then
				-- note that this will result in overriding all other chameleon jokers
				-- but at least they'll be consistent
				if G.jokers.cards[i].ability.copied_by_chameleon then G.jokers.cards[i].ability.copied_by_chameleon = false end
				if G.jokers.cards[i].config.center.blueprint_compat == true then
					jokers[#jokers+1] = G.jokers.cards[i]
				end
			end
		end
		if #jokers > 0 then
			local chosen_joker = pseudorandom_element(jokers, pseudoseed('chameleon'))
			chosen_joker.ability.copied_by_chameleon = true
			print(chosen_joker.config.center.key.." is being copied by Chameleon Joker")
		end	
	end
	local other_joker = nil
	for i=1, #G.jokers.cards do 
		if G.jokers.cards[i] ~= card and G.jokers.cards[i].ability.copied_by_chameleon then
			other_joker = G.jokers.cards[i]
			break
		end
	end
	if other_joker and other_joker ~= card then
		context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
		context.blueprint_card = context.blueprint_card or card
		if context.blueprint > #G.jokers.cards + 1 then return end
		local other_joker_ret = other_joker:calculate_joker(context)
		if other_joker_ret then 
			other_joker_ret.card = context.blueprint_card or card
			other_joker_ret.colour = G.C.BLUE
			return other_joker_ret
		end
	end
end

return chameleon_joker