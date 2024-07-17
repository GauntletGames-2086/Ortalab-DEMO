local joker_loc_txt = {
	["name"] = "Collatz Conjecture",
	["text"] = {
		"{X:mult,C:white}X#1#{} Mult if total chips when this",
		"joker is scored are {C:attention}odd{}",
		"{X:mult,C:white}X#2#{} Mult if total chips when this",
		"joker is scored are {C:attention}even{}",
		"{C:inactive}(Artist: ItsFlowwey){}"
	}
}

local collatz = SMODS.Joker({
	name = "Collatz Conjecture",
	key = "collatz",
	config = {extra = {x_mult = 3, x_mult_reduction = 0.5, current_chips = 0}},
	pos = {x = 1, y = 5},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
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

collatz.order = 31

function collatz.loc_vars(self, info_queue, center)
	return {vars = {center.ability.extra.x_mult, center.ability.extra.x_mult_reduction}}
end

collatz.calculate = function(self, card, context) --Collatz Logic
	if context.joker_main then
		if math.floor(to_big(card.ability.extra.current_chips) / 2) * 2 == to_big(card.ability.extra.current_chips) then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
				Xmult_mod = card.ability.extra.x_mult
			}
		else
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult_reduction}},
				Xmult_mod = card.ability.extra.x_mult_reduction
			}
		end
	end
end

local mod_chips_ref = mod_chips
function mod_chips(_chips) --Required for Collatz
	if next(SMODS.find_card("j_olab_collatz")) then
		local curr_chips = _chips
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Collatz Conjecture' then
				v.ability.extra.current_chips = curr_chips
			end
		end
	end
	return mod_chips_ref(_chips)
end

return collatz