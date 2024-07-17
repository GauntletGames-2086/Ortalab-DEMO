local joker_loc_txt = {
	["name"] = "Monochrome Joker",
	["text"] = {
		"All cards are also considered",
		"to be {V:1}#1#{} suit, changes",
		"when blind is selected",
		"{C:inactive}(Artist: Salad){}"
	}
}

local monochrome = SMODS.Joker({
	name = "Monochrome",
	key = "monochrome",
	config = {},
	pos = {x = 4, y = 6},
	loc_txt = joker_loc_txt,
	rarity = 2,
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

monochrome.order = 113

function monochrome.loc_vars(card, info_queue, center)
	return {vars = {localize((G.GAME.current_round.monochrome_card and G.GAME.current_round.monochrome_card.suit or "Spades"), 'suits_singular'), colours = {G.C.SUITS[G.GAME.current_round.monochrome_card and G.GAME.current_round.monochrome_card.suit or "Spades"]}}}
end

local CardIs_Suit_ref = Card.is_suit
function Card.is_suit(self, suit, bypass_debuff, flush_calc) --Monochrome Logic
	local orig_CardIs_Suit_ref = CardIs_Suit_ref(self, suit, bypass_debuff, flush_calc)
	if not flush_calc and not self.debuff and not bypass_debuff and (next(SMODS.find_card('j_olab_monochrome')) and suit == G.GAME.current_round.monochrome_card.suit) then
		return true
	else
		return orig_CardIs_Suit_ref
	end
end

return monochrome