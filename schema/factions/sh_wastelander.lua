FACTION.name = "Wastelander"
FACTION.desc = "The Commonfolk."
FACTION.color = Color(198, 212, 138)
FACTION.isDefault = true
FACTION.health = 150
FACTION.models = {
		"models/thespireroleplay/humans/group050/male_01.mdl",
		"models/thespireroleplay/humans/group050/male_01g.mdl",
		"models/thespireroleplay/humans/group050/male_02.mdl",
		"models/thespireroleplay/humans/group050/male_05.mdl",
		"models/thespireroleplay/humans/group050/male_06.mdl",
		"models/thespireroleplay/humans/group050/male_07.mdl",
		"models/thespireroleplay/humans/group050/female_01.mdl",
		"models/thespireroleplay/humans/group050/female_01g.mdl",
		"models/thespireroleplay/humans/group050/female_02.mdl",
		"models/thespireroleplay/humans/group050/female_05.mdl",
		"models/thespireroleplay/humans/group050/female_06.mdl",
		"models/thespireroleplay/humans/group050/female_07.mdl",
}

function FACTION:onSpawn(client)
		client:SetHealth(self.health) -- Sets your health, you can not be healed to this amount unless your maxhealth is the same. This is needed because gmod sets your health to 100 by default.
end
FACTION_WASTELANDER = FACTION.index