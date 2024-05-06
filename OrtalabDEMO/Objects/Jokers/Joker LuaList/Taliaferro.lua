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
})

taliaferro.order = 38

function taliaferro.loc_def(center)
	return {center.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
end

taliaferro.calculate = function(self, context) --Taliaferro Logic NOTE: MUST ADD POOL FLAGS
	if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
		if pseudorandom('taliaferro') < G.GAME.probabilities.normal/self.ability.extra.odds then
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound('tarot1')
					self.T.r = -0.2
					self:juice_up(0.3, 0.4)
					self.states.drag.is = true
					self.children.center.pinch.x = true
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
						func = function()
								G.jokers:remove_card(self)
								self:remove()
								self = nil
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
	if SMODS.end_calculate_context(context) then
		return {
			message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
			chip_mod = self.ability.extra.chips, 
			colour = G.C.CHIPS
		}
	end
end

return taliaferro