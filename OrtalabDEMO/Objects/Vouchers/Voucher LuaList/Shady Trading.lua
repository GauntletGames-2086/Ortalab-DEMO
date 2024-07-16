local voucher_loc_txt = {
	["name"] = "Shady Trading",
	["text"] = {
		"{C:spectral}Spectral{} cards can",
		"appear in the shop",
		"{C:inactive}(Artist: Flare){}"
	}
}

local shady_trading = SMODS.Voucher({
	name = "Shady Trading", --name
	key = "shady_trading", --slug
	config = {}, --config
	pos = {x = 4, y = 2}, --spritePos
	loc_txt = voucher_loc_txt, --loc_txt
	cost = 10, --cost
	unlocked = true, --unlocked
	discovered = true, --discovered
	available = true, --available
	atlas = "Ortalab_Vouchers", --atlas
	register = function(self, order)
		if order and order == self.order then
			self.super.register(self)
		end
	end,
})

shady_trading.order = 25

function shady_trading.redeem(self)
	if G.GAME.spectral_rate < 2 then
		G.GAME.spectral_rate = 2
	end
	G.GAME.pool_flags.shady_trading_redeemed = true
end

return shady_trading