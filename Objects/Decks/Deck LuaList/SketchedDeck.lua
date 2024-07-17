local deck_loc_txt = {
	["name"] = "Sketched Deck",
	["text"] = {
		"{C:red}-1{} Hand Size",
		"{C:attention}+1{} Joker Slot",
	}
}

local SketchedDeck = SMODS.Back({
	name = "Sketched Deck", 
	key = "Ortalab_Sketched", 
	config = {hand_size = -1, joker_slot = 1, atlas = "Ortalab-Enhancers"}, 
	pos = {x = 0, y = 1}, 
	loc_txt = deck_loc_txt,
	atlas = "Ortalab_Enhancers",
	register = function(self, order)
        if order then
            self.super.register(self)
        end
    end
})

SketchedDeck.order = 12

return SketchedDeck