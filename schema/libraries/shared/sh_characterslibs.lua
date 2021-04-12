function SCHEMA:CanDeleteChar(ply, char)
  if char:getMoney() < nut.config.get("defMoney", 0) then
    return true
  end
end
-------------------------------------------------------------------------------------------------------------------------
hook.Add("PlayerNoClip", "nsClippyClip", function(player, state)
    if (player:IsAdmin()) then
        if (state) then
            player:SetNoDraw(true)
        else
            player:SetNoDraw(false)
        end;

        return true
    else
        return false
    end;
end)
-------------------------------------------------------------------------------------------------------------------------
function SCHEMA:PlayerLoadedChar(client, character)
	if (character:getData("class", false)) then
		timer.Simple(1, function()
			local dat = character:getData("class", false)

			if (!isnumber(dat)) then
				for i, v in ipairs(nut.class.list) do
					if (v.uniqueID == dat) then
						character:setClass(i)
						break
					end;
				end;
			else
				character:setData("class", nil)
			end;
		end)
	end;
end;
-------------------------------------------------------------------------------------------------------------------------
nut.currency.set("", "Caps", "Bottlecaps")
-------------------------------------------------------------------------------------------------------------------------
function SCHEMA:ScalePlayerDamage(client, hitGroup, dmgInfo)
	dmgInfo:ScaleDamage(1)

	if (hitGroup == HITGROUP_HEAD) then
		dmgInfo:ScaleDamage(2)
	elseif (LIMB_GROUPS[hitGroup]) then
		dmgInfo:ScaleDamage(0.5)
	end
end