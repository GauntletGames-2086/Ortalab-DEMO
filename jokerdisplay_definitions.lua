------------------------------
-- JokerDisplay Integration --
------------------------------

local jd_def = JokerDisplay.Definitions

jd_def["j_olab_jester"] = { -- Jester
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS }
}
jd_def["j_olab_generous_joker"] = { -- Generous Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = { --
        { text = "(" },
        {
            ref_table = "card.joker_display_values",
            ref_value = "localized_text",
            colour = lighten(G.C.SUITS["Diamonds"], 0.35)
        },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit(card.ability.extra.suit) then
                    chips = chips +
                        card.ability.extra.chips *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
    end
}
jd_def["j_olab_chastful_joker"] = { -- Chastful Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = { --
        { text = "(" },
        {
            ref_table = "card.joker_display_values",
            ref_value = "localized_text",
            colour = lighten(G.C.SUITS["Hearts"], 0.35)
        },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit(card.ability.extra.suit) then
                    chips = chips +
                        card.ability.extra.chips *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
    end
}
jd_def["j_olab_patient_joker"] = { -- Patient Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = { --
        { text = "(" },
        {
            ref_table = "card.joker_display_values",
            ref_value = "localized_text",
            colour = lighten(G.C.SUITS["Spades"], 0.35)
        },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit(card.ability.extra.suit) then
                    chips = chips +
                        card.ability.extra.chips *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
    end
}
jd_def["j_olab_abstemious_joker"] = { -- Abstemious Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = { --
        { text = "(" },
        {
            ref_table = "card.joker_display_values",
            ref_value = "localized_text",
            colour = lighten(G.C.SUITS["Clubs"], 0.35)
        },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_suit(card.ability.extra.suit) then
                    chips = chips +
                        card.ability.extra.chips *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
    end
}
jd_def["j_olab_the_solo"] = { -- The Solo
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.x_mult = text == card.ability.extra.type and card.ability.extra.x_mult or 1
        card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
    end
}
jd_def["j_olab_the_mysterium"] = { -- The Mysterium
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.x_mult = (text == 'Flush Five' or text == 'Flush House' or text == 'Five of a Kind') and
            card.ability.extra.x_mult or 1
        card.joker_display_values.localized_text = "Secret Hands"
    end
}
jd_def["j_olab_the_spectrum"] = { -- The Spectrum
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local x_mult = card.ability.extra.x_mult
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, poker_hands, _ = JokerDisplay.evaluate_hand(hand)
        if #hand == 0 or text == "Unknown" or poker_hands[card.ability.extra.type] and next(poker_hands[card.ability.extra.type]) then
            x_mult = 1
        end
        card.joker_display_values.x_mult = x_mult
        card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
    end
}
jd_def["j_olab_popcorn_bag"] = { -- Popcorn Bag
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "a_mult" }
    },
    text_config = { colour = G.C.MULT }
}
jd_def["j_olab_collatz"] = { -- Collatz Conjecture
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult" }
            }
        },
        { text = ' ' },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult_reduction" }
            }
        },
    },
    reminder_text = {
        { text = "(" },
        { text = "Odd",  colour = G.C.ORANGE },
        { text = ") (" },
        { text = "Even", colour = G.C.ORANGE },
        { text = ")" },
    }
}
jd_def["j_olab_triangle_joker"] = { -- Triangle Joker
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult_total" }
    },
    text_config = { colour = G.C.MULT }
}
jd_def["j_olab_croupier"] = { -- Croupier

}
jd_def["j_olab_chameleon_joker"] = { -- Chameleon Joker
    -- There's no easy way to copy a Joker that's not in play yet
    reminder_text = {
        { text = '(', },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ')', },
    },
    calc_function = function(card)
        local localized_text = nil
        if card.ability.copied_joker then
            if type(card.ability.copied_joker) == 'string' then
                localized_text = localize { type = 'name_text', set = "Joker", key = G.jokers.cards[card.ability.copied_joker_pos].config.center.key }
            end
            if card.ability.copied_joker and type(card.ability.copied_joker) == 'table' then
                localized_text = localize { type = 'name_text', set = "Joker", key = card.ability.copied_joker.config.center.key }
            end
        end
        card.joker_display_values.localized_text = localized_text or "-"
    end
}
jd_def["j_olab_taliaferro"] = { -- Taliaferro
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}
jd_def["j_olab_royal_gala"] = { -- Royal Gala
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}
jd_def["j_olab_sedimentation"] = { -- Sedimentation
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
        card.joker_display_values.mult = math.max(0,
            card.ability.extra.mult_per_card * (G.playing_cards and (#G.playing_cards - G.GAME.starting_deck_size) or 0))
    end
}
jd_def["j_olab_ban_list"] = { -- Blacklist
    text = {
        { text = '+$' },
        { ref_table = 'card.joker_display_values', ref_value = 'dollars' },
    },
    text_config = { colour = G.C.GOLD },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_2", colour = G.C.ORANGE },
            { text = ")" },
        },
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_1", colour = G.C.ORANGE },
            { text = ")" },
        },
    },
    extra_config = { colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.dollars = (#hand == 0 or text == "Unknown" or text == card.ability.extra.banlist_poker_hand_1 or text == card.ability.extra.banlist_poker_hand_2) and
            0 or card.ability.extra.dollars
        card.joker_display_values.localized_text_1 = localize(card.ability.extra.banlist_poker_hand_1, 'poker_hands')
        card.joker_display_values.localized_text_2 = localize(card.ability.extra.banlist_poker_hand_2, 'poker_hands')
    end
}
jd_def["j_olab_virus"] = { -- Virus
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.active = (G.GAME and G.GAME.current_round.hands_played == 0 and localize("k_active_ex") or "Inactive")
    end
}
jd_def["j_olab_inverse_midas"] = { -- Beyond The Mask
    text = {
        { text = "+$" },
        { ref_table = "card.ability.extra", ref_value = "dollars" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
    end
}
jd_def["j_olab_fuel_tank"] = { -- Afterburner
    text = {
        { text = "+$" },
        { ref_table = "card.ability.extra", ref_value = "money" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
    end
}
jd_def["j_olab_mint_condition"] = { -- Mint Condition
    mod_function = function(card, mod_joker)
        return { x_mult = (not (card == mod_joker) and (card.ability.name == 'To the Moon' or card:calculate_dollar_bonus()) and mod_joker.ability.extra.Xmult or nil) }
    end
}
jd_def["j_olab_frowny_face"] = { -- Frowny Face
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local mult = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if not (scoring_card:get_id() == 11 or scoring_card:get_id() == 12 or scoring_card:get_id() == 13) then
                    mult = mult +
                        card.ability.extra.mult *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = "Numbered Cards"
    end
}
jd_def["j_olab_scared_face"] = { -- Scared Face
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if not (scoring_card:get_id() == 11 or scoring_card:get_id() == 12 or scoring_card:get_id() == 13) then
                    chips = chips +
                        card.ability.extra.chips *
                        JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = "Numbered Cards"
    end
}
jd_def["j_olab_mystery_soda"] = { -- Mystery Soda

}
jd_def["j_olab_dawn"] = { -- Dawn
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.active = G.GAME and
            ((not next(G.play.cards) and G.GAME.current_round.hands_played < 1) or
                (next(G.play.cards) and G.GAME.current_round.hands_played <= 1))
        card.joker_display_values.active_text = card.joker_display_values.active and
            localize("k_active_ex") or "Inactive"
    end,
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return joker_card.joker_display_values.active and joker_card.ability.extra or 0
    end
}
jd_def["j_olab_slot_machine"] = { -- Slot Machine
    text = {
        { text = '+' },
        { ref_table = "card.joker_display_values", ref_value = "count" },
    },
    text_config = { colour = G.C.SECONDARY_SET.Spectral },
    reminder_text = {
        { text = "(" },
        { text = 'Lucky 7s', colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local count = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if (scoring_card:get_id() == 7 or scoring_card.ability.name == "Lucky Card") then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.count = count >= 3 and 1 or 0
    end
}
jd_def["j_olab_roscharch_test"] = { -- Roscharch Test
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count" },
        { text = "x",                              scale = 0.35 },
        { text = "+",                              colour = G.C.CHIPS },
        { ref_table = "card.ability.extra",        ref_value = "chips",          colour = G.C.CHIPS },
        { text = "/",                              colour = G.C.UI.TEXT_INACTIVE },
        { text = "+",                              colour = G.C.MULT },
        { ref_table = "card.ability.extra",        ref_value = "mult",           colour = G.C.MULT }
    },
    reminder_text = {
        { text = "(2,5) (Random)" }
    },
    calc_function = function(card)
        local count = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() and (scoring_card:get_id() == 2 or scoring_card:get_id() == 5) then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.count = count
    end
}
jd_def["j_olab_woo_all_1s"] = { -- Woo! All 1s

}
jd_def["j_olab_crime_scene"] = { -- Crime Scene

}
jd_def["j_olab_occultist"] = { -- Occultist

}
jd_def["j_olab_shrine"] = { -- Shrine
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult" }
            }
        },
    },
}
jd_def["j_olab_evil_eye"] = { -- Evil Eye
    text = {
        { text = '+$' },
        { ref_table = "card.joker_display_values", ref_value = "dollars" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        card.joker_display_values.dollars = card.ability.extra.money * card.ability.extra.spectral_sold
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
    end
}
jd_def["j_olab_fine_wine"] = { -- Fine Wine
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}
jd_def["j_olab_monochrome"] = { -- Monochrome
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = localize(card.ability.extra.suit or "Spades", 'suits_plural')
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
            reminder_text.children[2].config.colour = lighten(G.C.SUITS[card.ability.extra.suit or "Spades"], 0.35)
        end
        return false
    end
}
jd_def["j_olab_proletaire"] = { -- Prolétaire
    text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text_round" },
    },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_boss", colour = G.C.ORANGE },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
    calc_function = function(card)
        local boss_key = nil
        if card.ability.extra.boss_blind_applied then
            for k, v in pairs(G.P_BLINDS) do
                if card.ability.extra.boss_blind_applied.name == v.name then
                    boss_key = k
                end
            end
        end
        card.joker_display_values.dollars = G.GAME.blind and G.GAME.blind.dollars or 0
        card.joker_display_values.localized_text_round = "(" .. localize("k_round") .. ")"
        card.joker_display_values.localized_text_boss = (boss_key and localize { type = 'name_text', set = 'Blind', key = boss_key } or "-")
    end
}
jd_def["j_olab_art_gallery"] = { -- Art Gallery
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    calc_function = function(card)
        local total_cards = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    total_cards = total_cards + 1
                end
            end
        end
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i] then
                    total_cards = total_cards + 1
                end
            end
        end
        card.joker_display_values.chips = total_cards * card.ability.extra.chips_add
    end
}
jd_def["j_olab_instant_gratification"] = { -- Instant Gratification

}
jd_def["j_olab_coupon"] = { -- Coupon
    text = {
        { text = "-" },
        { ref_table = "card.ability.extra", ref_value = "minus_chips" }
    },
    text_config = { colour = G.C.CHIPS }
}
jd_def["j_olab_graffiti"] = { -- Graffiti
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
        card.joker_display_values.mult = math.max(0, card.ability.extra.mult_add * G.GAME.current_round.hands_left)
    end
}
jd_def["j_olab_mathmagician"] = { -- Mathmagician
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "count" },
    },
    text_config = { colour = G.C.SECONDARY_SET.Tarot },
    reminder_text = {
        { text = "(2 Odd+2 Even)" },
    },
    calc_function = function(card)
        local numbered_odd = 0
        local numbered_even = 0
        local hand = G.hand.highlighted
        for _, playing_card in pairs(hand) do
            if ((playing_card:get_id() <= 10 and playing_card:get_id() >= 0 and playing_card:get_id() % 2 == 1) or (playing_card:get_id() == 14)) then
                numbered_odd = numbered_odd + 1
            elseif playing_card:get_id() <= 10 and playing_card:get_id() >= 0 and playing_card:get_id() % 2 == 0 then
                numbered_even = numbered_even + 1
            end
        end
        card.joker_display_values.count = G.GAME.current_round.discards_left > 0 and
            numbered_even >= 2 and numbered_odd >= 2 and 1 or 0
    end
}
