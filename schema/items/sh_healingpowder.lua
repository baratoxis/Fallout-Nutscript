ITEM.name = "Healing Powder"
ITEM.category = "Medical"
ITEM.desc = "A small pouch of medical herbs used for healing."
ITEM.model = "models/maxib123/healingpowder.mdl"
ITEM.price = 100
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 150, 250))
	end
}
