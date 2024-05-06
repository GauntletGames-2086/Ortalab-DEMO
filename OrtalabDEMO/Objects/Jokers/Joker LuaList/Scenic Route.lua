local joker_loc_txt = {
	["name"] = "Scenic Route",
	["text"] = {
		"{C:attention}Straights{} can be",
		"made with {C:attention}pairs{}",
		"{C:inactive}(ex: {C:attention}7 7 6 6 5{C:inactive})",
		"{C:inactive}(Artist: KoszeTrawe){}"
	}
}

local scenic_route = SMODS.Joker({
	name = "Scenic Route",
	key = "scenic_route",
	config = {},
	pos = {x = 3, y = 12},
	loc_txt = joker_loc_txt,
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "Ortalab_Jokers",
})

scenic_route.order = 69

local get_straight_ref = get_straight
function get_straight(hand)--Scenic Route Logic
	if not next(find_joker('Scenic Route')) then return get_straight_ref(hand) end

	local ret = {}
	local four_fingers = next(find_joker('Four Fingers'))
	local total_cards = 0
	local straight_pair_ids = {}
	if #hand > 5 or #hand < (5 - (four_fingers and 1 or 0)) then return ret else
		local t = {}
		local IDS = {}
		for i=1, #hand do
			local id = hand[i]:get_id()
			if id > 1 and id < 15 then
				if IDS[id] then
					IDS[id][#IDS[id]+1] = hand[i]
				else
					IDS[id] = {hand[i]}
				end
			end
		end

		for k, v in pairs(IDS) do
			if type(v) == 'table' then
				total_cards = 0
				for kk, vv in ipairs(v) do
					total_cards = total_cards + 1
				end
				if total_cards == 2 then straight_pair_ids[k] = true end
			end
		end

		local straight_length = 0
		local straight = false
		local can_skip = next(find_joker('Shortcut'))
		local can_straight_pair = next(find_joker('Scenic Route'))
		local skipped_rank = false
		local skipped_pair = false
		for j = 1, 14 do
			if IDS[j == 1 and 14 or j] then
				straight_length = straight_length + 1
				skipped_rank = false
				skipped_pair = false
				if straight_pair_ids[j] == true then 
					straight_length = straight_length + 1
				end
				for k, v in ipairs(IDS[j == 1 and 14 or j]) do
					t[#t+1] = v
				end
			elseif can_skip and not skipped_rank and not skipped_pair and j ~= 14 then
				skipped_rank = true
			else
				straight_length = 0
				skipped_rank = false
				skipped_pair = false
				if not straight then t = {} end
				if straight then break end
			end
			if straight_length >= (5 - (four_fingers and 1 or 0)) then straight = true end 
		end
		if not straight then return ret end
		table.insert(ret, t)
		return ret
	end
end

return scenic_route