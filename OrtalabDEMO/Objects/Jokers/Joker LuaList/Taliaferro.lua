local joker_loc_txt = {
	["name"] = "Taliaferro",
	["text"] = {
		"{C:chips}+#1#{} Chips",
		"{C:green}#2# in #3#{} chance this",
		"card is destroyed",
		"at end of round",
		"{C:inactive}(Artists: Flare, Grassy){}"
	}
}

local taliaferro = SMODS.Joker({
	name = "Taliaferro",
	key = "taliaferro",
	config = {extra = {chips = 80, odds = 4}},
	pos = {x = 7, y = 6},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,
	no_pool_flag = 'taliaferro_extinct',
	atlas = "Ortalab_Jokers",
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

taliaferro.order = 38

function taliaferro.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
end

taliaferro.calculate = function(self, card, context) --Taliaferro Logic NOTE: MUST ADD POOL FLAGS
	if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
		if pseudorandom('taliaferro') < G.GAME.probabilities.normal/card.ability.extra.odds then
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
			G.GAME.pool_flags.taliaferro_extinct = true
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

return taliaferro