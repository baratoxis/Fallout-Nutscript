AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Loot base"
ENT.Author = "Barata"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.Category = "NutScript"
ENT.Model = "models/props_junk/cardboard_box001a.mdl"
ENT.LastItemTime = 0 -- In minutes, time before item can spawn
ENT.Chance = 50 -- In percentage, chance of item spawning every ChanceTime
ENT.ChanceTime = 10 -- In seconds, how often after LastItemTime it attempts to spawn
ENT.lastItem = 0
ENT.availableItem = false

if (SERVER) then
    function ENT:Initialize()
		self:SetModel(self.Model)
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		self:PhysicsInit(SOLID_BBOX)
		self:DropToFloor()
        self:AddEffects(EF_ITEM_BLINK)
		
		self.Items = self.Items
		
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false)
			physicsObject:Sleep()
        end
    end

    function ENT:Think()
        -- After LastItemTime it should test with Chance if an item should be spawned.
        if (self.lastItem >= self.LastItemTime) then
            local chance = math.random(100)
            if (chance <= self.Chance) then
                self.availableItem = true
				self.lastItem = 0
            end
        end
		
        self.lastItem = self.lastItem + 1
        self:NextThink(CurTime() + self.ChanceTime)
        return true
    end

    function ENT:Use(ply)
        if (self.availableItem) then
            local itemChance = math.random(100)
            local currentChance = 0
            for k, v in pairs(self.Items) do
                if ((self.Items[k] + currentChance) >= itemChance) then
                    local itemTable = nut.item.list[k]
					
					local char = ply:getChar()
					local inventory = char:getInv()
					
					ply:notify("You found a(n) " ..itemTable.name.. "!")
                    if(!inventory:add(itemTable.uniqueID, 1)) then
						local position = ply:getItemDropPos()
						nut.item.spawn(itemTable.uniqueID, position)
					end
					
                    self.availableItem = false
                    return
                else
                    currentChance = currentChance + self.Items[k]
                end
            end
        else
            ply:notify("You found nothing of value.")
        end
    end
end
