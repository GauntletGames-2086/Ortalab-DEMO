local deck_loc_txt = {
	["name"] = "Cyan Deck",
	["text"] = {
		"{C:blue}+2{} hands",
		"{C:red}-1{} discard",
	}
}
local CyanDeck = SMODS.Back({
	name = "Cyan Deck", 
	key = "Ortalab_Cyan", 
	config = {hands = 2, discards = -1, atlas = "Ortalab-Enhancers"}, 
	pos = {x = 0, y = 0}, 
	loc_txt = deck_loc_txt,
	atlas = "Ortalab_Enhancers",
	register = function(self, order)
        if order then
            self.super.register(self)
        end
    end
})

CyanDeck.order = 2

return CyanDeck