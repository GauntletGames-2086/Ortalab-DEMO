local joker_loc_txt = {
	["name"] = "Prolétaire",
	["text"] = {
		"3X blind {C:money}reward money{}",
		"Applies random {C:red}Boss Blind{}",
		"effect when blind is selected",
		"{C:inactive}(Currently: {C:attention}#1#{})",
		"{C:inactive}(Artist: ){}"
	}
}

local proletaire = SMODS.Joker({
	name = "Prolétaire",
	key = "proletaire",
	config = {extra = {boss_blind_applied = nil}},
	pos = {x = 4, y = 5},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
	process_loc_text = function(self)
		SMODS.Joker.process_loc_text(self)
		SMODS.process_loc_text(G.localization.misc.dictionary, 'k_na', "N/A")
	end,
	register = function(self, order)
		if order and order == self.order then
			SMODS.Joker.register(self)
		end
	end,
})

proletaire.order = 129

function proletaire.loc_vars(card, info_queue, center)
	if center.ability.extra.boss_blind_applied == nil then
		return {vars = {localize('k_na')}}
	else
		return {vars = {localize{type = 'name_text', set = 'Blind', key = center.ability.extra.boss_blind_applied.key, nodes = {}}}}
	end
end

proletaire.calculate = function(self, card, context) --Prolétaire Logic
	if not context.blueprint then
		if context.setting_blind and not card.getting_sliced then
			local all_blind_configs = {}
			card.ability.extra.boss_blind_applied = nil
			local banned_blinds = {}
			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].ability.name == 'Prolétaire' then
					banned_blinds[i] = G.jokers.cards[i].ability.boss_blind_applied
				end
			end
			for k, v in pairs(G.P_BLINDS) do
				if v ~= G.P_BLINDS.bl_small and v ~= G.P_BLINDS.bl_big then
					if v ~= G.P_BLINDS.bl_final_leaf and v ~= G.P_BLINDS.bl_final_acorn and v ~= G.P_BLINDS.bl_final_bell and v ~= G.P_BLINDS.bl_final_heart and v ~= G.P_BLINDS.bl_final_vessel then
						if banned_blinds[v] == nil and v ~= G.GAME.blind then 
							table.insert(all_blind_configs,G.P_BLINDS[k]) 
						end
					end
				end
			end
			local boss_blind = pseudorandom_element(all_blind_configs, pseudoseed('proletaire'))
			card.ability.extra.boss_blind_applied = boss_blind
			G.GAME.blind.dollars = G.GAME.blind.dollars*3

			--Setting Blind effects
			if card.ability.extra.boss_blind_applied.name == 'The Eye' then
				card.ability.extra.boss_blind_applied.hands = {
					["Flush Five"] = false,
					["Flush House"] = false,
					["Five of a Kind"] = false,
					["Straight Flush"] = false,
					["Four of a Kind"] = false,
					["Full House"] = false,
					["Flush"] = false,
					["Straight"] = false,
					["Three of a Kind"] = false,
					["Two Pair"] = false,
					["Pair"] = false,
					["High Card"] = false,
				}
			end
			if card.ability.extra.boss_blind_applied.name == 'The Mouth' then
				card.ability.extra.boss_blind_applied.only_hand = false
			end
			if card.ability.extra.boss_blind_applied.name == 'The Fish' then 
				card.ability.extra.boss_blind_applied.prepped = nil
			end
			if card.ability.extra.boss_blind_applied.name == 'The Water' then 
				card.ability.extra.boss_blind_applied.discards_sub = G.GAME.current_round.discards_left
				ease_discard(-card.ability.extra.boss_blind_applied.discards_sub)
			end
			if card.ability.extra.boss_blind_applied.name == 'The Needle' then 
				card.ability.extra.boss_blind_applied.hands_sub = G.GAME.round_resets.hands - 1
				ease_hands_played(-card.ability.extra.boss_blind_applied.hands_sub)
			end
			if card.ability.extra.boss_blind_applied.name == 'The Manacle' then
				G.hand:change_size(-1)
			end
			if card.ability.extra.boss_blind_applied.name == 'The Wall' then
				G.GAME.blind.chips = G.GAME.blind.chips*2
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end

			--Debuff Cards
			for _, v in ipairs(G.playing_cards) do
				if card.ability.extra.boss_blind_applied.debuff.suit and v:is_suit(card.ability.extra.boss_blind_applied.debuff.suit, true) then
					v:set_debuff(true)
				elseif card.ability.extra.boss_blind_applied.debuff.is_face == 'face' and v:is_face(true) then
					v:set_debuff(true)
				elseif card.ability.extra.boss_blind_applied.name == 'The Pillar' and v.ability.played_this_ante then
					v:set_debuff(true)
				elseif card.ability.extra.boss_blind_applied.debuff.value and card.ability.extra.boss_blind_applied.debuff.value == v.base.value then
					v:set_debuff(true)
				elseif card.ability.extra.boss_blind_applied.debuff.nominal and card.ability.extra.boss_blind_applied.debuff.nominal == v.base.nominal then
					v:set_debuff(true)
				end
			end
		end
	end
	if context.end_of_round and not context.individual and not context.repetition then
		if card.ability.extra.boss_blind_applied.name == 'The Manacle' then
			G.hand:change_size(1)
		end
	end
end

local BlindModifyHand_ref = Blind.modify_hand
function Blind.modify_hand(self, cards, poker_hands, text, mult, hand_chips) --Prolétaire Logic
	local proletaire_is_flint = false
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' then
				if v.ability.extra.boss_blind_applied.name == 'The Flint' then proletaire_is_flint = true end
			end
		end
	end
	if proletaire_is_flint == false then return BlindModifyHand_ref(self, cards, poker_hands, text, mult, hand_chips) end
	self.triggered = true
	return math.max(math.floor(mult*0.5 + 0.5), 1), math.max(math.floor(hand_chips*0.5 + 0.5), 0), true
end

local GFUNCSdraw_from_deck_to_hand_ref = G.FUNCS.draw_from_deck_to_hand
G.FUNCS.draw_from_deck_to_hand = function(e) --Prolétaire Logic
	local proletaire_is_serpent = false
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' then
				if v.ability.extra.boss_blind_applied.name == 'The Serpent' then proletaire_is_serpent = true end
			end
		end
	end
	if proletaire_is_serpent == false then return GFUNCSdraw_from_deck_to_hand_ref(e) end
	
	if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and
		G.hand.config.card_limit <= 0 and #G.hand.cards == 0 then 
		G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false 
		return true
	end

	local hand_space = e or math.min(#G.deck.cards, G.hand.config.card_limit - #G.hand.cards)
	if (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
		hand_space = math.min(#G.deck.cards, 3)
	end
	delay(0.3)
	for i=1, hand_space do --draw cards from deckL
		if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
			draw_card(G.deck,G.hand, i*100/hand_space,'up', true)
		else
			draw_card(G.deck,G.hand, i*100/hand_space,'up', true)
		end
	end
end

local Blinddebuff_card_ref = Blind.debuff_card
function Blind.debuff_card(self, card, from_blind)
	local main_blind_debuff = Blinddebuff_card_ref(self, card, from_blind)
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' and v.ability.extra.boss_blind_applied then
				local blind = G.P_BLINDS[v.ability.extra.boss_blind_applied.key]
				if type(blind.debuff) == 'table' and card.area ~= G.jokers then
					if blind.debuff.suit and card:is_suit(blind.debuff.suit, true) then
						card:set_debuff(true)
						return
					end
					if blind.debuff.is_face =='face' and card:is_face(true) then
						card:set_debuff(true)
						return
					end
					if blind.name == 'The Pillar' and card.ability.played_this_ante then
						card:set_debuff(true)
						return
					end
					if blind.debuff.value and blind.debuff.value == card.base.value then
						card:set_debuff(true)
						return
					end
					if blind.debuff.nominal and blind.debuff.nominal == card.base.nominal then
						card:set_debuff(true)
						return
					end
				end
			end
		end
	end
	return main_blind_debuff
end

local BlindDebuff_Hand_ref = Blind.debuff_hand
function Blind.debuff_hand(self, cards, hand, handname, check) --Prolétaire Logic
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' then
				if v.ability.extra.boss_blind_applied.debuff then
					v.ability.extra.boss_blind_applied.triggered = false
					if v.ability.extra.boss_blind_applied.debuff.hand and next(hand[v.ability.extra.boss_blind_applied.debuff.hand]) then
						v.ability.extra.boss_blind_applied.triggered = true
						return true
					end
					if v.ability.extra.boss_blind_applied.debuff.h_size_ge and #cards < v.ability.extra.boss_blind_applied.debuff.h_size_ge then
						v.ability.extra.boss_blind_applied.triggered = true
						return true
					end
					if v.ability.extra.boss_blind_applied.debuff.h_size_le and #cards > v.ability.extra.boss_blind_applied.debuff.h_size_le then
						v.ability.extra.boss_blind_applied.triggered = true
						return true
					end
					if v.ability.extra.boss_blind_applied.name == "The Eye" then
						if v.ability.extra.boss_blind_applied.hands[handname] then
							v.ability.extra.boss_blind_applied.triggered = true
							return true
						end
						if not check then v.ability.extra.boss_blind_applied.hands[handname] = true end
					end
					if v.ability.extra.boss_blind_applied.name == "The Mouth" then
						if v.ability.extra.boss_blind_applied.only_hand and v.ability.extra.boss_blind_applied.only_hand ~= handname then
							v.ability.extra.boss_blind_applied.triggered = true
							return true
						end
						if not check then v.ability.extra.boss_blind_applied.only_hand = handname end
					end
				end
				if v.ability.extra.boss_blind_applied.name == 'The Arm' then 
					v.ability.extra.boss_blind_applied.triggered = false
					if G.GAME.hands[handname].level > 1 then
						v.ability.extra.boss_blind_applied.triggered = true
						if not check then
							level_up_hand(v, handname, nil, -1)
						end
					end 
				end
				if v.ability.extra.boss_blind_applied.name == 'The Ox' then 
					v.ability.extra.boss_blind_applied.triggered = false
					if handname == G.GAME.current_round.most_played_poker_hand then
						v.ability.extra.boss_blind_applied.triggered = true
						if not check then
							ease_dollars(-G.GAME.dollars, true)
						end
					end 
				end
			end
		end
	end
	return BlindDebuff_Hand_ref(self, cards, hand, handname, check)
end

local BlindStay_Flipped_ref = Blind.stay_flipped
function Blind.stay_flipped(self, area, card) --Prolétaire Logic
	if not self.disabled then
		if area == G.hand then
			if self.name == 'The Wheel' and pseudorandom(pseudoseed('wheel')) < G.GAME.probabilities.normal/7 then
				return true
			end
			if self.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
				return true
			end
			if self.name == 'The Mark' and card:is_face(true) then
				return true
			end
			if self.name == 'The Fish' and self.prepped then 
				return true
			end
		end
	end
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' and area == G.hand then
				if v.ability.extra.boss_blind_applied.name == 'The Wheel' and pseudorandom(pseudoseed('wheel')) < G.GAME.probabilities.normal/7 then
					return true
				end
				if v.ability.extra.boss_blind_applied.name == 'The House' and G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
					return true
				end
				if v.ability.extra.boss_blind_applied.name == 'The Mark' and card:is_face(true) then
					return true
				end
				if v.ability.extra.boss_blind_applied.name == 'The Fish' and v.ability.extra.boss_blind_applied.prepped then 
					return true
				end
			end
		end
	end
	return BlindStay_Flipped_ref(self, area, card)
end

local BlindPress_Play = Blind.press_play
function Blind.press_play(self) --Prolétaire Logic
	if next(SMODS.find_card("j_olab_proletaire")) then
		for k, v in pairs(G.jokers.cards) do
			if v.ability.name == 'Prolétaire' then
				if v.ability.extra.boss_blind_applied.name == 'The Hook' then
					G.E_MANAGER:add_event(Event({ func = function()
						local any_selected = nil
						local _cards = {}
						for k, v in ipairs(G.hand.cards) do
							_cards[#_cards+1] = v
						end
						for i = 1, 2 do
							if G.hand.cards[i] then 
								local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('hook'))
								G.hand:add_to_highlighted(selected_card, true)
								table.remove(_cards, card_key)
								any_selected = true
								play_sound('card1', 1)
							end
						end
						if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
					return true end })) 
					self.triggered = true
					delay(0.7)
				end
				if v.ability.extra.boss_blind_applied.name == 'The Fish' then
					self.prepped = true
				end
				if v.ability.extra.boss_blind_applied.name == 'The Tooth' then
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
						for i = 1, #G.play.cards do
							G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
							ease_dollars(-1)
							delay(0.23)
						end
						return true end }))
					self.triggered = true
				end
			end
		end
	end
	return BlindPress_Play(self)
end

return proletaire