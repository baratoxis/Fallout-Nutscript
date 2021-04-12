PLUGIN.name = "Gangs"
PLUGIN.author = "Barata"
PLUGIN.desc = "Allows to create and join gangs in-game without needing the permission of an admin."

nut.command.add("creategang", {
	adminOnly = false,
	syntax = "",
	onRun = function(client, arguments)
		local character = client:getChar()
        local characterName = character:getName()
        local group = character:getData("CharacterGroup", nil)
        if(group == nil) then
            character:setData("CharacterGroup", characterName)
            character:save()
            client:notify("You have successfully created a gang.")
        else
            return "You are already in ".. group .."'s gang!"
        end
	end
})

nut.command.add("invitetomygang", {
	adminOnly = false,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if (!arguments[1]) then
			return L("invalidArg", client, 1)
		end
        local character = client:getChar()
        local characterName = character:getName()
        local group = character:getData("CharacterGroup", nil)
        if(group == nil) then
            return "You are not in a gang!"
        elseif(group != characterName) then
            return "You are not the leader of the gang!"
        end
        local invitedPlayer = nut.command.findPlayer(client, arguments[1])
        if(IsValid(invitedPlayer)) then
            local invitedPlayerCharacter = invitedPlayer:getChar()
            local invitedPlayerCharacterName = invitedPlayerCharacter:getName()
            local invitedPlayerGroup = invitedPlayerCharacter:getData("CharacterGroup", nil)
            local acceptsGroupInvitations = invitedPlayerCharacter:getData("AcceptsGroupInvitations", false)
            if(invitedPlayerGroup == nil)  then
                if(acceptsGroupInvitations == true) then
                    invitedPlayerCharacter:setData("CharacterGroup", group)
                    invitedPlayerCharacter:save()
                    client:notify(invitedPlayerCharacterName .. " has successfully joined your gang.")
                    invitedPlayer:notify("You has successfully joined ".. group .."'s gang.")
                else
                    return "The invited player isn't accepting gang invitations! He must use /acceptganginvitations."
                end
            else
                return "The invited player is already in a gang!"
            end
        end
	end
})

nut.command.add("acceptganginvitations", {
	adminOnly = false,
	syntax = "",
	onRun = function(client, arguments)
        local character = client:getChar()
        local group = character:getData("CharacterGroup", nil)
        if(group == nil) then
            character:setData("AcceptsGroupInvitations", true)
            character:save()
            client:notify("You are now accepting gang invitations.")
            timer.Simple(15, function()
                character:setData("AcceptsGroupInvitations", false)
                character:save()
                client:notify("You are now rejecting gang invitations.")
            end)
        else
            return "You are already in ".. group .."'s gang!"
        end
	end
})

nut.command.add("leavegang", {
	adminOnly = false,
	syntax = "",
	onRun = function(client, arguments)
        local character = client:getChar()
        local group = character:getData("CharacterGroup", nil)
        if(group ~= nil) then
            character:setData("CharacterGroup", nil)
            character:save()
            client:notify("You have left ".. group .."'s gang.")
        else
            return "You aren't in any gang!"
        end
	end
})

nut.command.add("removefromgang", {
	adminOnly = false,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if (!arguments[1]) then
			return L("invalidArg", client, 1)
		end
        local removedPlayer = nut.command.findPlayer(client, arguments[1])
        if(IsValid(removedPlayer)) then
            local removedPlayerCharacter = removedPlayer:getChar()
            local removedPlayerCharacterName = removedPlayerCharacter:getName()
            local removedPlayerGroup = removedPlayerCharacter:getData("CharacterGroup", nil)
            local character = client:getChar()
            local characterName = character:getName()
            local group = character:getData("CharacterGroup", nil)
            if(client:IsAdmin() == false) then
                if(group == nil) then
                    return "You are not in a gang!"
                elseif(characterName != removedPlayerGroup) then
                    return "You are not the leader of his gang!"
                end
            end
            removedPlayerCharacter:setData("CharacterGroup", nil)
            removedPlayerCharacter:save()
            removedPlayer:notify("You have been removed from ".. group .."'s gang.")
            character:notify("You have successfully removed ".. removedPlayerCharacterName .. " from ".. group .."'s gang.")
        end
	end
})
