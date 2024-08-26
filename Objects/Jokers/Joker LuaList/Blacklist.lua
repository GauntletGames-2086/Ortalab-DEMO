local joker_loc_txt = {
	["name"] = "Blacklist",
	["text"] = {
		"Earn {C:money}$#1#{} if played {C:attention}poker hand{}",
		"is not a {C:attention}#2#{}",
		"or {C:attention}#3#{}",
		"Poker hands change on every payout",
		"{C:inactive}(Artist: koszetrawe){}"
	}
}

local ban_list = SMODS.Joker({
	name = "Blacklist",
	key = "ban_list",
	config = {extra = {dollars = 2, banlist_poker_hand_1 = 'High Card', banlist_poker_hand_2 = 'Pair'}},
	pos = {x = 4, y = 11},
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
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then _poker_hands[#_poker_hands+1] = k end
		end
		card.ability.extra.banlist_poker_hand_1 = pseudorandom_element(_poker_hands, pseudoseed('blacklist1'))
		_poker_hands[card.ability.extra.banlist_poker_hand_1] = nil
		card.ability.extra.banlist_poker_hand_2 = pseudorandom_element(_poker_hands, pseudoseed('blacklist2'))
		if card.ability.extra.banlist_poker_hand_1 == card.ability.extra.banlist_poker_hand_2 then
			while card.ability.extra.banlist_poker_hand_1 == card.ability.extra.banlist_poker_hand_2 do
				card.ability.extra.banlist_poker_hand_2 = pseudorandom_element(_poker_hands, pseudoseed('blacklist2'))
			end
		end
	end,
})

ban_list.order = 60

function ban_list.loc_vars(card, info_queue, center)
	return {vars = {center.ability.extra.dollars, localize(center.ability.extra.banlist_poker_hand_1, 'poker_hands'), localize(center.ability.extra.banlist_poker_hand_2, 'poker_hands')}}
end

ban_list.calculate = function(self, card, context) --Blacklist Logic
	if not context.other_joker and not context.repetition and not context.individual and not context.end_of_round and not context.discard and not context.pre_discard then
		if context.cardarea == G.jokers and context.before then
			if context.scoring_name ~= card.ability.extra.banlist_poker_hand_1 and context.scoring_name ~= card.ability.extra.banlist_poker_hand_2 then
				G.E_MANAGER:add_event(Event({
					func = function()
						local _poker_hands = {}
						for k, v in pairs(G.GAME.hands) do
							if v.visible then _poker_hands[#_poker_hands+1] = k end
						end
						card.ability.extra.banlist_poker_hand_1 = pseudorandom_element(_poker_hands, pseudoseed('blacklist1'))
						_poker_hands[card.ability.extra.banlist_poker_hand_1] = nil
						card.ability.extra.banlist_poker_hand_2 = pseudorandom_element(_poker_hands, pseudoseed('blacklist2'))
						if card.ability.extra.banlist_poker_hand_1 == card.ability.extra.banlist_poker_hand_2 then
							while card.ability.extra.banlist_poker_hand_1 == card.ability.extra.banlist_poker_hand_2 do
								card.ability.extra.banlist_poker_hand_2 = pseudorandom_element(_poker_hands, pseudoseed('blacklist2'))
							end
						end
						return true
					end
				}))
				ease_dollars(card.ability.extra.dollars)
				G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
				G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
				return {
					message = localize('$')..card.ability.extra.dollars,
					dollars = card.ability.extra.dollars,
					colour = G.C.MONEY
				}
			end
		end
	end
end

return ban_list