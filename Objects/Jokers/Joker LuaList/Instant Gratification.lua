local joker_loc_txt = {
	["name"] = "Instant Gratification",
	["text"] = {
		"{C:money}+1${} when you",
		"use a {C:red}discard{}",
		"{C:inactive}(Artist: Flare){}"
	}
}

local instant_gratification = SMODS.Joker({
	name = "Instant Gratification",
	key = "instant_gratification",
	config = {extra = 1},
	pos = {x = 4,y = 3},
	loc_txt = joker_loc_txt,
	rarity = 1,
	cost = 5,
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

instant_gratification.order = 35

instant_gratification.calculate = function(self, card, context) --Instant Gratification logic
	if context.discard and context.other_card == context.full_hand[#context.full_hand] then
		G.E_MANAGER:add_event(Event({
			func = function()
				ease_dollars(card.ability.extra)
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('$')..card.ability.extra,colour = G.C.MONEY, delay = 0.45})
				return true
			end}))
		return
	end
end

return instant_gratification