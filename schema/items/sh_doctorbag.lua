ITEM.name = "Doctor's Bag"
ITEM.category = "Medical"
ITEM.desc = "Medical Bag used for healing."
ITEM.model = "models/fallout new vegas/doctor_bag.mdl"
ITEM.price = 300
ITEM.width = 2
ITEM.height = 2
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 250, 250))

	end
}
