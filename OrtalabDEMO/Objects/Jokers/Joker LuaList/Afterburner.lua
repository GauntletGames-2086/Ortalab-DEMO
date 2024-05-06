local joker_loc_txt = {
	["name"] = "Afterburner",
	["text"] = {
		"Earn {C:money}$#1#{} at end of round.",
		"Loses {C:red}-$#2#{} when",
		"{C:attention}Boss Blind{} is defeated",
		"{C:inactive}(Artist: Salad){}"
	}
}
local fuel_tank = SMODS.Joker({
	name = "Afterburner", --name
	key = "fuel_tank", --slug
	config = {extra = {money = 8, money_loss = 2}}, --config
	pos = {x = 8, y = 12}, --spritePos
	loc_txt = joker_loc_txt, --loc_txt
	rarity = 2, --rarity
	cost = 6, --cost
	unlocked = true, --unlocked
	discovered = true, --discovered
	blueprint_compat = false, --blueprint_compat
	eternal_compat = false, --eternal_compat
	perishable_compat = true,
	atlas = "Ortalab_Jokers", --atlas
	process_loc_text = function(self)
		SMODS.Joker.process_loc_text(self)
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_leak', "Leaked!")
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_empty', "Empty!")
	end
})

G.localization.misc.dictionary.k_leak = "Leaked!" --Used for Fuel Tank
G.localization.misc.dictionary.k_empty = "Empty!" --Used for Fuel Tank
fuel_tank.order = 74

function fuel_tank.loc_def(center)
	return {center.ability.extra.money, center.ability.extra.money_loss}
end

fuel_tank.calculate = function(self, context) --Fuel Tank Logic
	if not context.blueprint then
		if context.end_of_round and not context.individual and not context.repetition then
			if G.GAME.blind.boss then
				if self.ability.extra.money - self.ability.extra.money_loss <= 0 then
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
					return {
						message = localize('k_empty'),
						colour = G.C.RED
					}
				else
					self.ability.extra.money = self.ability.extra.money - self.ability.extra.money_loss
					return {
						message = localize('k_leak'),
						colour = G.C.MONEY
					}
				end
			end
		end
	end
end

return fuel_tank