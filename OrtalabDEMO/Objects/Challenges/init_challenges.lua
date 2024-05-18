local init_challenges = function(base_file_path)
	sendInfoMessage("Initializing OrtalabDEMO Challenges")
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
		challenges_to_inject[curr_challenge_order][1]:register(challenge.order)
		sendInfoMessage("Ortalab Challenge Registered: "..challenges_to_inject[curr_challenge_order][1].name)
		curr_challenge_order = curr_challenge_order + 1
	end

	--Functions to override that are used by several challenges
end

return {init_func = init_challenges, group_config_enable = "challenges_enabled"}