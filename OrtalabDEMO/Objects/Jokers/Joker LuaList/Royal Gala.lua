local joker_loc_txt = {
	["name"] = "Royal Gala",
	["text"] = {
		"{C:chips}+#1#{} Chips",
		"{C:green}#2# in #3#{} chance this",
		"card is destroyed",
		"at end of round",
		"{C:inactive}(Artists: ItsFlowwey, Grassy){}",
		"{C:inactive}(im_salad, Flare){}"
	}
}

local royal_gala = SMODS.Joker({
	name = "Royal Gala",
	key = "royal_gala",
	config = {extra = {chips = 300, odds = 1000}},
	pos = {x = 5,y = 11},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,
	yes_pool_flag = 'taliaferro_extinct',
	atlas = "Ortalab_Jokers",
	process_loc_text = function(self)
		SMODS.Joker.process_loc_text(self)
		SMODS.process_loc_text(G.localization.misc.v_dictionary, 'a_xchips', "X#1# Chips")
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

royal_gala.order = 61

function royal_gala.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
end

royal_gala.calculate = function(self, card, context) --Royal Gala Logic
	if card.ability.name == 'Royal Gala' then
		if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
			if pseudorandom('royalgala') < G.GAME.probabilities.normal/card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(card)
									card:remove()
									card = nil
								return true; end})) 
						return true
					end
				}))
				return {
					message = localize('k_extinct_ex')
				}
			else
				return {
					message = localize('k_safe_ex')
				}
			end
		end
		if context.joker_main then
			return {
				message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
				chip_mod = card.ability.extra.chips, 
				colour = G.C.CHIPS
			}
		end
	end
end

return royal_gala
