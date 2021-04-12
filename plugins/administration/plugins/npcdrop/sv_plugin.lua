local PLUGIN = PLUGIN
PLUGIN.itemDrops = {
	drop = {
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_glow_radscorpion"},
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_giant_radscorpion"},
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_nuka_radscorpion"},
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_radscorpion"},
		{items = {"deathclawegg"}, chance = 50, class = "npc_vj_fo3_dc_deathclaw_alpha"},
		{items = {"deathclawegg"}, chance = 50, class = "npc_vj_fo3_dc_deathclaw_mother"},
		{items = {"deathclaw"}, chance = 100, class = "npc_vj_fo3_dc_deathclaw_alpha"},
		{items = {"deathclaw"}, chance = 100, class = "npc_vj_fo3_dc_deathclaw_mother"},
		{items = {"food_deathclaw_meat"}, chance = 100, class = "npc_vj_fo3_dc_deathclaw_baby"},
		{items = {"food_deathclaw_meat"}, chance = 100, class = "npc_vj_fo3_dc_deathclaw"},
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_bark_scorpion"},
		{items = {"food_radscorpion_meat"}, chance = 100, class = "npc_vj_fo3_rs_albino_radscorpion"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_brahmin"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_brahminpack"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_brahminwater"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_bighorner"},
		{items = {"food_dog_meat"}, chance = 100, class = "npc_vj_fallout_coyote"},
		{items = {"food_dog_meat"}, chance = 100, class = "npc_vj_fallout_dog"},
		{items = {"food_dog_meat"}, chance = 100, class = "npc_vj_fallout_mongrel"},
		{items = {"food_dog_meat"}, chance = 100, class = "npc_vj_fallout_viciousdog"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_giantrat"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_molerat"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fo3_glowroach"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fallout_nightstalker"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fo3_radroach"},
		{items = {"food_raw_meat"}, chance = 100, class = "npc_vj_fo3_nukaroach"},
		{items = {"yaoclaw"}, chance = 50, class = "npc_vj_fallout_yaoguai"},
		{items = {"food_mirelurk_egg"}, chance = 100, class = "npc_vj_fo3_mirelurk_queen"},
		{items = {"food_mirelurk_egg"}, chance = 100, class = "npc_vj_fo3_mirelurk_king"},
		{items = {"coupon"}, chance = 100, class = "npc_vj_fo3_fg_feralghoul_robco"},
		{items = {"coupon"}, chance = 100, class = "npc_vj_fo3_fg_feralghoul_roamer_robco"},
		{items = {"prize"}, chance = 100, class = "npc_vj_fallout_supermutant_behemoth"},
		{items = {"prize"}, chance = 100, class = "npc_vj_fallout_giantantqueen"},
		{items = {"ammo_10mm"}, chance = 100, class = "raidersadistm"},
		{items = {"ammo_9mm"}, chance = 100, class = "painspikeraiderf"},
		{items = {"ammo_556mm"}, chance = 100, class = "legionwander_h"},
		{items = {"steel"}, chance = 100, class = "assaultron2"},
		{items = {"ammo_556mm"}, chance = 100, class = "npc_vj_fo3_fg_feralghoul_trooper"},
		{items = {"ammo_9mm"}, chance = 100, class = "npc_vj_fo3_fg_feralghoul_trooper_roaming"},
	}
}

if (SERVER) then
	function PLUGIN:OnNPCKilled(entity, attacker)
		if (!IsValid(entity)) then
			return
		end

		if (!IsValid(attacker) and !attacker:IsPlayer()) then
			return
		end
		
		for k, v in ipairs(self.itemDrops.drop) do
			if (entity:GetClass() == v.class) then
				if (100 * math.random() > v.chance) then
					break
				end
				
				nut.item.spawn(table.Random(v.items), entity:GetPos() + Vector(0, 0, 15))
				break
			end
		end
	end
end
