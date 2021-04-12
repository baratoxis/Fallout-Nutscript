local function joinMessage(client)
	for k, v in pairs(player.GetHumans()) do
			v:ChatPrint("'Player "..client:Name().." has joined the server.'")
		end
	end
	
hook.Add("PlayerInitialSpawn", "join message", joinMessage)
local function leaveMessage(client)
	for k, v in pairs(player.GetHumans()) do
			v:ChatPrint("'Player "..client:Name().." has left the server.'")
		end
	end	
hook.Add("PlayerDisconnected", "leave message", leaveMessage)