ITEM.name = "Stimpack"
ITEM.category = "Medical"
ITEM.desc = "Small Medical Syringe used for healing."
ITEM.model = "models/clutter/stimpack.mdl"
ITEM.price = 100
ITEM.functions.Use = {
	sound = "items/medshot4.wav",
	onRun = function(item)
		item.player:SetHealth(math.min(item.player:Health() + 150, 250))
	end
}
