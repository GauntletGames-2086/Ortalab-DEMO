local init_vouchers = function(base_file_path)
	sendInfoMessage("Initializing OrtalabDEMO Vouchers")
	local voucher_files = NFS.getDirectoryItems(base_file_path.."/Voucher LuaList")
	local vouchers_to_inject = {}

	--assemble list of vouchers_to_inject
	for k, file in pairs(voucher_files) do
		if string.find(file, ".lua") then
			local voucher = NFS.load(base_file_path.."/Voucher LuaList/"..file)()
			vouchers_to_inject[#vouchers_to_inject+1] = voucher
		end
	end

	table.sort(vouchers_to_inject, function(a, b) return a.order < b.order end)

	local curr_voucher_order = 1
	for _, voucher in pairs(vouchers_to_inject) do
		sendInfoMessage("SMODS.Mods: "..tostring(SMODS.Mods))
		vouchers_to_inject[curr_voucher_order]:register(voucher.order)
		sendInfoMessage("Ortalab Voucher Registered: "..voucher.name)
		curr_voucher_order = curr_voucher_order + 1
	end

	--Functions to override that are used by several vouchers
end

return {init_func = init_vouchers, group_config_enable = "vouchers_enabled"}