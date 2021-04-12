local ranks = {
	["moderator"] = true,
	["operator"] = true,
	["owner"] = true,
	["admin"] = true,
	["superadmin"] = true,
	["user"] = true,
	["founder"] = true,
}
hook.Add("PrePACConfigApply", "PACRankRestrict", function(ply)
	if not ranks[ply:GetUserGroup()] then
              return false,"Insufficient rank to use PAC."
        end
end)
