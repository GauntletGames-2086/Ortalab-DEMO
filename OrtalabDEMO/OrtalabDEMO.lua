--- STEAMODDED HEADER
--- MOD_NAME: Ortalab DEMO (0.8.0)
--- MOD_ID: OrtalabDEMO
--- MOD_AUTHOR: [Crimson Heart, Balatro Discord]
--- MOD_DESCRIPTION: Every action has an opposite reaction. In another world, in the nation of "Virtue", a simple indie developer created Ortalab, which so happened to be the opposite of our world's Balatro. This mod is intended to port everything from that parallel world to Balatro. Within this demo, it includes 45 Jokers, 4 Decks, 2 sets of Coupons, and 2 Challenges for you to check out.
--- DISPLAY_NAME: Ortalab DEMO
--- BADGE_COLOUR: 990000
--- PREFIX: olab

----------------------------------------------
------------MOD CODE -------------------------

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    loc_colour_ref(_c, _default) -- toss the return value, we don't need it
    G.ARGS.LOC_COLOURS['zodiac'] = HEX('9D3B35')
    G.ARGS.LOC_COLOURS['loteria'] = HEX('B77A91')
    G.ARGS.LOC_COLOURS['cryptid'] = HEX('704F72')

    -- Artist Colors
    G.ARGS.LOC_COLOURS['AlexArt'] = HEX('16db9d')
    G.ARGS.LOC_COLOURS['CheeseArt'] = HEX('a3a616')
    G.ARGS.LOC_COLOURS['CoroArt'] = HEX('9cb3e2')
    G.ARGS.LOC_COLOURS['CrimsonArt'] = HEX('990000')
    G.ARGS.LOC_COLOURS['FlareArt'] = HEX('fd5f55')
    G.ARGS.LOC_COLOURS['FlowweyArt'] = HEX('110663')
    G.ARGS.LOC_COLOURS['GappieArt'] = HEX('7BF2FF')
    G.ARGS.LOC_COLOURS['GoldDiscoArt'] = HEX('e6bb12')
    G.ARGS.LOC_COLOURS['KoszeTraweArt'] = HEX('4ecf21')
    G.ARGS.LOC_COLOURS['LoganArt'] = HEX('ffff00')
    G.ARGS.LOC_COLOURS['SaladArt'] = HEX('0AC400')
    return G.ARGS.LOC_COLOURS[_c] or _default or G.C.UI.TEXT_DARK -- recalculate result
end

SMODS.Atlas{key = "Ortalab_Vouchers", path = "Ortalab_Vouchers.png", px = 71, py = 95}
SMODS.Atlas{key = "Ortalab_Jokers", path = "Ortalab_Jokers.png", px = 71, py = 95}
SMODS.Atlas{key = "Ortalab_Enhancers", path = "Ortalab-Enhancers.png", px = 71, py = 95}

local mod_path = SMODS.current_mod.path

local config = NFS.load(mod_path.."config.lua")()
SMODS.Mods.OrtalabDEMO["config"] = config

local file_groups = NFS.getDirectoryItems(mod_path.."Objects")
local function init_file_groups()
	for k, file_group in pairs(file_groups) do
		local init_files = NFS.getDirectoryItems(mod_path.."Objects/"..file_group)
		for kk, v in pairs(init_files) do
			if string.find(v, ".lua") then
				local init_obj_filepath = tostring(mod_path.."Objects/"..file_group)
				local init_obj_file = NFS.load(mod_path.."Objects/"..file_group.."/"..v)()
				if SMODS.Mods.OrtalabDEMO.config[init_obj_file.group_config_enable] == true then init_obj_file.init_func(init_obj_filepath) end
			end
		end
	end
end

--Helper functions
function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

--Functions to override that are used by several different types of objects

function SMODS.current_mod.reset_game_globals(first_pass)
	if first_pass then
		G.GAME.current_round["spectral_sold"] = 0
		G.GAME.current_round["spectral_type_sold"] = {}
		G.GAME.current_round["olab_free_rerolls"] = 0
	end

	--Monochrome Joker
	local monochrome_suits = {}
	G.GAME.current_round.monochrome_card = {}
    for k, v in ipairs({'Spades','Hearts','Clubs','Diamonds'}) do
        if v ~= G.GAME.current_round.monochrome_card.suit then monochrome_suits[#monochrome_suits + 1] = v end
    end
    local monochrome_card = pseudorandom_element(monochrome_suits, pseudoseed('monochrome'..G.GAME.round_resets.ante))
    G.GAME.current_round.monochrome_card.suit = monochrome_card
end

local BackApply_to_run_ref = Back.apply_to_run
function Back.apply_to_run(self)
	BackApply_to_run_ref(self)

	if self.effect.config.spectral_rate then
		G.E_MANAGER:add_event(Event({
			func = function() 
				G.GAME.used_vouchers['v_olab_shady_trading'] = true
				G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
				G.GAME.pool_flags.shady_trading_redeemed = true
				return true 
			end 
		}))
	end
end

to_big = to_big or function(num)
	return num
end

init_file_groups()

----------------------------------------------
------------MOD CODE END----------------------
