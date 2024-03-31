--- STEAMODDED HEADER
--- MOD_NAME: Ortalab
--- MOD_ID: ReverseBalatro
--- MOD_AUTHOR: [Balatro Discrd]
--- MOD_DESCRIPTION: Adds Reverse Jokers

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.ReverseBalatro()
    local jokers_def = {
		jester = { -- Jester
			["name"] = "Jester",
			["text"] = {
				"{C:chips}+25{} Chips",
				"{C:inactive}(Artist: Crimson Heart){}"
			}
		},
		popcorn_bag = { -- Popcorn Bag
			["name"] = "Popcorn Bag",
			["text"] = {
				"{C:mult}+#1#{} Mult.",
				"Gains {C:mult}+#2#{} Mult per round played",
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
				"Gains {C:mult}+#1#{} Mult if played hand",
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
				"POOL LOGIC NOT ADDED",
				"{C:inactive}(Artist: Flare, Grassy){}"
			}
		},
		royal_gala = { -- Royal Gala
			["name"] = "Royal Gala",
			["text"] = {
				"{C:chips}+#1#{} Chips",
				"{C:green}#2# in #3#{} chance this",
				"card is destroyed",
				"at end of round",
				"POOL LOGIC NOT ADDED",
				"{C:inactive}(Artist: ){}"
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
		fuel_tank = { -- Fuel Tank
			["name"] = "Fuel Tank",
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
				"Played cards that are not {C:attention}face{} cards",
				"give {C:mult}+#1#{} Mult when scored",
				"{C:inactive}(Artist: GoldenDiscoPig){}"
			}
		},
		scared_face = { -- Scared Face
			["name"] = "Scared Face",
			["text"] = {
				"Played cards that are not {C:attention}face{} cards",
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
				"ADD SHOP SPECTRAL VOUCHER LOGIC",
				"{C:inactive}(Artist: ){}"
			}
		},
		shrine = { -- Shrine
			["name"] = "Shrine",
			["text"] = {
				"{X:mult,C:white}X#1#{} Mult per",
				"{C:spectral}Spectral{} card used",
				"ADD SHOP SPECTRAL VOUCHER LOGIC",
				"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				"{C:inactive}(Artist: ){}"
			}
		},
		evil_eye = { -- Evil Eye
			["name"] = "Evil Eye",
			["text"] = {
				"Earn {C:money}$#1#{} at end of round",
				"per each unique {C:spectral}Spectral{} card {C:attention}sold",
				"ADD SHOP SPECTRAL VOUCHER LOGIC",
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
				"{C:inactive}(Artist: ){}"
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

	--Joker config setup
    -- SMODS.Joker:new(name, slug, config, spritePos, loc_txt, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat, effect, atlas)
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
		nil --atlas
	)
    local popcorn_bag = SMODS.Joker:new(
		"Popcorn Bag", --name
		"popcorn_bag", --slug
		{extra = {a_mult = 0, a_mult_add = 4}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.popcorn_bag, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local the_solo = SMODS.Joker:new(
		"The Solo", --name
		"the_solo", --slug
		{extra = {x_mult = 4, type = 'High Card'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.the_solo, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local the_mysterium = SMODS.Joker:new(
		"The Mysterium", --name
		"the_mysterium", --slug
		{extra = {x_mult = 3}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.the_mysterium, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local the_spectrum = SMODS.Joker:new(
		"The Spectrum", --name
		"the_spectrum", --slug
		{extra = {x_mult = 2, type = 'Flush'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.the_spectrum, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local collatz = SMODS.Joker:new(
		"Collatz", --name
		"collatz", --slug
		{extra = {x_mult = 3, x_mult_reduction = 0.5, current_chips = 0}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.collatz, --loc_txt
		2, --rarity
		9, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local triangle_joker = SMODS.Joker:new(
		"Triangle Joker", --name
		"triangle_joker", --slug
		{extra = {mult_add = 2, mult_total = 3}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.triangle_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local croupier = SMODS.Joker:new(
		"Croupier", --name
		"croupier", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.croupier, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local chameleon_joker = SMODS.Joker:new(
		"Chameleon Joker", --name
		"chameleon_joker", --slug
		{copied_joker = nil}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.chameleon_joker, --loc_txt
		3, --rarity
		10, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local taliaferro = SMODS.Joker:new(
		"Taliaferro", --name
		"taliaferro", --slug
		{extra = {chips = 80, odds = 4}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.taliaferro, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local royal_gala = SMODS.Joker:new(
		"Royal Gala", --name
		"royal_gala", --slug
		{extra = {chips = 300, odds = 1000}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.royal_gala, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local sedimentation = SMODS.Joker:new(
		"Sedimentation", --name
		"sedimentation", --slug
		{extra = {mult_per_card = 2}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.sedimentation, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local ban_list = SMODS.Joker:new(
		"Blacklist", --name
		"ban_list", --slug
		{extra = {dollars = 2, banlist_poker_hand_1 = 'High Card', banlist_poker_hand_2 = 'Pair'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.ban_list, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local virus = SMODS.Joker:new(
		"Virus", --name
		"virus", --slug
		{extra = {duped_cards = 2, joker_triggered = false}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.virus, --loc_txt
		3, --rarity
		10, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local inverse_midas = SMODS.Joker:new(
		"Beyond The Mask", --name
		"inverse_midas", --slug
		{extra = {dollars = 1, dollars_add = 1}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.inverse_midas, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local patient_joker = SMODS.Joker:new(
		"Patient Joker", --name
		"patient_joker", --slug
		{extra = {chips = 30, suit = 'Spades'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.patient_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local chastful_joker = SMODS.Joker:new(
		"Chastful Joker", --name
		"chastful_joker", --slug
		{extra = {chips = 30, suit = 'Hearts'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.chastful_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local abstemious_joker = SMODS.Joker:new(
		"Abstemious Joker", --name
		"abstemious_joker", --slug
		{extra = {chips = 30, suit = 'Clubs'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.abstemious_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local generous_joker = SMODS.Joker:new(
		"Generous Joker", --name
		"generous_joker", --slug
		{extra = {chips = 30, suit = 'Diamonds'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.generous_joker, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local fuel_tank = SMODS.Joker:new(
		"Fuel Tank", --name
		"fuel_tank", --slug
		{extra = {money = 8, money_loss = 2}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.fuel_tank, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local mint_condition = SMODS.Joker:new(
		"Mint Condition", --name
		"mint_condition", --slug
		{extra = {Xmult = 1.5}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.mint_condition, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local frowny_face = SMODS.Joker:new(
		"Frowny Face", --name
		"frowny_face", --slug
		{extra = {mult = 4}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.frowny_face, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local scared_face = SMODS.Joker:new(
		"Scared Face", --name
		"scared_face", --slug
		{extra = {chips = 30}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.scared_face, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local mystery_soda = SMODS.Joker:new(
		"Mystery Soda", --name
		"mystery_soda", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.mystery_soda, --loc_txt
		2, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local dawn = SMODS.Joker:new(
		"Dawn", --name
		"dawn", --slug
		{extra = 1}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.dawn, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local slot_machine = SMODS.Joker:new(
		"Slot Machine", --name
		"slot_machine", --slug
		{extra = 1}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.slot_machine, --loc_txt
		3, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local roscharch_test = SMODS.Joker:new(
		"Roscharch Test", --name
		"roscharch_test", --slug
		{extra = {chips = 25, mult = 5}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.roscharch_test, --loc_txt
		1, --rarity
		5, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local woo_all_1s = SMODS.Joker:new(
		"Woo! All 1s", --name
		"woo_all_1s", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.woo_all_1s, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local crime_scene = SMODS.Joker:new(
		"Crime Scene", --name
		"crime_scene", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.crime_scene, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local occultist = SMODS.Joker:new(
		"Occultist", --name
		"occultist", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.occultist, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local shrine = SMODS.Joker:new(
		"Shrine", --name
		"shrine", --slug
		{extra = {xmult = 1, xmult_add = 0.25}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.shrine, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		true, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local evil_eye = SMODS.Joker:new(
		"Evil Eye", --name
		"evil_eye", --slug
		{extra = {money = 2, spectral_sold = 0, spectral_type_sold = {}}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.evil_eye, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local fine_wine = SMODS.Joker:new(
		"Fine Wine", --name
		"fine_wine", --slug
		{extra = {discards = 2, odds = 5}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.fine_wine, --loc_txt
		2, --rarity
		6, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local monochrome = SMODS.Joker:new(
		"Monochrome", --name
		"monochrome", --slug
		{extra = {suit = 'Spades'}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.monochrome, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)
	local proletaire = SMODS.Joker:new(
		"Prolétaire", --name
		"proletaire", --slug
		{extra = {boss_blind_applied = nil}}, --config
		{x = 0, y = 0}, --spritePos
		jokers_def.proletaire, --loc_txt
		2, --rarity
		8, --cost
		true, --unlocked
		true, --discovered
		false, --blueprint_compat
		true, --eternal_compat
		'', --effect
		nil --atlas
	)

	--Voucher config
	--SMODS.Voucher:new(name, slug, config, pos, loc_txt, cost, unlocked, discovered, available, requires, atlas)
	local shady_trading = SMODS.Voucher:new(
		"Shady Trading", --name
		"shady_trading", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		voucher_def.shady_trading, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		true, --available
		{}, --requires
		nil --atlas
	)
	local illegal_imports = SMODS.Voucher:new(
		"Illegal Imports", --name
		"illegal_imports", --slug
		{}, --config
		{x = 0, y = 0}, --spritePos
		voucher_def.illegal_imports, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		false, --available
		{'v_shady_trading'}, --requires
		nil --atlas
	)
	local window_shopping = SMODS.Voucher:new(
		"Window Shopping", --name
		"window_shopping", --slug
		{free_rerolls = 1}, --config
		{x = 0, y = 0}, --spritePos
		voucher_def.window_shopping, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		true, --available
		{}, --requires
		nil --atlas
	)
	local infinite_scroll = SMODS.Voucher:new(
		"Infinite Scroll", --name
		"infinite_scroll", --slug
		{free_rerolls = 2}, --config
		{x = 0, y = 0}, --spritePos
		voucher_def.infinite_scroll, --loc_txt
		10, --cost
		true, --unlocked
		true, --discovered
		false, --available
		{'v_window_shopping'}, --requires
		nil --atlas
	)

	--Joker Register/Atlas
	jester:register()
	SMODS.Sprite:new("j_jester", SMODS.findModByID("ReverseBalatro").path, "j_jester.png", 71, 95, "asset_atli"):register()
	popcorn_bag:register()
	SMODS.Sprite:new("j_popcorn_bag", SMODS.findModByID("ReverseBalatro").path, "j_popcorn_bag.png", 71, 95, "asset_atli"):register()
	G.localization.misc.dictionary.k_explode = "Exploded!" --Used for Popcorn Bag
	collatz:register()
	SMODS.Sprite:new("j_collatz", SMODS.findModByID("ReverseBalatro").path, "j_collatz.png", 71, 95, "asset_atli"):register()
	the_solo:register()
	SMODS.Sprite:new("j_the_solo", SMODS.findModByID("ReverseBalatro").path, "j_the_solo.png", 71, 95, "asset_atli"):register()
	the_mysterium:register()
	SMODS.Sprite:new("j_the_mysterium", SMODS.findModByID("ReverseBalatro").path, "j_the_mysterium.png", 71, 95, "asset_atli"):register()
	the_spectrum:register()
	triangle_joker:register()
	croupier:register()
	SMODS.Sprite:new("j_croupier", SMODS.findModByID("ReverseBalatro").path, "j_croupier.png", 71, 95, "asset_atli"):register()
	chameleon_joker:register()
	SMODS.Sprite:new("j_chameleon_joker", SMODS.findModByID("ReverseBalatro").path, "j_chameleon_joker.png", 71, 95, "asset_atli"):register()
	G.localization.misc.dictionary.k_na = "N/A"
	taliaferro:register()
	SMODS.Sprite:new("j_taliaferro", SMODS.findModByID("ReverseBalatro").path, "j_taliaferro.png", 71, 95, "asset_atli"):register()
	royal_gala:register()
	SMODS.Sprite:new("j_royal_gala", SMODS.findModByID("ReverseBalatro").path, "j_royal_gala.png", 71, 95, "asset_atli"):register()
	sedimentation:register()
	SMODS.Sprite:new("j_sedimentation", SMODS.findModByID("ReverseBalatro").path, "j_sedimentation.png", 71, 95, "asset_atli"):register()
	ban_list:register()
	SMODS.Sprite:new("j_ban_list", SMODS.findModByID("ReverseBalatro").path, "j_ban_list.png", 71, 95, "asset_atli"):register()
	virus:register()
	G.localization.misc.dictionary.k_infect = "Infected!" --Used for Virus
	G.localization.misc.dictionary.k_destroy = "Destoyed!" --Used for Virus
	SMODS.Sprite:new("j_virus", SMODS.findModByID("ReverseBalatro").path, "j_virus.png", 71, 95, "asset_atli"):register()
	inverse_midas:register()
	SMODS.Sprite:new("j_inverse_midas", SMODS.findModByID("ReverseBalatro").path, "j_inverse_midas.png", 71, 95, "asset_atli"):register()
	patient_joker:register()
	chastful_joker:register()
	abstemious_joker:register()
	generous_joker:register()
	SMODS.Sprite:new("j_patient_joker", SMODS.findModByID("ReverseBalatro").path, "j_patient_joker.png", 71, 95, "asset_atli"):register()
	SMODS.Sprite:new("j_chastful_joker", SMODS.findModByID("ReverseBalatro").path, "j_chastful_joker.png", 71, 95, "asset_atli"):register()
	SMODS.Sprite:new("j_abstemious_joker", SMODS.findModByID("ReverseBalatro").path, "j_abstemious_joker.png", 71, 95, "asset_atli"):register()
	SMODS.Sprite:new("j_generous_joker", SMODS.findModByID("ReverseBalatro").path, "j_generous_joker.png", 71, 95, "asset_atli"):register()
	fuel_tank:register()
	G.localization.misc.dictionary.k_leak = "Leaked!" --Used for Fuel Tank
	G.localization.misc.dictionary.k_empty = "Empty!" --Used for Fuel Tank
	mint_condition:register()
	frowny_face:register()
	SMODS.Sprite:new("j_frowny_face", SMODS.findModByID("ReverseBalatro").path, "j_frowny_face.png", 71, 95, "asset_atli"):register()
	scared_face:register()
	SMODS.Sprite:new("j_scared_face", SMODS.findModByID("ReverseBalatro").path, "j_scared_face.png", 71, 95, "asset_atli"):register()
	mystery_soda:register()
	dawn:register()
	SMODS.Sprite:new("j_dawn", SMODS.findModByID("ReverseBalatro").path, "j_dawn.png", 71, 95, "asset_atli"):register()
	slot_machine:register()
	SMODS.Sprite:new("j_slot_machine", SMODS.findModByID("ReverseBalatro").path, "j_slot_machine.png", 71, 95, "asset_atli"):register()
	roscharch_test:register()
	SMODS.Sprite:new("j_roscharch_test", SMODS.findModByID("ReverseBalatro").path, "j_roscharch_test.png", 71, 95, "asset_atli"):register()
	woo_all_1s:register()
	SMODS.Sprite:new("j_woo_all_1s", SMODS.findModByID("ReverseBalatro").path, "j_woo_all_1s.png", 71, 95, "asset_atli"):register()
	crime_scene:register()
	SMODS.Sprite:new("j_crime_scene", SMODS.findModByID("ReverseBalatro").path, "j_crime_scene.png", 71, 95, "asset_atli"):register()
	occultist:register()
	shrine:register()
	evil_eye:register()
	SMODS.Sprite:new("j_evil_eye", SMODS.findModByID("ReverseBalatro").path, "j_evil_eye.png", 71, 95, "asset_atli"):register()
	fine_wine:register()
	SMODS.Sprite:new("j_fine_wine", SMODS.findModByID("ReverseBalatro").path, "j_fine_wine.png", 71, 95, "asset_atli"):register()
	monochrome:register()
	proletaire:register()


	--Voucher register
	shady_trading:register()
	SMODS.Sprite:new("v_shady_trading", SMODS.findModByID("ReverseBalatro").path, "v_shady_trading.png", 71, 95, "asset_atli"):register()
	illegal_imports:register()
	SMODS.Sprite:new("v_illegal_imports", SMODS.findModByID("ReverseBalatro").path, "v_illegal_imports.png", 71, 95, "asset_atli"):register()
	window_shopping:register()
	SMODS.Sprite:new("v_window_shopping", SMODS.findModByID("ReverseBalatro").path, "v_window_shopping.png", 71, 95, "asset_atli"):register()
	infinite_scroll:register()
	SMODS.Sprite:new("v_infinite_scroll", SMODS.findModByID("ReverseBalatro").path, "v_infinite_scroll.png", 71, 95, "asset_atli"):register()

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
					func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}}); return true
					end}))
		end
		if SMODS.end_calculate_context(context) then
			sendDebugMessage('end calculate context reached with Popcorn Bag')
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
		BlindStay_Flipped_ref(self, area, card)
		if next(find_joker("Prolétaire")) then
			for k, v in pairs(G.jokers.cards) do
				if v.ability.name == 'Prolétaire' then
					if not self.disabled then
						if area == G.hand then
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
			end
		end
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
				for k, v in (G.P_CENTERS) do
					if v[k].no_pool_flag == 'crime_scene_pool_disable' then
						v[k].no_pool_flag = nil
					end
				end
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
			if self.ability.name == "Fuel Tank" then
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

	--Voucher redeem logic
	function SMODS.Vouchers.v_shady_trading:redeem(center)
		if center.name == 'Shady Trading' then
			G.GAME.spectral_rate = 2
		end
	end
	function SMODS.Vouchers.v_illegal_imports:redeem(center)
		if center.name == 'Illegal Imports' then
			G.GAME.spectral_rate = 4
		end
	end
	function SMODS.Vouchers.v_window_shopping:redeem(center)
		if center.name == 'Window Shopping' then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 1
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 1)
				calculate_reroll_cost(true)
				return true end }))
		end
	end
	function SMODS.Vouchers.v_infinite_scroll:redeem(center)
		if center.name == 'Infinite Scroll' then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + 2
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 2
				G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 2)
				calculate_reroll_cost(true)
				return true end }))
		end
	end

	--Joker loc_def
	function SMODS.Jokers.j_jester:loc_def()
		if self.ability.name == 'Jester' then
			return {self.ability.extra.chips}
		end
	end
	function SMODS.Jokers.j_popcorn_bag:loc_def()
		if self.ability.name == 'Popcorn Bag' then
			return {self.ability.extra.a_mult, card.ability.extra.a_mult_add}
		end
	end
	function SMODS.Jokers.j_collatz:loc_def()
		if self.ability.name == 'Collatz' then
			return {self.ability.extra.x_mult, self.ability.extra.x_mult_reduction}
		end
	end
	function SMODS.Jokers.j_the_mysterium:loc_def()
		if self.ability.name == 'The Mysterium' then
			return {self.ability.extra.x_mult}
		end
	end
	function SMODS.Jokers.j_the_spectrum:loc_def()
		if self.ability.name == 'The Spectrum' then
			return {self.ability.extra.x_mult, localize(self.ability.extra.type, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_triangle_joker:loc_def()
		if self.ability.name == 'Triangle Joker' then
			return {self.ability.extra.mult_add, self.ability.extra.mult_total}
		end
	end
	function SMODS.Jokers.j_the_solo:loc_def()
		if self.ability.name == 'The Solo' then
			return {self.ability.extra.x_mult, localize(self.ability.extra.type, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_chameleon_joker:loc_def()
		if self.ability.name == 'Chameleon Joker' then
			if self.ability.copied_joker ~= nil then
				return {localize{type = 'name_text', set = self.ability.copied_joker.config.center.set, key = self.ability.copied_joker.config.center.key, nodes = {}}}
			else
				return {localize('k_na')}
			end
		end
	end
	function SMODS.Jokers.j_taliaferro:loc_def()
		if self.ability.name == 'Taliaferro' then
			return {self.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_royal_gala:loc_def()
		if self.ability.name == 'Royal Gala' then
			return {self.ability.extra.chips, ''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_sedimentation:loc_def()
		if self.ability.name == 'Sedimentation' then
			return {self.ability.extra.mult_per_card, math.max(0,self.ability.extra.mult_per_card*(G.playing_cards and (#G.playing_cards - G.GAME.starting_deck_size) or 0)), G.GAME.starting_deck_size}
		end
	end
	function SMODS.Jokers.j_ban_list:loc_def()
		if self.ability.name == 'Blacklist' then
			return {self.ability.extra.dollars, localize(self.ability.extra.banlist_poker_hand_1, 'poker_hands'), localize(self.ability.extra.banlist_poker_hand_2, 'poker_hands')}
		end
	end
	function SMODS.Jokers.j_virus:loc_def()
		if self.ability.name == 'Virus' then
			return {self.ability.extra.duped_cards}
		end
	end
	function SMODS.Jokers.j_inverse_midas:loc_def()
		if self.ability.name == 'Beyond The Mask' then
			return {self.ability.extra.dollars, self.ability.extra.dollars_add}
		end
	end
	function SMODS.Jokers.j_patient_joker:loc_def()
		if self.ability.name == 'Patient Joker' then
			return {self.ability.extra.chips, localize(self.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_chastful_joker:loc_def()
		if self.ability.name == 'Chastful Joker' then
			return {self.ability.extra.chips, localize(self.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_abstemious_joker:loc_def()
		if self.ability.name == 'Abstemious Joker' then
			return {self.ability.extra.chips, localize(self.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_generous_joker:loc_def()
		if self.ability.name == 'Generous Joker' then
			return {self.ability.extra.chips, localize(self.ability.extra.suit, 'suits_singular')}
		end
	end
	function SMODS.Jokers.j_fuel_tank:loc_def()
		if self.ability.name == 'Fuel Tank' then
			return {self.ability.extra.money, self.ability.extra.money_loss}
		end
	end
	function SMODS.Jokers.j_mint_condition:loc_def()
		if self.ability.name == 'Mint Condition' then
			return {self.ability.extra.Xmult}
		end
	end
	function SMODS.Jokers.j_frowny_face:loc_def()
		if self.ability.name == 'Frowny Face' then
			return {self.ability.extra.mult}
		end
	end
	function SMODS.Jokers.j_scared_face:loc_def()
		if self.ability.name == 'Scared Face' then
			return {self.ability.extra.chips}
		end
	end
	function SMODS.Jokers.j_dawn:loc_def()
		if self.ability.name == 'Dawn' then
			return {self.ability.extra+1}
		end
	end
	function SMODS.Jokers.j_roscharch_test:loc_def()
		if self.ability.name == 'Roscharch Test' then
			return {self.ability.extra.chips, self.ability.extra.mult}
		end
	end
	function SMODS.Jokers.j_shrine:loc_def()
		if self.ability.name == 'Shrine' then
			return {self.ability.extra.xmult_add, self.ability.extra.xmult}
		end
	end
	function SMODS.Jokers.j_evil_eye:loc_def()
		if self.ability.name == 'Evil Eye' then
			return {self.ability.extra.money, self.ability.extra.money*self.ability.extra.spectral_sold}
		end
	end
	function SMODS.Jokers.j_fine_wine:loc_def()
		if self.ability.name == 'Fine Wine' then
			return {self.ability.extra.discards, ''..(G.GAME and G.GAME.probabilities.normal or 1), self.ability.extra.odds}
		end
	end
	function SMODS.Jokers.j_monochrome:loc_def()
		if self.ability.name == 'Monochrome' then
			return {localize(self.ability.extra.suit, 'suits_singular'), colours = {G.C.SUITS[self.ability.extra.suit]}}
		end
	end
	function SMODS.Jokers.j_proletaire:loc_def()
		if self.ability.name == 'Prolétaire' then 
			if self.ability.extra.boss_blind_applied ~= nil then
				return {localize{type = 'name_text', set = 'Blind', key = self.ability.extra.boss_blind_applied.key, nodes = {}}}
			else
				return {localize('k_na')}
			end
		end
	end
end


----------------------------------------------
------------MOD CODE END----------------------