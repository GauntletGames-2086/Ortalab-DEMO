local voucher_loc_txt = {
	["name"] = "Infinite Scroll",
	["text"] = {
		"+2 free {C:green}rerolls{}",
		"per shop",
		"{C:green}Reroll{} price {C:red}+2${}",
		"{C:inactive}(Artist: Flare){}"
	}
}

local infinite_scroll = SMODS.Voucher({
	name = "Infinite Scroll", --name
	key = "infinite_scroll", --slug
	config = {free_rerolls = 2}, --config
	pos = {x = 0, y = 3}, --spritePos
	loc_txt = voucher_loc_txt, --loc_txt
	cost = 10, --cost
	unlocked = true, --unlocked
	discovered = true, --discovered
	available = false, --available
	requires = {'v_window_shopping'}, --requires
	atlas = "Ortalab_Vouchers", --atlas
	register = function(self, order)
		if order and order == self.order then
			SMODS.Center.register(self)
		end
	end,
})

infinite_scroll.order = 8

function infinite_scroll.redeem(self)
	G.E_MANAGER:add_event(Event({func = function()
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 2
		G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 2
		G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 2)
		calculate_reroll_cost(true)
		return true 
	end }))
end

return infinite_scroll