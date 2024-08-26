local init_jokers = function(base_file_path)
	sendInfoMessage("Initializing OrtalabDEMO Jokers")
	local joker_files = NFS.getDirectoryItems(base_file_path.."/Joker LuaList")
	local jokers_to_inject = {}

	--assemble list of jokers_to_inject
	for k, file in pairs(joker_files) do
		if string.find(file, ".lua") then
			local joker = NFS.load(base_file_path.."/Joker LuaList/"..file)()
			if not joker.disabled then jokers_to_inject[#jokers_to_inject+1] = joker end
		end
	end

	table.sort(jokers_to_inject, function(a, b) return a.order < b.order end)

	local curr_joker_order = 1
	for _, joker in pairs(jokers_to_inject) do
		jokers_to_inject[curr_joker_order]:register(joker.order)
		sendInfoMessage("Ortalab Joker Registered: "..joker.name)
		curr_joker_order = curr_joker_order + 1
	end

	--Functions to override that are used by several jokers

	local CardAdd_to_deck_ref = Card.add_to_deck
	function Card.add_to_deck(self, from_debuff)
		-- This whole joker needs redone logic, too lazy to bother
		if not self.added_to_deck then
			if self.ability.name == 'Woo! All 1s' then
				self.added_to_deck = true
				for k, v in pairs(G.GAME.probabilities) do 
					if G.GAME.probabilities[k] == 1 and not next(SMODS.find_card('j_oops')) then
						G.GAME.probabilities[k] = 0
					else
						G.GAME.probabilities[k] = v/2
					end
				end
			end
		end
		CardAdd_to_deck_ref(self, from_debuff)
		if self.added_to_deck then
			if self.ability.name == 'Oops! All 6s' then
				for k, v in pairs(G.GAME.probabilities) do 
					if G.GAME.probabilities[k] == 0 then
						G.GAME.probabilities[k] = 1
					end
				end
			end
			if self.ability.name == 'Business Joker' then
				G.E_MANAGER:add_event(Event({func = function()
					G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - self.ability.extra.reroll_cut
					G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - self.ability.extra.reroll_cut)
					return true end }))
			end
		end
	end

	local CardRemove_from_deck_ref = Card.remove_from_deck
	function Card.remove_from_deck(self, from_debuff)
		if self.added_to_deck then 
			if self.ability.name == 'Woo! All 1s' then
				self.added_to_deck = false
				for k, v in pairs(G.GAME.probabilities) do 
					if G.GAME.probabilities[k] == 0 then
						G.GAME.probabilities[k] = 1
						if next(SMODS.find_card('j_oops')) then
							for kk, vv in pairs(G.jokers.cards) do
								if vv.ability.name == 'Oops! All 6s' then
									G.GAME.probabilities[k] = v*2
								end
							end
						end
					else
						G.GAME.probabilities[k] = v*2
					end
				end
			end
		end
		CardRemove_from_deck_ref(self, from_debuff)
	end

	local CardSell_Card = Card.sell_card --Crime Scene and Evil Eye Logic
	function Card.sell_card(self)
		if next(SMODS.find_card('j_olab_crime_scene')) and self.ability.set == 'Joker' then
			G.GAME.banned_keys[self.config.center.key] = true
		end
		if next(SMODS.find_card('j_olab_evil_eye')) and self.ability.set == 'Spectral' then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Evil Eye' then
					if G.GAME.current_round.spectral_type_sold[self.config.center.key] ~= true then
						G.GAME.current_round.spectral_sold = G.GAME.current_round.spectral_sold + 1
						G.GAME.current_round.spectral_type_sold[self.config.center.key] = true
					end
				end
			end
		end
		return CardSell_Card(self)
	end
end

return {init_func = init_jokers, group_config_enable = "jokers_enabled"}
