ITEM.name = "Super Stimpack"
ITEM.category = "Medical"
ITEM.desc = "Medical Syringe used for healing."
ITEM.model = "models/clutter/stimpack.mdl"
ITEM.price = 200
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 225, 250))
	end
}
