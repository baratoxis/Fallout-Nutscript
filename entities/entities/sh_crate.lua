AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "nut_loot_base"
ENT.PrintName = "Metal Crate Low Tier"
ENT.Author = "Barata"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Loot Items"
ENT.Model = "models/maxib123/metalstoragecontainer.mdl"
ENT.LastItemTime = 0 -- In seconds, time before item can spawn
ENT.Chance = 100 -- In percentage, chance of item spawning every ChanceTime
ENT.ChanceTime = 180 -- In seconds, how often after LastItemTime it attempts to spawn
ENT.Items = { -- In percentage, total HAS to be 100%
["j_scrap_metal"] = 30,
["j_scrap_glass"] = 10,
["j_scrap_nails"] = 10,
["j_scrap_cloth"] = 25,
["prize"] = 5,
["coupon"] = 20,
}

if (SERVER) then
    function ENT:Initialize()
        self:SetModel(self.Model)
		self:SetUseType(SIMPLE_USE)
		self:DrawShadow(true)
        self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:DropToFloor()
        self:AddEffects(EF_ITEM_BLINK)
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
        end
    end
end
