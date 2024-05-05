local init_challenges = function(base_file_path)
	sendInfoMessage("Initializing OrtalabDEMO Decks")
	local challenge_files = NFS.getDirectoryItems(base_file_path.."/Challenge LuaList")
	local challenges_to_inject = {}

	--assemble list of challenges_to_inject
	for k, file in pairs(challenge_files) do
		if string.find(file, ".lua") then
			local challenge = NFS.load(base_file_path.."/Challenge LuaList/"..file)()
			challenges_to_inject[#challenges_to_inject+1] = challenge
		end
	end

	table.sort(challenges_to_inject, function(a, b) return a.order < b.order end)

	local curr_challenge_order = 1
	for _, challenge in pairs(challenges_to_inject) do
		table.insert(G.CHALLENGES, challenges_to_inject[curr_challenge_order][1])
		local asdf = challenges_to_inject[curr_challenge_order][1]
		sendInfoMessage("Ortalab Challenge Registered: "..challenges_to_inject[curr_challenge_order][1].name)
		curr_challenge_order = curr_challenge_order + 1
	end

	--Functions to override that are used by several challenges
	function table.contains(table, element)
		for _, value in pairs(table) do
			if value == element then
				return true
			end
		end
		return false
	end
end

return init_challenges