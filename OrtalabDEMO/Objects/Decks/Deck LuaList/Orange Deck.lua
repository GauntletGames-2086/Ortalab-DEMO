local deck_loc_txt = {
	["name"] = "Orange Deck",
	["text"] = {
		"{C:red}+2{} discards",
		"{C:blue}-1{} hand",
	}
}
local OrangeDeck = SMODS.Back({
	name = "Orange Deck", 
	key = "Ortalab_Orange", 
	config = {hands = -1, discards = 2, atlas = "Ortalab-Enhancers"}, 
	pos = {x = 1, y = 0}, 
	loc_txt = deck_loc_txt,
	atlas = "Ortalab_Enhancers",
	register = function(self, order)
        if order then
            self.super.register(self)
        end
    end
})

OrangeDeck.order = 1

return OrangeDeck