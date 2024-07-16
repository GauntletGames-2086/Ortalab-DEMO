local init_decks = function(base_file_path)
	sendInfoMessage("Initializing OrtalabDEMO Decks")
	local deck_files = NFS.getDirectoryItems(base_file_path.."/Deck LuaList")
	local decks_to_inject = {}

	--assemble list of decks_to_inject
	for k, file in pairs(deck_files) do
		if string.find(file, ".lua") then
			local deck = NFS.load(base_file_path.."/Deck LuaList/"..file)()
			decks_to_inject[#decks_to_inject+1] = deck
		end
	end

	table.sort(decks_to_inject, function(a, b) return a.order < b.order end)

	local curr_deck_order = 1
	for _, deck in pairs(decks_to_inject) do
		decks_to_inject[curr_deck_order]:register(deck.order)
		sendInfoMessage("Ortalab Deck Registered: "..deck.name)
		curr_deck_order = curr_deck_order + 1
	end

	--Functions to override that are used by several decks
end

return {init_func = init_decks, group_config_enable = "decks_enabled"}