--- STEAMODDED HEADER
--- MOD_NAME: Ortalab DEMO (0.8.0)
--- MOD_ID: OrtalabDEMO
--- MOD_AUTHOR: [Crimson Heart, Balatro Discord]
--- MOD_DESCRIPTION: Every action has an opposite reaction. In another world, in the nation of "Virtue", a simple indie developer created Ortalab, which so happened to be the opposite of our world's Balatro. This mod is intended to port everything from that parallel world to Balatro. Within this demo, it includes 40 Jokers and 3 decks for you to check out.
--- DISPLAY_NAME: Ortalab DEMO
--- BADGE_COLOUR: 990000

----------------------------------------------
------------MOD CODE -------------------------

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    loc_colour_ref(_c, _default) -- toss the return value, we don't need it
    G.ARGS.LOC_COLOURS['zodiac'] = HEX('9D3B35')
    G.ARGS.LOC_COLOURS['loteria'] = HEX('B77A91')
    G.ARGS.LOC_COLOURS['cryptid'] = HEX('704F72')
    return G.ARGS.LOC_COLOURS[_c] or _default or G.C.UI.TEXT_DARK -- recalculate result
end

function SMODS.INIT.OrtalabSprites()
    local OrtalabDEMO = SMODS.findModByID("OrtalabDEMO")
    local Ortalab_Enhancers = SMODS.Sprite:new('centers', OrtalabDEMO.path, 'Ortalab-Enhancers.png', 71, 95, 'asset_atli')
    Ortalab_Enhancers:register()
end

function SMODS.INIT.Ortalab()
    local jokers_def = {
		jester = { -- Jester
			["name"] = "Jester",
			["text"] = {
				"{C:chips}+25{} Chips",
				"{C:inactive}(Artist: Crimson Heart){}"
			}
		},
		patient_joker = { -- Patient Joker
			["name"] = "Patient Joker",
			["text"] = {
				"Played cards with",
				"{C:spades}#2#{} suit give",
				"{C:chips}+#1#{} Chips when scored", 
				"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
			}
		},
		chastful_joker = { -- Chastful Joker
			["name"] = "Chastful Joker",
			["text"] = {
				"Played cards with",
				"{C:hearts}#2#{} suit give",
				"{C:chips}+#1#{} Chips when scored", 
				"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
			}
		},
		abstemious_joker = { -- Abstemious Joker
			["name"] = "Abstemious Joker",
			["text"] = {
				"Played cards with",
				"{C:clubs}#2#{} suit give",
				"{C:chips}+#1#{} Chips when scored", 
				"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
			}
		},
		generous_joker = { -- Generous Joker
			["name"] = "Generous Joker",
			["text"] = {
				"Played cards with",
				"{C:diamonds}#2#{} suit give",
				"{C:chips}+#1#{} Chips when scored", 
				"{C:inactive}(Artists: GoldenDiscoPig, Flare){}"
			}
		},
		popcorn_bag = { -- Popcorn Bag
			["name"] = "Popcorn Bag",
			["text"] = {
				"{C:mult}+#1#{} Mult.",
				"{C:mult}+#2#{} Mult per round played",
				"Explodes when greater than {C:mult}+20{}",
				"{C:inactive}(Artist: ){}"
			}
		},
		the_solo = { -- The Solo
			["name"] = "The Solo",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult if played",
				"hand is a {C:attention}#2#",
				"{C:inactive}(Artist: ItsFlowwey){}"
			}
		},
		the_mysterium = { -- The Mysterium
			["name"] = "The Mysterium",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult if played",
				"hand is a Secret Hand",
				"{C:inactive}(Artist: ItsFlowwey){}"
			}
		},
		the_spectrum = { -- The Spectrum
			["name"] = "The Spectrum",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult if played",
				"hand does not",
				"contain a {C:attention}#2#",
				"{C:inactive}(Artist: ){}"
			}
		},
		collatz = { -- Collatz Conjecture
			["name"] = "Collatz Conjecture",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult if total chips when this",
				"joker is scored are {C:attention}odd{}",
				"{X:mult,C:white}X#2#{} Mult if total chips when this",
				"joker is scored are {C:attention}even{}",
				"{C:inactive}(Artist: ItsFlowwey){}"
			}
		},
		triangle_joker = { -- Triangle Joker
			["name"] = "Triangle Joker",
			["text"] = {
				"This Joker gains {C:mult}+#1#{} Mult if played hand",
				"has exactly {C:attention}3{} cards",
				"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				"{C:inactive}(Artist: ){}"
			}
		},
		croupier = { -- Triangle Joker
			["name"] = "Croupier",
			["text"] = {
				"Booster packs contain",
				"{C:attention}1{} additional card",
				"{C:inactive}(Artist: ){}"
			}
		},
		chameleon_joker = { -- Chameleon Joker
			["name"] = "Chameleon Joker",
			["text"] = {
				"Copies ability of a random joker",
				"when blind is selected",
				"{C:inactive}(Copied Joker: {C:attention}#1#{C:inactive})",
				"{C:inactive}(Artist: ){}"
			}
		},
		taliaferro = { -- Taliaferro
			["name"] = "Taliaferro",
			["text"] = {
				"{C:chips}+#1#{} Chips",
				"{C:green}#2# in #3#{} chance this",
				"card is destroyed",
				"at end of round",
				"{C:inactive}(Artists: Flare, Grassy){}"
			}
		},
		royal_gala = { -- Royal Gala
			["name"] = "Royal Gala",
			["text"] = {
				"{C:chips}+#1#{} Chips",
				"{C:green}#2# in #3#{} chance this",
				"card is destroyed",
				"at end of round",
				"{C:inactive}(Artists: ItsFlowwey, Grassy){}",
				"{C:inactive}(in_salad, Flare){}"
			}
		},
		sedimentation = { -- Sedimentation
			["name"] = "Sedimentation",
			["text"] = {
				"{C:red}+#1#{} Mult for each",
				"card above {C:attention}#3#{}",
				"in your full deck",
				"{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
				"{C:inactive}(Artist: ){}"
			}
		},
		ban_list = { -- Blacklist
			["name"] = "Blacklist",
			["text"] = {
				"Earn {C:money}$#1#{} if played {C:attention}poker hand{}",
				"is not a {C:attention}#2#{}",
				"or {C:attention}#3#{}",
				"Poker hands change on every payout",
				"{C:inactive}(Artist: ){}"
			}
		},
		virus = { -- Virus
			["name"] = "Virus",
			["text"] = {
				"If {C:attention}first hand{} of round has only",
				"{C:attention}1{} card, destroy it and",
				"convert {C:attention}#1# random cards",
				"in hand to played card",
				"{C:inactive}(Artist: ){}"
			}
		},
		inverse_midas = { -- Beyond The Mask
			["name"] = "Beyond The Mask",
			["text"] = {
				"Earn {C:money}#1#${} at end of round",
				"Gains {C:money}#2#${} per discarded {C:attention,E:1}Gold{} Card",
				"Discarded {C:attention,E:1}Gold{} Cards are destroyed",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		fuel_tank = { -- Fuel Tank
			["name"] = "Afterburner",
			["text"] = {
				"Earn {C:money}$#1#{} at end of round.",
				"Loses {C:red}-$#2#{} when",
				"{C:attention}Boss Blind{} is defeated",
				"{C:inactive}(Artist: ){}"
			}
		},
		mint_condition = { -- Fuel Tank
			["name"] = "Mint Condition",
			["text"] = {
				"{C:attention}Jokers{} that earn money on {C:money}payout{}",
				"each give {X:mult,C:white}X#1#{} Mult",
				"{C:inactive}(Artist: ){}"
			}
		},
		frowny_face = { -- Frowny Face
			["name"] = "Frowny Face",
			["text"] = {
				"Played numbered cards",
				"give {C:mult}+#1#{} Mult when scored",
				"{C:inactive}(Artist: GoldenDiscoPig){}"
			}
		},
		scared_face = { -- Scared Face
			["name"] = "Scared Face",
			["text"] = {
				"Played numbered cards",
				"give {C:chips}+#1#{} Chips when scored",
				"{C:inactive}(Artist: GoldenDiscoPig){}"
			}
		},
		mystery_soda = { -- Mystery Cola
			["name"] = "Mystery Soda",
			["text"] = {
				"Sell this card to create",
				"two free tags",
				"{C:inactive}(Artist: ){}"
			}
		},
		dawn = { -- Dawn
			["name"] = "Dawn",
			["text"] = {
				"Retrigger all played",
				"cards in {C:attention}first",
				"{C:attention}hand{} of round",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		slot_machine = { -- Slot Machine
			["name"] = "Slot Machine",
			["text"] = {
				"If played hand contains three {C:attention}Lucky 7s{}",
				"create a random {C:spectral}Spectral{} card",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		roscharch_test = { -- Roscharch Test
			["name"] = "Roscharch Test",
			["text"] = {
				"For each played 2 or 5, either give",
				"{C:chips}+#1#{} Chips or {C:mult}+#2#{} when scored",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		woo_all_1s = { -- Woo! All 1s
			["name"] = "Woo! All 1s",
			["text"] = {
				"Halves all {C:attention}listed{} {C:green,E:1,S:1.1}probabilities{}",
				"{C:inactive}(ex: {C:green}1 in 4{C:inactive} -> {C:green}0 in 4{C:inactive})",
				"{C:inactive}(Artist: Crimson Heart){}"
			}
		},
		crime_scene = { -- Crime Scene
			["name"] = "Crime Scene",
			["text"] = {
				"Jokers that have been",
				"{C:attention}sold{} or {C:attention}destroyed{}",
				"cannot appear in the shop",
				"{C:inactive}(Artist: Grassy){}"
			}
		},
		occultist = { -- Occultist
			["name"] = "Occultist",
			["text"] = {
				"All {C:spectral}Spectral{} card and {C:spectral}Spectral Packs{}",
				"in the shop are free",
				"{C:inactive}(Artist: ){}"
			}
		},
		shrine = { -- Shrine
			["name"] = "Shrine",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult per",
				"{C:spectral}Spectral{} card used",
				"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				"{C:inactive}(Artist: ){}"
			}
		},
		evil_eye = { -- Evil Eye
			["name"] = "Evil Eye",
			["text"] = {
				"Earn {C:money}$#1#{} at end of round",
				"per each unique {C:spectral}Spectral{} card {C:attention}sold",
				"{C:inactive}(Currently {C:money}$#2#{C:inactive})",
				"{C:inactive}(Artist: ){}"
			}
		},
		fine_wine = { -- Fine Wine
			["name"] = "Fine Wine",
			["text"] = {
				"{C:red}+#1#{} discards, gains {C:red}+1{} discard",
				"when blind is selected",
				"{C:green}#2# in #3#{} chance this joker is",
				"destroyed at end of round",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		monochrome = { -- Monochrome
			["name"] = "Monochrome Joker",
			["text"] = {
				"All cards are considered",
				"{V:1}#1#{} cards, changes when",
				"blind is selected",
				"{C:inactive}(Artist: im_salad){}"
			}
		},
		proletaire = { -- Prolétaire
			["name"] = "Prolétaire",
			["text"] = {
				"3X blind {C:money}reward money{}",
				"Applies random {C:red}Boss Blind{}",
				"effect when blind is selected",
				"{C:inactive}(Currently: {C:attention}#1#{})",
				"{C:inactive}(Artist: ){}"
			}
		},
		art_gallery = { -- Art Gallery
			["name"] = "Art Gallery",
			["text"] = {
				"{C:chips}+#1#{} Chips for",
				"each {C:attention}Joker{} and",
				"{C:tarot}Consumable{} card",
				"{C:inactive}(Currently {C:chips}+#2#{C:inactive}){}",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		instant_gratification = { -- Instant Gratification
			["name"] = "Instant Gratification",
			["text"] = {
				"{C:money}+1${} when you",
				"use a {C:red}discard{}",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		coupon = { -- Coupon
			["name"] = "Coupon",
			["text"] = {
				"{C:red}-#1#{} Chips",
				"All cards in the shop",
				"are {C:money}#2#%{} off",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		graffiti = { -- Graffiti
			["name"] = "Graffiti",
			["text"] = {
				"{C:mult}+#1#{} Mult",
				"per hand remaining",
				"{C:inactive}(Currently {C:mult}+#2#{} Mult){}",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		mathmagician = { -- Mathmagician
			["name"] = "Mathmagician",
			["text"] = {
				"Creates a random {C:tarot}Tarot{}",
				"card if discarded hand",
				"contains {C:attention}4 numbered cards{}",
				"{C:inactive}(Artist: Flare){}"
			}
		}
	}
	local voucher_def = {
		shady_trading = { -- Shady Trading
			["name"] = "Shady Trading",
			["text"] = {
				"{C:spectral}Spectral{} cards can",
				"appear in the shop",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		illegal_imports = { -- Illegal Imports
			["name"] = "Illegal Imports",
			["text"] = {
				"{C:spectral}Spectral{} cards appear",
				"{C:attention}2X{} more frequently in the shop",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		window_shopping = { -- Window Shopping
			["name"] = "Window Shopping",
			["text"] = {
				"+1 free {C:green}reroll{}",
				"per shop", 
				"{C:green}Reroll{} price {C:red}+1${}",
				"{C:inactive}(Artist: Flare){}"
			}
		},
		infinite_scroll = { -- Infinite Scroll
			["name"] = "Infinite Scroll",
			["text"] = {
				"+2 free {C:green}rerolls{}",
				"per shop",
				"{C:green}Reroll{} price {C:red}+2${}",
				"{C:inactive}(Artist: Flare){}"
			}
		}
	}
	local OrtalabDecks_def = {
        Cyan = {
            ["name"] = "Cyan Deck",
            ["text"] = {
                [1] = "{C:blue}+2{} hands",
                [2] = "{C:red}-1{} discard",
            }
        },
        Orange = {
                ["name"] = "Orange Deck",
                ["text"] = {
                    [1] = "{C:red}+2{} discards",
                [2] = "{C:blue}-1{} hand",
            }
        },
        Sketched = {
            ["name"] = "Sketched Deck",
            ["text"] = {
                [1] = "{C:red}-1{} Hand Size",
                [2] = "{C:attention}+1{} Joker Slot",
            }
        }
    }

	--Joker config setup
    -- SMODS.Joker:new(name, slug, config, spritePos, loc_txt, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat, effect, atlas, soul_pos)
	local jester = SMODS.Joker:new(
		"Jester", --name
		"jester", --slug
		{extra = {chips = 25}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.jester, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local generous_joker = SMODS.Joker:new(
		"Generous Joker", --name
		"generous_joker", --slug
		{extra = {chips = 30, suit = 'Diamonds'}}, --config
		{x = 6, y = 1}, --spritePos
		jokers_def.generous_joker, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local chastful_joker = SMODS.Joker:new(
		"Chastful Joker", --name
		"chastful_joker", --slug
		{extra = {chips = 30, suit = 'Hearts'}}, --config
		{x = 7, y = 1}, --spritePos
		jokers_def.chastful_joker, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local patient_joker = SMODS.Joker:new(
		"Patient Joker", --name
		"patient_joker", --slug
		{extra = {chips = 30, suit = 'Spades'}}, --config
		{x = 8, y = 1}, --spritePos
		jokers_def.patient_joker, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local abstemious_joker = SMODS.Joker:new(
		"Abstemious Joker", --name
		"abstemious_joker", --slug
		{extra = {chips = 30, suit = 'Clubs'}}, --config
		{x = 9, y = 1}, --spritePos
		jokers_def.abstemious_joker, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
    local popcorn_bag = SMODS.Joker:new(
		"Popcorn Bag", --name
		"popcorn_bag", --slug
		{extra = {a_mult = 0, a_mult_add = 4}}, --config
		{x = 1, y = 15}, --spritePos
		jokers_def.popcorn_bag, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local the_solo = SMODS.Joker:new(
		"The Solo", --name
		"the_solo", --slug
		{extra = {x_mult = 4, type = 'High Card'}}, --config
		{x = 5, y = 4}, --spritePos
		jokers_def.the_solo, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local the_mysterium = SMODS.Joker:new(
		"The Mysterium", --name
		"the_mysterium", --slug
		{extra = {x_mult = 3}}, --config
		{x = 6, y = 4}, --spritePos
		jokers_def.the_mysterium, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local the_spectrum = SMODS.Joker:new(
		"The Spectrum", --name
		"the_spectrum", --slug
		{extra = {x_mult = 2, type = 'Flush'}}, --config
		{x = 9, y = 4}, --spritePos
		jokers_def.the_spectrum, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local collatz = SMODS.Joker:new(
		"Collatz", --name
		"collatz", --slug
		{extra = {x_mult = 3, x_mult_reduction = 0.5, current_chips = 0}}, --config
		{x = 1, y = 5}, --spritePos
		jokers_def.collatz, --loc_txt
		2, --rarity
		9, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local triangle_joker = SMODS.Joker:new(
		"Triangle Joker", --name
		"triangle_joker", --slug
		{extra = {mult_add = 2, mult_total = 3}}, --config
		{x = 9, y = 11}, --spritePos
		jokers_def.triangle_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local croupier = SMODS.Joker:new(
		"Croupier", --name
		"croupier", --slug
		{}, --config
		{x = 6, y = 11}, --spritePos
		jokers_def.croupier, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local chameleon_joker = SMODS.Joker:new(
		"Chameleon Joker", --name
		"chameleon_joker", --slug
		{copied_joker = nil}, --config
		{x = 1, y = 7}, --spritePos
		jokers_def.chameleon_joker, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local taliaferro = SMODS.Joker:new(
		"Taliaferro", --name
		"taliaferro", --slug
		{extra = {chips = 80, odds = 4}}, --config
		{x = 7, y = 6}, --spritePos
		jokers_def.taliaferro, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local royal_gala = SMODS.Joker:new(
		"Royal Gala", --name
		"royal_gala", --slug
		{extra = {chips = 300, odds = 1000}}, --config
		{x = 5,y = 11}, --spritePos
		jokers_def.royal_gala, --loc_txt
		1, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local sedimentation = SMODS.Joker:new(
		"Sedimentation", --name
		"sedimentation", --slug
		{extra = {mult_per_card = 2}}, --config
		{x = 5, y = 13}, --spritePos
		jokers_def.sedimentation, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local ban_list = SMODS.Joker:new(
		"Blacklist", --name
		"ban_list", --slug
		{extra = {dollars = 2, banlist_poker_hand_1 = 'High Card', banlist_poker_hand_2 = 'Pair'}}, --config
		{x = 4, y = 11}, --spritePos
		jokers_def.ban_list, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local virus = SMODS.Joker:new(
		"Virus", --name
		"virus", --slug
		{extra = {duped_cards = 2, joker_triggered = false}}, --config
		{x = 5, y = 10}, --spritePos
		jokers_def.virus, --loc_txt
		3, --rarity
		10, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local inverse_midas = SMODS.Joker:new(
		"Beyond The Mask", --name
		"inverse_midas", --slug
		{extra = {dollars = 1, dollars_add = 1}}, --config
		{x = 0, y = 13}, --spritePos
		jokers_def.inverse_midas, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local fuel_tank = SMODS.Joker:new(
		"Afterburner", --name
		"fuel_tank", --slug
		{extra = {money = 8, money_loss = 2}}, --config
		{x = 8, y = 12}, --spritePos
		jokers_def.fuel_tank, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local mint_condition = SMODS.Joker:new(
		"Mint Condition", --name
		"mint_condition", --slug
		{extra = {Xmult = 1.5}}, --config
		{x = 6, y = 14}, --spritePos
		jokers_def.mint_condition, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local frowny_face = SMODS.Joker:new(
		"Frowny Face", --name
		"frowny_face", --slug
		{extra = {mult = 4}}, --config
		{x = 6, y = 15}, --spritePos
		jokers_def.frowny_face, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local scared_face = SMODS.Joker:new(
		"Scared Face", --name
		"scared_face", --slug
		{extra = {chips = 30}}, --config
		{x = 2, y = 3}, --spritePos
		jokers_def.scared_face, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local mystery_soda = SMODS.Joker:new(
		"Mystery Soda", --name
		"mystery_soda", --slug
		{}, --config
		{x = 8, y = 14}, --spritePos
		jokers_def.mystery_soda, --loc_txt
		2, --rarity
		4, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local dawn = SMODS.Joker:new(
		"Dawn", --name
		"dawn", --slug
		{extra = 1}, --config
		{x = 4, y = 7}, --spritePos
		jokers_def.dawn, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local slot_machine = SMODS.Joker:new(
		"Slot Machine", --name
		"slot_machine", --slug
		{extra = 1}, --config
		{x = 0, y = 12}, --spritePos
		jokers_def.slot_machine, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local roscharch_test = SMODS.Joker:new(
		"Roscharch Test", --name
		"roscharch_test", --slug
		{extra = {chips = 25, mult = 5}}, --config
		{x = 8, y = 15}, --spritePos
		jokers_def.roscharch_test, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local woo_all_1s = SMODS.Joker:new(
		"Woo! All 1s", --name
		"woo_all_1s", --slug
		{}, --config
		{x = 5, y = 6}, --spritePos
		jokers_def.woo_all_1s, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local crime_scene = SMODS.Joker:new(
		"Crime Scene", --name
		"crime_scene", --slug
		{}, --config
		{x = 6, y = 5}, --spritePos
		jokers_def.crime_scene, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local occultist = SMODS.Joker:new(
		"Occultist", --name
		"occultist", --slug
		{}, --config
		{x = 8, y = 10}, --spritePos
		jokers_def.occultist, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local shrine = SMODS.Joker:new(
		"Shrine", --name
		"shrine", --slug
		{extra = {xmult = 1, xmult_add = 0.25}}, --config
		{x = 9, y = 10}, --spritePos
		jokers_def.shrine, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local evil_eye = SMODS.Joker:new(
		"Evil Eye", --name
		"evil_eye", --slug
		{extra = {money = 2, spectral_sold = 0, spectral_type_sold = {}}}, --config
		{x = 8, y = 7}, --spritePos
		jokers_def.evil_eye, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local fine_wine = SMODS.Joker:new(
		"Fine Wine", --name
		"fine_wine", --slug
		{extra = {discards = 2, odds = 5}}, --config
		{x = 4, y = 13}, --spritePos
		jokers_def.fine_wine, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local monochrome = SMODS.Joker:new(
		"Monochrome", --name
		"monochrome", --slug
		{extra = {suit = 'Spades'}}, --config
		{x = 4, y = 6}, --spritePos
		jokers_def.monochrome, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local proletaire = SMODS.Joker:new(
		"Prolétaire", --name
		"proletaire", --slug
		{extra = {boss_blind_applied = nil}}, --config
		{x = 4, y = 5}, --spritePos
		jokers_def.proletaire, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local art_gallery = SMODS.Joker:new(
		"Art Gallery", --name
		"art_gallery", --slug
		{extra = {chips_add = 20}}, --config
		{x = 3,y = 3}, --spritePos
		jokers_def.art_gallery, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local instant_gratification = SMODS.Joker:new(
		"Instant Gratification", --name
		"instant_gratification", --slug
		{extra = 1}, --config
		{x = 4,y = 3}, --spritePos
		jokers_def.instant_gratification, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local coupon = SMODS.Joker:new(
		"Coupon", --name
		"coupon", --slug
		{extra = {minus_chips = 20, money_off = 20, already_triggered = false}}, --config
		{x = 3,y = 13}, --spritePos
		jokers_def.coupon, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local graffiti = SMODS.Joker:new(
		"Graffiti", --name
		"graffiti", --slug
		{extra = {mult_add = 8}}, --config
		{x = 1,y = 2}, --spritePos
		jokers_def.graffiti, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)
	local mathmagician = SMODS.Joker:new( 
		"Mathmagician", --name
		"mathmagician", --slug
		{}, --config
		{x = 1,y = 11}, --spritePos
		jokers_def.mathmagician, --loc_txt
		1, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		"Ortalab_Jokers", --atlas
		nil --soul_pos
	)

	--Deck config
	--SMODS.Deck:new(name, slug, config, pos, loc_txt)
	local CyanDeck = SMODS.Deck:new("Cyan Deck", "Ortalab_Cyan", {hands = 2, discards = -1}, {x = 0, y = 5}, OrtalabDecks_def.Cyan)
    local OrangeDeck = SMODS.Deck:new("Orange Deck", "Ortalab_Orange", {hands = -1, discards = 2}, {x = 1, y = 5}, OrtalabDecks_def.Orange)
    local SketchedDeck = SMODS.Deck:new("Sketched Deck", "Ortalab_Sketched", {hand_size = -1, joker_slot = 1}, {x = 0, y = 6}, OrtalabDecks_def.Sketched)

	--Voucher config
	--SMODS.Voucher:new(name, slug, config, pos, loc_txt, cost, unlocked, discovered, available, requires, atlas)
	--[[local shady_trading = SMODS.Voucher:new(
		"Shady Trading", --name
		"shady_trading", --slug
		{}, --config
		{x = 4, y = 2}, --spritePos
		voucher_def.shady_trading, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		true, --available
		{}, --requires
		"Ortalab_Vouchers" --atlas
	)
	local illegal_imports = SMODS.Voucher:new(
		"Illegal Imports", --name
		"illegal_imports", --slug
		{}, --config
		{x = 4, y = 3}, --spritePos
		voucher_def.illegal_imports, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		false, --available
		{'v_shady_trading'}, --requires
		"Ortalab_Vouchers" --atlas
	)
	local window_shopping = SMODS.Voucher:new(
		"Window Shopping", --name
		"window_shopping", --slug
		{free_rerolls = 1}, --config
		{x = 0, y = 2}, --spritePos
		voucher_def.window_shopping, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		true, --available
		{}, --requires
		"Ortalab_Vouchers" --atlas
	)
	local infinite_scroll = SMODS.Voucher:new(
		"Infinite Scroll", --name
		"infinite_scroll", --slug
		{free_rerolls = 2}, --config
		{x = 0, y = 3}, --spritePos
		voucher_def.infinite_scroll, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		false, --available
		{'v_window_shopping'}, --requires
		"Ortalab_Vouchers" --atlas
	)]]

	--Joker Register/Atlas
	SMODS.Sprite:new("Ortalab_Jokers", SMODS.findModByID("OrtalabDEMO").path, "Ortalab_Jokers.png", 71, 95, "asset_atli"):register()
	jester:register()
	generous_joker:register()
	chastful_joker:register()
	patient_joker:register()
	abstemious_joker:register()
	popcorn_bag:register()
	G.localization.misc.dictionary.k_explode = "Exploded!" --Used for Popcorn Bag
	collatz:register()
	the_solo:register()
	the_mysterium:register()
	the_spectrum:register()
	triangle_joker:register()
	croupier:register()
	chameleon_joker:register()
	G.localization.misc.dictionary.k_na = "N/A"
	taliaferro:register()
	royal_gala:register()
	sedimentation:register()
	ban_list:register()
	virus:register()
	G.localization.misc.dictionary.k_infect = "Infected!" --Used for Virus
	G.localization.misc.dictionary.k_destroy = "Destoyed!" --Used for Virus
	inverse_midas:register()
	fuel_tank:register()
	G.localization.misc.dictionary.k_leak = "Leaked!" --Used for Fuel Tank
	G.localization.misc.dictionary.k_empty = "Empty!" --Used for Fuel Tank
	mint_condition:register()
	frowny_face:register()
	scared_face:register()
	mystery_soda:register()
	dawn:register()
	slot_machine:register()
	roscharch_test:register()
	woo_all_1s:register()
	crime_scene:register()
	occultist:register()
	shrine:register()
	evil_eye:register()
	fine_wine:register()
	monochrome:register()
	proletaire:register()
	art_gallery:register()
	instant_gratification:register()
	coupon:register()
	graffiti:register()
	mathmagician:register()

	--Deck register
	CyanDeck:register()
	OrangeDeck:register()
    SketchedDeck:register()

	--Voucher register
	--[[SMODS.Sprite:new("Ortalab_Vouchers", SMODS.findModByID("OrtalabDEMO").path, "Ortalab_Vouchers.png", 71, 95, "asset_atli"):register()
	shady_trading:register()
	illegal_imports:register()
	window_shopping:register()
	infinite_scroll:register()]]

	init_localization()

	--Joker calculate logic
	SMODS.Jokers.j_jester.calculate = function(self, context) --Jester Logic
		if SMODS.end_calculate_context(context) then
			return {
				message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
				chip_mod = self.ability.extra.chips, 
				colour = G.C.CHIPS
			}
		end
	end
	SMODS.Jokers.j_popcorn_bag.calculate = function(self, context) --Popcorn Bag Logic
		if not context.blueprint then
			if context.end_of_round and not context.individual and not context.repetition then
				if self.ability.extra.a_mult + self.ability.extra.a_mult_add > 20 then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('tarot1')
							self.T.r = -0.2
							self:juice_up(0.3, 0.4)
							self.states.drag.is = true
							self.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
								func = function()
										G.jokers:remove_card(self)
										self:remove()
										self = nil
									return true; end}))
							return true
						end
					})) 
					return {
						message = localize('k_explode'),
						colour = G.C.RED
					}
				else
					self.ability.extra.a_mult = self.ability.extra.a_mult + self.ability.extra.a_mult_add
					return {
						card = self,
						message = localize{type='variable',key='a_mult',vars={self.ability.extra.a_mult_add}}
					}
				end
			end
		end
		if SMODS.end_calculate_context(context) then
			if self.ability.extra.a_mult > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={self.ability.extra.a_mult}},
					mult_mod = self.ability.extra.a_mult
				}
			end
		end
	end
	SMODS.Jokers.j_the_solo.calculate = function(self, context) --The Solo Logic
		if SMODS.end_calculate_context(context) then
			if context.scoring_name == 'High Card' then
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
					Xmult_mod = self.ability.extra.x_mult
				}
			end
		end
	end
	SMODS.Jokers.j_the_mysterium.calculate = function(self, context) --The Mysterium Logic
		if SMODS.end_calculate_context(context) then
			if (context.scoring_name == 'Flush Five' or 
			context.scoring_name == 'Flush House' or 
			context.scoring_name == 'Five of a Kind') then
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
					Xmult_mod = self.ability.extra.x_mult
				}
			end
		end
	end
	SMODS.Jokers.j_the_spectrum.calculate = function(self, context) --The Spectrum Logic
		if SMODS.end_calculate_context(context) then
			if (context.scoring_name ~= 'Flush Five' or 
			context.scoring_name ~= 'Flush House' or 
			context.scoring_name ~= 'Straight Flush' or 
			context.scoring_name ~= 'Flush') then
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
					Xmult_mod = self.ability.extra.x_mult
				}
			end
		end
	end
	SMODS.Jokers.j_collatz.calculate = function(self, context) --Collatz Logic
		if SMODS.end_calculate_context(context) then
			if self.ability.extra.current_chips % 2 == 0 then
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult_reduction}},
					Xmult_mod = self.ability.extra.x_mult_reduction
				}
			else
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
					Xmult_mod = self.ability.extra.x_mult
				}
			end
		end
	end
	SMODS.Jokers.j_triangle_joker.calculate = function(self, context) --Triangle Joker Logic
		if context.cardarea == G.jokers and context.before and #context.full_hand == 3 and not context.blueprint then
			self.ability.extra.mult_total = self.ability.extra.mult_total + self.ability.extra.mult_add
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = self
			}
		end
		if SMODS.end_calculate_context(context) then
			return {
				message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult_total}},
				mult_mod = self.ability.extra.mult_total
			}
		end
	end
	SMODS.Jokers.j_chameleon_joker.calculate = function(self, context) --Chameleon Joker Logic
		local chosen_joker = self.ability.copied_joker
		if chosen_joker ~= nil then
			local other_joker = chosen_joker
			if other_joker and other_joker ~= self then
				context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
				context.blueprint_card = context.blueprint_card or self
				if context.blueprint > #G.jokers.cards + 1 then return end
				local other_joker_ret = other_joker:calculate_joker(context)
				if other_joker_ret then 
					other_joker_ret.card = context.blueprint_card or self
					other_joker_ret.colour = G.C.RED
					return other_joker_ret
				end
			end
		end
		if context.setting_blind and not context.getting_sliced then
			local jokers = {}
			for i=1, #G.jokers.cards do 
				if G.jokers.cards[i] ~= self and G.jokers.cards[i].config.center.blueprint_compat == true then
					jokers[#jokers+1] = G.jokers.cards[i]
				end
			end
			if #jokers > 0 then
				local chosen_joker = jokers[math.random(1, #jokers)]
				self.ability.copied_joker = chosen_joker
			else
				self.ability.copied_joker = nil
			end	
		end
	end
	SMODS.Jokers.j_taliaferro.calculate = function(self, context) --Taliaferro Logic NOTE: MUST ADD POOL FLAGS
		if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
			if math.random(G.GAME.probabilities.normal,self.ability.extra.odds) == G.GAME.probabilities.normal then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						self.T.r = -0.2
						self:juice_up(0.3, 0.4)
						self.states.drag.is = true
						self.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
									G.jokers:remove_card(self)
									self:remove()
									self = nil
								return true; end})) 
						return true
					end
				}))
				G.GAME.pool_flags.taliaferro_extinct = true
				return {
					message = localize('k_extinct_ex')
				}
			else
				return {
					message = localize('k_safe_ex')
				}
			end
		end
		if SMODS.end_calculate_context(context) then
			return {
				message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
				chip_mod = self.ability.extra.chips, 
				colour = G.C.CHIPS
			}
		end
	end
	SMODS.Jokers.j_royal_gala.calculate = function(self, context) --Royal Gala Logic
		if self.ability.name == 'Royal Gala' then
			if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
				if math.random(G.GAME.probabilities.normal,self.ability.extra.odds) == G.GAME.probabilities.normal then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('tarot1')
							self.T.r = -0.2
							self:juice_up(0.3, 0.4)
							self.states.drag.is = true
							self.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
								func = function()
										G.jokers:remove_card(self)
										self:remove()
										self = nil
									return true; end})) 
							return true
						end
					}))
					--NOTE: MUST ADD POOL FLAGS FOR TALIAFERRO
					return {
						message = localize('k_extinct_ex')
					}
				else
					return {
						message = localize('k_safe_ex')
					}
				end
			end
			if SMODS.end_calculate_context(context) then
				return {
					message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
					chip_mod = self.ability.extra.chips, 
					colour = G.C.CHIPS
				}
			end
		end
	end
	SMODS.Jokers.j_sedimentation.calculate = function(self, context) --Sedimentation Logic
		if SMODS.end_calculate_context(context) then
			if (#G.playing_cards - G.GAME.starting_deck_size) > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult_per_card*(#G.playing_cards - G.GAME.starting_deck_size)}},
					mult_mod = self.ability.extra.mult_per_card*(#G.playing_cards - G.GAME.starting_deck_size), 
					colour = G.C.MULT
				}
			end
		end
	end
	SMODS.Jokers.j_ban_list.calculate = function(self, context) --Blacklist Logic
		if not context.other_joker and not context.repetition and not context.individual and not context.end_of_round and not context.discard and not context.pre_discard then
			if context.cardarea == G.jokers and context.before then
				if context.scoring_name ~= self.ability.extra.banlist_poker_hand_1 and context.scoring_name ~= self.ability.extra.banlist_poker_hand_2 then
					G.E_MANAGER:add_event(Event({
						func = function()
							local _poker_hands = {}
							for k, v in pairs(G.GAME.hands) do
								if v.visible and k ~= self.ability.extra.banlist_poker_hand_1 and k ~= self.ability.extra.banlist_poker_hand_2 then _poker_hands[#_poker_hands+1] = k end
							end
							self.ability.extra.banlist_poker_hand_1 = _poker_hands[math.random(1,#_poker_hands)]
							_poker_hands[self.ability.extra.banlist_poker_hand_1] = nil
							self.ability.extra.banlist_poker_hand_2 = _poker_hands[math.random(1,#_poker_hands)]
							return true
						end
					}))
					ease_dollars(self.ability.extra.dollars)
					G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra.dollars
					G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
					return {
						message = localize('$')..self.ability.extra.dollars,
						dollars = self.ability.extra.dollars,
						colour = G.C.MONEY
					}
				end
			end
		end
	end
	SMODS.Jokers.j_virus.calculate = function(self, context) --Virus Logic
		if context.first_hand_drawn and not context.blueprint then
			local eval = function() return G.GAME.current_round.hands_played == 0 end
			juice_card_until(card, eval, true)
		end
		if not context.other_joker and not context.repetition and not context.individual and not context.end_of_round and not context.discard and not context.pre_discard then
			if context.cardarea == G.jokers then
				if context.before and G.GAME.current_round.hands_played == 0 then
					if #context.full_hand == 1 then
						local card_to_dupe = context.full_hand[1]
						local hand = {}
						for i=1, #G.hand.cards do
							if not (G.hand.cards[i]:get_id() == card_to_dupe  and G.hand.cards[i].ability.name == card_to_dupe.ability.name and G.hand.cards[i].edition == card_to_dupe.edition) then hand[i] = G.hand.cards[i] end
						end
						self.ability.extra.joker_triggered = true
						for i=1, self.ability.extra.duped_cards do
							local infected_card = hand[math.random(1,#hand)]
							while infected_card == card_to_dupe do
								infected_card = hand[math.random(1,#hand)]
							end
							G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
								copy_card(card_to_dupe, infected_card)
								return true end }))
						end
						return {
							message = localize('k_infect'),
							colour = G.C.CHIPS,
							delay = 1, 
							card = self
						}
					end
				elseif context.after and not context.blueprint and context.full_hand[1] ~= nil and card.ability.extra.joker_triggered == true then
					self.ability.extra.joker_triggered = false
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.2,
						func = function()
							local card_to_delete = context.full_hand[1]
							if card_to_delete.ability.name == 'Glass Card' then 
								card_to_delete:shatter()
							else
								card_to_delete:start_dissolve()
							end
							return true 
					end }))
				end
			end
		end
	end
	SMODS.Jokers.j_inverse_midas.calculate = function(self, context) --Beyond The Mask Logic
		if context.discard and not context.blueprint and not context.other_card.debuff and
		context.other_card.ability.name == 'Gold Card' then
			self.ability.extra.dollars = self.ability.extra.dollars + self.ability.extra.dollars_add
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MONEY,
				delay = 0.45, 
				remove = true,
				card = self
			}
		end
	end
	SMODS.Jokers.j_patient_joker.calculate = function(self, context) --Patient Joker Logic
		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
			return {
				chips = self.ability.extra.chips,
				card = self
			}
		end
	end
	SMODS.Jokers.j_chastful_joker.calculate = function(self, context) --Chastful Joker Logic
		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
			return {
				chips = self.ability.extra.chips,
				card = self
			}
		end
	end
	SMODS.Jokers.j_abstemious_joker.calculate = function(self, context) --Abstemonius Joker Logic
		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
			return {
				chips = self.ability.extra.chips,
				card = self
			}
		end
	end
	SMODS.Jokers.j_generous_joker.calculate = function(self, context) --Generous Joker Logic
		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
			return {
				chips = self.ability.extra.chips,
				card = self
			}
		end
	end
	SMODS.Jokers.j_fuel_tank.calculate = function(self, context) --Fuel Tank Logic
		if not context.blueprint then
			if context.end_of_round and not context.individual and not context.repetition then
				if G.GAME.blind.boss then
					if self.ability.extra.money - self.ability.extra.money_loss <= 0 then
						G.E_MANAGER:add_event(Event({
							func = function()
								play_sound('tarot1')
								self.T.r = -0.2
								self:juice_up(0.3, 0.4)
								self.states.drag.is = true
								self.children.center.pinch.x = true
								G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
									func = function()
											G.jokers:remove_card(self)
											self:remove()
											self = nil
										return true; end})) 
								return true
							end
						})) 
						return {
							message = localize('k_empty'),
							colour = G.C.RED
						}
					else
						self.ability.extra.money = self.ability.extra.money - self.ability.extra.money_loss
						return {
							message = localize('k_leak'),
							colour = G.C.MONEY
						}
					end
				end
			end
		end
	end
	SMODS.Jokers.j_mint_condition.calculate = function(self, context) --Mint Condition Logic
		if context.other_joker and not context.repetition and not context.indiviual then
			local money_bonus_check = context.other_joker:calculate_dollar_bonus()
			if (money_bonus_check or context.other_joker.ability.name == 'To the Moon') and context.other_joker ~= self then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end
				})) 
				return {
					message = localize{type='variable',key='a_xmult',vars={self.ability.extra.Xmult}},
					Xmult_mod = self.ability.extra.Xmult
				}
			end
		end
	end
	SMODS.Jokers.j_frowny_face.calculate = function(self, context) --Frowny Face Logic
		if context.individual and context.cardarea == G.play and not (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
			return {
				mult = self.ability.extra.mult,
				card = self
			}
		end
	end
	SMODS.Jokers.j_scared_face.calculate = function(self, context) --Scared Face Logic
		if context.individual and context.cardarea == G.play and not (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
			return {
				chips = self.ability.extra.chips,
				card = self
			}
		end
	end
	SMODS.Jokers.j_mystery_soda.calculate = function(self, context) --Mystery Soda Logic
		if context.selling_self then
			local available_tags = {}
			for k, v in pairs(G.P_TAGS) do
				if k ~= 'tag_orbital' or k ~= 'tag_standard' then table.insert(available_tags,k) end
			end
			local tag_1 = available_tags[math.random(1,#available_tags)]
			local tag_2 = available_tags[math.random(1,#available_tags)]
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag(tag_1))
					add_tag(Tag(tag_2))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
					return true
				end)
			}))
		end
	end
	SMODS.Jokers.j_dawn.calculate = function(self, context) --Dawn Logic
		if context.first_hand_drawn then
			if not context.blueprint then
				local eval = function() return G.GAME.current_round.hands_played == 0 end
				juice_card_until(self, eval, true)
			end
		end
		if context.repetition and context.cardarea == G.play then
			if G.GAME.current_round.hands_played == 0 then
				return {
					message = localize('k_again_ex'),
					repetitions = self.ability.extra,
					card = self
				}
			end
		end
	end
	SMODS.Jokers.j_slot_machine.calculate = function(self, context) --Slot Machine Logic
		if SMODS.end_calculate_context(context) then
			local total_lucky_7s = 0
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i].ability.name == "Lucky Card" and context.scoring_hand[i]:get_id() == 7 then
					total_lucky_7s = total_lucky_7s + 1
				end
			end
			if total_lucky_7s >= 3 then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
				G.E_MANAGER:add_event(Event({
					trigger = 'before',
					delay = 0.0,
					func = (function()
							local self = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
							self:add_to_deck()
							G.consumeables:emplace(self)
							G.GAME.consumeable_buffer = 0
						return true
					end)}))
				return {
					message = localize('k_plus_spectral'),
					colour = G.C.SECONDARY_SET.Spectral,
					card = self
				}
			end
		end
	end
	SMODS.Jokers.j_roscharch_test.calculate = function(self, context) --Roscharch Logic
		if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 5 or context.other_card:get_id() == 2) then
			if math.random(1,2) == 1 then
				return {
					mult = self.ability.extra.mult,
					card = self
				}
			else
				return {
					chips = self.ability.extra.chips,
					card = self
				}
			end
		end
	end
	SMODS.Jokers.j_shrine.calculate = function(self, context) --Shrine Logic
		if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
			self.ability.extra.xmult = self.ability.extra.xmult + self.ability.extra.xmult_add
				G.E_MANAGER:add_event(Event({
					func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={self.ability.extra.xmult}}}); return true
					end}))
		end
		if SMODS.end_calculate_context(context) and self.ability.extra.xmult > 1 then
			return {
				message = localize{type='variable',key='a_xmult',vars={self.ability.extra.xmult}},
				Xmult_mod = self.ability.extra.xmult
			}
		end
	end
	SMODS.Jokers.j_fine_wine.calculate = function(self, context) --Fine Wine Logic
		if not context.blueprint then
			if context.setting_blind and not context.getting_sliced then
				self.ability.extra.discards = self.ability.extra.discards + 1
				ease_discard(self.ability.extra.discards)
				card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
			end
			if context.end_of_round and not context.individual and not context.repetition then
				if math.random(G.GAME.probabilities.normal,self.ability.extra.odds) == G.GAME.probabilities.normal then
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('tarot1')
							self.T.r = -0.2
							self:juice_up(0.3, 0.4)
							self.states.drag.is = true
							self.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
								func = function()
										G.jokers:remove_card(self)
										self:remove()
										self = nil
									return true; end})) 
							return true
						end
					}))
					return {
						message = localize('k_drank_ex')
					}
				else
					return {
						message = localize('k_safe_ex')
					}
				end
			end
		end
	end
	SMODS.Jokers.j_monochrome.calculate = function(self, context) --Monochrome Logic
		if not context.blueprint and context.setting_blind and not context.getting_sliced then
			local suits = {'Spades', 'Clubs', 'Hearts', 'Diamonds'}
			self.ability.extra.suit = suits[math.random(1,4)]
			G.GAME.current_round.monochrome.suit = self.ability.extra.suit
		end
	end
	SMODS.Jokers.j_art_gallery.calculate = function(self, context) --Jester Logic
		if SMODS.end_calculate_context(context) then
			local total_cards = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.set == 'Joker' then total_cards = total_cards + 1 end
			end
			for i = 1, #G.consumeables.cards do
				if G.consumeables.cards[i] then total_cards = total_cards + 1 end
			end
			return {
				message = localize{type='variable',key='a_chips',vars={total_cards*self.ability.extra.chips_add}},
				chip_mod = total_cards*self.ability.extra.chips_add, 
				colour = G.C.CHIPS
			}
		end
	end
	SMODS.Jokers.j_proletaire.calculate = function(self, context) --Prolétaire Logic
		if not context.blueprint then
			if context.setting_blind and not context.getting_sliced then
				local all_blind_configs = {}
				self.ability.extra.boss_blind_applied = nil
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
				local boss_blind = all_blind_configs[math.random(1,#all_blind_configs)]
				self.ability.extra.boss_blind_applied = boss_blind
				G.GAME.blind.dollars = G.GAME.blind.dollars*3

				--Setting Blind effects
				if self.ability.extra.boss_blind_applied.name == 'The Eye' then
					self.ability.extra.boss_blind_applied.hands = {
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
				if self.ability.extra.boss_blind_applied.name == 'The Mouth' then
					self.ability.extra.boss_blind_applied.only_hand = false
				end
				if self.ability.extra.boss_blind_applied.name == 'The Fish' then 
					self.ability.extra.boss_blind_applied.prepped = nil
				end
				if self.ability.extra.boss_blind_applied.name == 'The Water' then 
					self.ability.extra.boss_blind_applied.discards_sub = G.GAME.current_round.discards_left
					ease_discard(-self.ability.extra.boss_blind_applied.discards_sub)
				end
				if self.ability.extra.boss_blind_applied.name == 'The Needle' then 
					self.ability.extra.boss_blind_applied.hands_sub = G.GAME.round_resets.hands - 1
					ease_hands_played(-self.ability.extra.boss_blind_applied.hands_sub)
				end
				if self.ability.extra.boss_blind_applied.name == 'The Manacle' then
					G.hand:change_size(-1)
				end
				if self.ability.extra.boss_blind_applied.name == 'The Wall' then
					G.GAME.blind.chips = G.GAME.blind.chips*2
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				end

				--Debuff Cards
				for _, v in ipairs(G.playing_cards) do
					if self.ability.extra.boss_blind_applied.debuff.suit and v:is_suit(self.ability.extra.boss_blind_applied.debuff.suit, true) then
						v:set_debuff(true)
					elseif self.ability.extra.boss_blind_applied.debuff.is_face == 'face' and v:is_face(true) then
						v:set_debuff(true)
					elseif self.ability.extra.boss_blind_applied.name == 'The Pillar' and v.ability.played_this_ante then
						v:set_debuff(true)
					elseif self.ability.extra.boss_blind_applied.debuff.value and self.ability.extra.boss_blind_applied.debuff.value == v.base.value then
						v:set_debuff(true)
					elseif self.ability.extra.boss_blind_applied.debuff.nominal and self.ability.extra.boss_blind_applied.debuff.nominal == v.base.nominal then
						v:set_debuff(true)
					end
				end
			end
		end
		if context.end_of_round and not context.individual and not context.repetition then
			if self.ability.extra.boss_blind_applied.name == 'The Manacle' then
				G.hand:change_size(1)
			end
		end
	end
	SMODS.Jokers.j_instant_gratification.calculate = function(self, context) --Instant Gratification logic
		if context.discard and context.other_card == context.full_hand[#context.full_hand] then
			ease_dollars(self.ability.extra)
			G.E_MANAGER:add_event(Event({
				func = function()
					ease_dollars(self.ability.extra)
					card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('$')..self.ability.extra,colour = G.C.MONEY, delay = 0.45})
					return true
				end}))
			return
		end
	end
	SMODS.Jokers.j_coupon.calculate = function(self, context) --Coupon Logic
		if SMODS.end_calculate_context(context) then
			return {
				message = localize{type='variable',key='a_chips',vars={-self.ability.extra.minus_chips}},
				chip_mod = -self.ability.extra.minus_chips, 
				colour = G.C.RED
			}
		end
	end
	SMODS.Jokers.j_graffiti.calculate = function (self, context) --Graffiti logic
		if SMODS.end_calculate_context(context) then
			if self.ability.extra.mult_add*G.GAME.current_round.hands_left > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult_add*G.GAME.current_round.hands_left}},
					mult_mod = self.ability.extra.mult_add*G.GAME.current_round.hands_left
				}
			end
		end
	end
	SMODS.Jokers.j_mathmagician.calculate = function (self, context) --Graffiti logic
		if context.discard and context.other_card == context.full_hand[#context.full_hand] then
			numbered_cards = 0
			for k, v in ipairs(context.full_hand) do
				if not v:is_face() then numbered_cards = numbered_cards + 1 end
			end
			if numbered_cards >= 4 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))   
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                        return true
                    end)}))
			end
		end
	end

	local BlindModifyHand_ref = Blind.modify_hand
	function Blind.modify_hand(self, cards, poker_hands, text, mult, hand_chips) --Prolétaire Logic
		local proletaire_is_flint = false
		if next(find_joker("Prolétaire")) then
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
		if next(find_joker("Prolétaire")) then
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
		Blinddebuff_card_ref(self, card, from_blind)
		if next(find_joker("Prolétaire")) then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Prolétaire' then
					if v.debuff and not v.disabled and card.area ~= G.jokers then
						if v.debuff.suit and card:is_suit(v.debuff.suit, true) then
							card:set_debuff(true)
							return
						end
						if v.debuff.is_face =='face' and card:is_face(true) then
							card:set_debuff(true)
							return
						end
						if v.name == 'The Pillar' and card.ability.played_this_ante then
							card:set_debuff(true)
							return
						end
						if v.debuff.value and v.debuff.value == card.base.value then
							card:set_debuff(true)
							return
						end
						if v.debuff.nominal and v.debuff.nominal == card.base.nominal then
							card:set_debuff(true)
							return
						end
					end
				end
			end
		end
	end

	local BlindDebuff_Hand_ref = Blind.debuff_hand
	function Blind.debuff_hand(self, cards, hand, handname, check) --Prolétaire Logic
		BlindDebuff_Hand_ref(self, cards, hand, handname, check)
		if next(find_joker("Prolétaire")) then
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
		if next(find_joker("Prolétaire")) then
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
		BlindStay_Flipped_ref(self, area, card)
	end

	local BlindPress_Play = Blind.press_play
	function Blind.press_play(self) --Prolétaire Logic
		BlindPress_Play(self)
		if next(find_joker("Prolétaire")) then
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
	end

	local CardOpen_ref = Card.open
	function Card.open(self) --Required for Croupier Logic
		if next(find_joker('Croupier')) then
			if self.ability.set == "Booster" then
				if self.ability.name:find('Arcana') then 
					self.ability.extra = self.ability.extra + 1
				elseif self.ability.name:find('Celestial') then
					self.ability.extra = self.ability.extra + 1
				elseif self.ability.name:find('Spectral') then
					self.ability.extra = self.ability.extra + 1
				elseif self.ability.name:find('Standard') then
					self.ability.extra = self.ability.extra + 1
				elseif self.ability.name:find('Buffoon') then
					self.ability.extra = self.ability.extra + 1
				end
			end
		end
		return CardOpen_ref(self)
	end

	local CardAdd_to_deck_ref = Card.add_to_deck
	function Card.add_to_deck(self, from_debuff) --Crime Scene, Woo! All 1s, and Monochrome Logic
		if self.ability.name == 'Crime Scene' then
			G.GAME.pool_flags['crime_scene_pool_disable'] = true
		end
		if self.ability.name == 'Coupon' then
			G.GAME.discount_percent = G.GAME.discount_percent + 20
			G.E_MANAGER:add_event(Event({func = function()
				for k, v in pairs(G.I.CARD) do
					if v.set_cost then v:set_cost() end
				end
				return true end }))
		end
		if self.ability.name == 'Monochrome' then
			if not G.GAME.current_round.monochrome then
				G.GAME.current_round["monochrome"] = {suit = 'Spades'}
			end
			self.ability.extra.suit = G.GAME.current_round.monochrome.suit
		end
		if not self.added_to_deck then
			if self.ability.name == 'Woo! All 1s' then
				self.added_to_deck = true
				for k, v in pairs(G.GAME.probabilities) do 
					if G.GAME.probabilities[k] == 1 and not next(find_joker('Oops! All 6s')) then
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
		end
	end
	
	local CardRemove_from_deck_ref = Card.remove_from_deck
	function Card.remove_from_deck(self, from_debuff)
		if self.added_to_deck then 
			if self.ability.name == 'Crime Scene' then
				G.GAME.pool_flags['crime_scene_pool_disable'] = nil
				for k, v in pairs(G.P_CENTERS) do
					if v.no_pool_flag and (v.no_pool_flag == 'crime_scene_pool_disable') then
						v.no_pool_flag = nil
					end
				end
			end
			if self.ability.name == 'Coupon' then
				G.GAME.discount_percent = G.GAME.discount_percent - 20
				G.E_MANAGER:add_event(Event({func = function()
					for k, v in pairs(G.I.CARD) do
						if v.set_cost then v:set_cost() end
					end
					return true end }))
			end
			if self.ability.name == 'Woo! All 1s' then
				self.added_to_deck = false
				for k, v in pairs(G.GAME.probabilities) do 
					if G.GAME.probabilities[k] == 0 then
						G.GAME.probabilities[k] = 1
						if next(find_joker('Oops! All 6s')) then
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

	local CardSet_Ability_ref = Card.set_ability 
	function Card.set_ability(self, center, initial, delay_sprites) --Blacklist Logic
		CardSet_Ability_ref(self, center, initial, delay_sprites)
		if self.ability.name == 'Blacklist' then
			local _poker_hands = {}
			for k, v in pairs(G.GAME.hands) do
				if v.visible then _poker_hands[#_poker_hands+1] = k end
			end
			local old_hand_1 = self.ability.extra.banlist_poker_hand_1
			local old_hand_2 = self.ability.extra.banlist_poker_hand_2
			self.ability.extra.banlist_poker_hand_1 = nil
			self.ability.extra.banlist_poker_hand_2 = nil

			while not self.ability.extra.banlist_poker_hand_1 do
				self.ability.extra.banlist_poker_hand_1 = _poker_hands[math.random(1,#_poker_hands)]
				if self.ability.extra.banlist_poker_hand_1 == old_hand_1 then self.ability.extra.banlist_poker_hand_1 = nil end
			end
			_poker_hands[self.ability.extra.banlist_poker_hand_1] = nil
			while not self.ability.extra.banlist_poker_hand_2 do
				self.ability.extra.banlist_poker_hand_2 = _poker_hands[math.random(1,#_poker_hands)]
				if self.ability.extra.banlist_poker_hand_2 == old_hand_2 then self.ability.extra.banlist_poker_hand_2 = nil end
			end
		end
	end

	local CardCalc_Dollar_Bonus = Card.calculate_dollar_bonus --Money Joker Logic
	function Card.calculate_dollar_bonus(self) --Money Jokers
		if self.debuff then return end
		if self.ability.set == "Joker" then
			if self.ability.name == "Beyond The Mask" then
				return self.ability.extra.dollars
			end
			if self.ability.name == "Afterburner" then
				return self.ability.extra.money
			end
			if self.ability.name == "Evil Eye" then
				return self.ability.extra.money*self.ability.extra.spectral_sold
			end
			if self.ability.name == 'Golden Joker' then
				return self.ability.extra
			end
			if self.ability.name == 'Cloud 9' and self.ability.nine_tally and self.ability.nine_tally > 0 then
				return self.ability.extra*(self.ability.nine_tally)
			end
			if self.ability.name == 'Rocket' then
				return self.ability.extra.dollars
			end
			if self.ability.name == 'Satellite' then 
				local planets_used = 0
				for k, v in pairs(G.GAME.consumeable_usage) do
					if v.set == 'Planet' then planets_used = planets_used + 1 end
				end
				if planets_used == 0 then return end
				return self.ability.extra*planets_used
			end
			if self.ability.name == 'Delayed Gratification' and G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 then
				return G.GAME.current_round.discards_left*self.ability.extra
			end
		end
		CardCalc_Dollar_Bonus(self)
	end
	
	local mod_chips_ref = mod_chips
	function mod_chips(_chips) --Required for Collatz
		if next(find_joker("Collatz")) then
			local curr_chips = _chips
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Collatz' then
					if G.GAME.modifiers.chips_dollar_cap then
						curr_chips = math.min(_chips, math.max(G.GAME.dollars, 0))
					end
					v.ability.extra.current_chips = curr_chips
				end
			end
		end
		if _chips < 0 then
			_chips = 0
		end
		return mod_chips_ref(_chips)
	end

	local CardSell_Card = Card.sell_card --Crime Scene and Evil Eye Logic
	function Card.sell_card(self)
		if next(find_joker('Crime Scene')) and self.ability.set == 'Joker' then
			self.config.center.no_pool_flag = 'crime_scene_pool_disable'
		end
		if next(find_joker('Evil Eye')) and self.ability.set == 'Spectral' then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Evil Eye' then
					if v.ability.extra.spectral_type_sold[self.config.center.key] ~= true then
						v.ability.extra.spectral_sold = v.ability.extra.spectral_sold + 1
						v.ability.extra.spectral_type_sold[self.config.center.key] = true
					end
				end
			end
		end

		return CardSell_Card(self)
	end

	local CardDissolve = Card.start_dissolve --Crime Scene Logic
	function Card.start_dissolve(self)
		if next(find_joker('Crime Scene')) and self.ability.set == 'Joker' then
			self.config.center.no_pool_flag = 'crime_scene_pool_disable'
		end
		return CardDissolve(self)
	end

	local CardSet_cost = Card.set_cost --Oculstist Logic
	function Card.set_cost(self)
		CardSet_cost(self)
		if (self.ability.set == 'Spectral' or (self.ability.set == 'Booster' and self.ability.name:find('Spectral'))) and #find_joker('Occultist') > 0 then 
			self.cost = 0 
		end
	end

	local CardIs_Suit_ref = Card.is_suit
	function Card.is_suit(self, suit, bypass_debuff, flush_calc) --Monochrome Logic
		if flush_calc then
			if self.ability.effect == 'Stone Card' then
				return false
			end
			if self.ability.name == "Wild Card" and not self.debuff then
				return true
			end
			if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
				return true
			end
			return self.base.suit == suit
		else
			if self.debuff and not bypass_debuff then return end
			if next(find_joker('Monochrome')) and suit == G.GAME.current_round.monochrome.suit then
				return true
			end
			if self.ability.effect == 'Stone Card' then
				return false
			end
			if self.ability.name == "Wild Card" then
				return true
			end
			if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
				return true
			end
			return self.base.suit == suit
		end
		CardIs_Suit_ref(self, suit, bypass_debuff, flush_calc)
	end

	local NewRound_ref = new_round
	function new_round() --Window Shopping & Infinite Scroll logic
		NewRound_ref()
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
		local window_shopping = 0
		local inf_scroll = 0
		for k, v in pairs(G.GAME.used_vouchers) do
			if k == 'v_window_shopping' then window_shopping = 1 end
			if k == 'v_infinite_scroll' then inf_scroll = 2 end
		end
		G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + window_shopping + inf_scroll
		calculate_reroll_cost(true)
		return true end}))
	end

	local CardApply_to_run_ref = Card.apply_to_run
	function Card.apply_to_run(self, center)
		CardApply_to_run_ref(self, center)
		center_table = {
			name = center and center.name or self and self.ability.name,
			extra = center and center.config.extra or self and self.ability.extra
		}
		if (center_table.name == 'Clearance Sale' or center_table.name == 'Liquidation') and nex(find_joker('Coupon')) then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Coupon' then
					G.GAME.discount_percent = G.GAME.discount_percent + 20
				end
			end
		end
	end

	local BackApply_to_run_ref = Back.apply_to_run
	function Back.apply_to_run(arg_56_0)
		BackApply_to_run_ref(arg_56_0)

		-- Adds Pool Flags
		G.P_CENTERS['j_taliaferro']['no_pool_flag'] = 'taliaferro_extinct'
		G.P_CENTERS['j_royal_gala']['yes_pool_flag'] = 'taliaferro_extinct'
		--[[G.P_CENTERS['j_occultist']['yes_pool_flag'] = 'shady_trading_redeemed'
		G.P_CENTERS['j_shrine']['yes_pool_flag'] = 'shady_trading_redeemed'
		G.P_CENTERS['j_evil_eye']['yes_pool_flag'] = 'shady_trading_redeemed']]

		-- Redeems 'Shady Trading' Voucher when playing Ghost Deck
		if arg_56_0.effect.config.spectral_rate then
			G.E_MANAGER:add_event(Event({
				func = function() 
					G.GAME.used_vouchers['v_shady_trading'] = true
					G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
					G.GAME.pool_flags.shady_trading_redeemed = true
					return true 
				end 
			}))
		end
	end

	--Voucher redeem logic
	--[[function SMODS.Vouchers.v_shady_trading.redeem(center)
		if center.name == 'Shady Trading' then
			if G.GAME.spectral_rate < 2 then
				G.GAME.spectral_rate = 2
			end
			G.GAME.pool_flags.shady_trading_redeemed = true
		end
	end
	function SMODS.Vouchers.v_illegal_imports.redeem(center)
		if center.name == 'Illegal Imports' then
			G.GAME.spectral_rate = 4
		end
	end
	function SMODS.Vouchers.v_window_shopping.redeem(center)
		if center.name == 'Window Shopping' then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 1)
				calculate_reroll_cost(true)
				return true 
			end }))
		end
	end
	function SMODS.Vouchers.v_infinite_scroll.redeem(center)
		if center.name == 'Infinite Scroll' then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 2
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 2
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 2)
				calculate_reroll_cost(true)
				return true 
			end }))
		end
	end]]

	--Joker loc_def and Joker tooltips
	function SMODS.Jokers.j_jester.loc_def(center)
		if center.ability.name == 'Jester' then
			return {center.ability.extra.chips}
		end
	end
	function SMODS.Jokers.j_popcorn_bag.loc_def(center)
		if center.ability.name == 'Popcorn Bag' then
			return {center.ability.extra.a_mult, center.ability.extra.a_mult_add}
		end
	end
	function SMODS.Jokers.j_collatz.loc_def(center)
		if center.ability.name == 'Collatz' then
			return {center.ability.extra.x_mult, center.ability.extra.x_mult_reduction}
		end
	end
	function SMODS.Jokers.j_the_mysterium.loc_def(center)
		if center.ability.name == 'The Mysterium' then
			return {center.ability.extra.x_mult}
		end
	end
	function SMODS.Jokers.j_the_spectrum.loc_def(center)
		if center.ability.name == 'The Spectrum' then
			return {center.ability.extra.x_mult, localize(center.ability.extra.type, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_triangle_joker.loc_def(center)
		if center.ability.name == 'Triangle Joker' then
			return {center.ability.extra.mult_add, center.ability.extra.mult_total}
		end
	end
	function SMODS.Jokers.j_the_solo.loc_def(center)
		if center.ability.name == 'The Solo' then
			return {center.ability.extra.x_mult, localize(center.ability.extra.type, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_chameleon_joker.loc_def(center)
		if center.ability.name == 'Chameleon Joker' then
			if center.ability.copied_joker ~= nil then
				return {localize{type = 'name_text', set = center.ability.copied_joker.config.center.set, key = center.ability.copied_joker.config.center.key, nodes = {}}}
			else
				return {localize('k_na')}
			end
		end
	end
	function SMODS.Jokers.j_taliaferro.loc_def(center)
		if center.ability.name == 'Taliaferro' then
			return {center.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_royal_gala.loc_def(center)
		if center.ability.name == 'Royal Gala' then
			return {center.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_sedimentation.loc_def(center)
		if center.ability.name == 'Sedimentation' then
			return {center.ability.extra.mult_per_card, math.max(0,center.ability.extra.mult_per_card*(G.playing_cards and (#G.playing_cards - G.GAME.starting_deck_size) or 0)), G.GAME.starting_deck_size}
		end
	end
	function SMODS.Jokers.j_ban_list.loc_def(center)
		if center.ability.name == 'Blacklist' then
			return {center.ability.extra.dollars, localize(center.ability.extra.banlist_poker_hand_1, 'poker_hands'), localize(center.ability.extra.banlist_poker_hand_2, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_virus.loc_def(center)
		if center.ability.name == 'Virus' then
			return {center.ability.extra.duped_cards}
		end
	end
	function SMODS.Jokers.j_inverse_midas.loc_def(center)
		if center.ability.name == 'Beyond The Mask' then
			return {center.ability.extra.dollars, center.ability.extra.dollars_add}
		end
	end
	function SMODS.Jokers.j_inverse_midas.tooltip(card, info_queue)
		info_queue[#info_queue+1] = G.P_CENTERS.m_gold
	end
	function SMODS.Jokers.j_patient_joker.loc_def(center)
		if center.ability.name == 'Patient Joker' then
			return {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_chastful_joker.loc_def(center)
		if center.ability.name == 'Chastful Joker' then
			return {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_abstemious_joker.loc_def(center)
		if center.ability.name == 'Abstemious Joker' then
			return {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_generous_joker.loc_def(center)
		if center.ability.name == 'Generous Joker' then
			return {center.ability.extra.chips, localize(center.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_fuel_tank.loc_def(center)
		if center.ability.name == 'Afterburner' then
			return {center.ability.extra.money, center.ability.extra.money_loss}
		end
	end
	function SMODS.Jokers.j_mint_condition.loc_def(center)
		if center.ability.name == 'Mint Condition' then
			return {center.ability.extra.Xmult}
		end
	end
	function SMODS.Jokers.j_frowny_face.loc_def(center)
		if center.ability.name == 'Frowny Face' then
			return {center.ability.extra.mult}
		end
	end
	function SMODS.Jokers.j_scared_face.loc_def(center)
		if center.ability.name == 'Scared Face' then
			return {center.ability.extra.chips}
		end
	end
	function SMODS.Jokers.j_dawn.loc_def(center)
		if center.ability.name == 'Dawn' then
			return {center.ability.extra+1}
		end
	end
	function SMODS.Jokers.j_roscharch_test.loc_def(center)
		if center.ability.name == 'Roscharch Test' then
			return {center.ability.extra.chips, center.ability.extra.mult}
		end
	end
	function SMODS.Jokers.j_shrine.loc_def(center)
		if center.ability.name == 'Shrine' then
			return {center.ability.extra.xmult_add, center.ability.extra.xmult}
		end
	end
	function SMODS.Jokers.j_evil_eye.loc_def(center)
		if center.ability.name == 'Evil Eye' then
			return {center.ability.extra.money, center.ability.extra.money*center.ability.extra.spectral_sold}
		end
	end
	function SMODS.Jokers.j_fine_wine.loc_def(center)
		if center.ability.name == 'Fine Wine' then
			return {center.ability.extra.discards, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_monochrome.loc_def(center)
		if center.ability.name == 'Monochrome' then
			return {localize(center.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[center.ability.extra.suit]}}
		end
	end
	function SMODS.Jokers.j_art_gallery.loc_def(center)
		if center.ability.name == 'Art Gallery' then
			local total_cards = 0
			if G.jokers then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].ability.set == 'Joker' then total_cards = total_cards + 1 end
				end
			end
			if G.consumeables then
				for i = 1, #G.consumeables.cards do
					if G.consumeables.cards[i] then total_cards = total_cards + 1 end
				end
			end
			return {center.ability.extra.chips_add, total_cards*center.ability.extra.chips_add}
		end
	end
	function SMODS.Jokers.j_proletaire.loc_def(center)
		if center.ability.name == 'Prolétaire' then 
			if center.ability.extra.boss_blind_applied ~= nil then
				return {localize{type = 'name_text', set = 'Blind', key = center.ability.extra.boss_blind_applied.key, nodes = {}}}
			else
				return {localize('k_na')}
			end
		end
	end
	function SMODS.Jokers.j_coupon.loc_def(center)
		if center.ability.name == 'Coupon' then
			return {center.ability.extra.minus_chips, center.ability.extra.money_off}
		end
	end
	function SMODS.Jokers.j_graffiti.loc_def(center)
		if center.ability.name == 'Graffiti' then
			return {center.ability.extra.mult_add, center.ability.extra.mult_add*G.GAME.current_round.hands_left}
		end
	end
end

----------------------------------------------
------------MOD CODE END----------------------
