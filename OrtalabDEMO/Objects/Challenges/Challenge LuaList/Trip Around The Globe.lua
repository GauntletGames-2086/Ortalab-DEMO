local challenge_info = SMODS.Challenge({
    name = "Trip Around The Globe",
    key = 'trip_around_the_globe',
    rules = {
        custom = {
            {id = 'only_straight'},
        },
    },
    jokers = {
        {id = 'j_shortcut', eternal = true},
        {id = 'j_olab_scenic_route', eternal = true},
    },
    process_loc_text = function(self)
        SMODS.Challenge.process_loc_text(self)
        SMODS.process_loc_text(G.localization.misc.v_text, 'ch_c_only_straight', {"Played hands that do not contain a straight are {C:attention}debuffed{}"})
    end
})

return {challenge_info, order = 2}