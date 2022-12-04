function UnloadBodyguard()
	for k, guard in pairs(Bodyguard.Guards) do
		if(guard ~= nil) then
            DeletePed(guard)
			Bodyguard.Guards[k] = nil
		end
	end
end

function giveWeapon(who, what, amount)

	GiveWeaponToPed(who, GetHashKey(what), amount, false)
	
end
Citizen.CreateThread(function()
    
	 local pistols = {"WEAPON_APPISTOL","WEAPON_COMBATPISTOL","WEAPON_FLAREGUN","WEAPON_HEAVYPISTOL","WEAPON_MARKSMANPISTOL","WEAPON_PISTOL","WEAPON_PISTOL50","WEAPON_REVOLVER","WEAPON_SNSPISTOL","WEAPON_STUNGUN","WEAPON_VINTAGEPISTOL"}
	 local smgs = {"WEAPON_ASSAULTSMG","WEAPON_COMBATPDW","WEAPON_MACHINEPISTOL","WEAPON_MICROSMG","WEAPON_MINISMG","WEAPON_SMG"}
	 local rifles = {"WEAPON_ADVANCEDRIFLE","WEAPON_ASSAULTRIFLE","WEAPON_BULLPUPRIFLE","WEAPON_CARBINERIFLE","WEAPON_COMPACTRIFLE","WEAPON_MUSKET","WEAPON_SPECIALCARBINE"}
	 local machineGuns = {"WEAPON_COMBATMG","WEAPON_GUSENBERG","WEAPON_MG"}
	 local shotguns = {"WEAPON_ASSAULTSHOTGUN","WEAPON_AUTOSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_HEAVYSHOTGUN","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN"}
	 local snipers = {"WEAPON_HEAVYSNIPER","WEAPON_MARKSMANRIFLE","WEAPON_SNIPERRIFLE"}
	 local launchers = {"WEAPON_COMPACTLAUNCHER","WEAPON_FIREWORK","WEAPON_GRENADELAUNCHER","WEAPON_HOMINGLAUNCHER","WEAPON_RPG"}
	 local thrown = {"WEAPON_BALL","WEAPON_BZGAS","WEAPON_FLARE","WEAPON_GRENADE","WEAPON_MOLOTOV","WEAPON_PIPEBOMB","WEAPON_PROXMINE","WEAPON_SMOKEGRENADE","WEAPON_SNOWBALL","WEAPON_STICKYBOMB"}
	 local melee = {"WEAPON_BAT","WEAPON_BATTLEAXE","WEAPON_BOTTLE","WEAPON_CROWBAR","WEAPON_DAGGER","WEAPON_FIREEXTINGUISHER","WEAPON_GOLFCLUB","WEAPON_HAMMER","WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_PETROLCAN","WEAPON_POOLCUE","WEAPON_SWITCHBLADE","WEAPON_WRENCH"}
	 local gadgets = {"GADGET_PARACHUTE", "GADGET_NIGHTVISION"}
	 local op = {"WEAPON_MINIGUN", "WEAPON_RAILGUN"}
    
    while true do
        if IsControlJustPressed(0, Bodyguard.SpawnKey) then
            local BodyGuardSkinID = GetHashKey(Bodyguard.GuardSkin)
		    local playerPed = PlayerPedId()
            
		    local player = GetPlayerPed(playerPed)
		    local playerPosition = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
		    local playerGroup = GetPedGroupIndex(playerPed)

            RemoveGroup(playerGroup)
		    local playerGroup = GetPedGroupIndex(playerPed)
            
            if Bodyguard.SpawnMultiple == false then
                UnloadBodyguard()
            end
                Citizen.Wait(10)
                RequestModel(BodyGuardSkinID)

            while(not HasModelLoaded(BodyGuardSkinID)) do
                Citizen.Wait(10)
            end
                  
            SetPlayerModel(PlayerId(), BodyGuardSkinID)    

            for i = 0, Bodyguard.GuardAmount, 1 do
                Bodyguard.Guards[i] = CreatePed(26, BodyGuardSkinID, playerPosition.x, playerPosition.y, playerPosition.z, 1, false, true)	
                SetPedCanSwitchWeapon(Bodyguard.Guards[i],false)
                GetGroupSize(playerGroup)
                SetPedAsGroupMember(Bodyguard.Guards[i], playerGroup)
                if Bodyguard.SetInvincible == true then
                    SetEntityInvincible(Bodyguard.Guards[i], true)
                else
                    SetEntityInvincible(Bodyguard.Guards[i], false)
                end
                if Bodyguard.GiveWeapon == true then
                    for j = 1, #pistols do
				
                        giveWeapon(Bodyguard.Guards[i], pistols[j], 100)
                        giveWeapon(PlayerPedId(), pistols[j], 100)
                        
                    end
                    
                    for j = 1, #smgs do
                    
                        giveWeapon(Bodyguard.Guards[i],  smgs[j], 100)
                        giveWeapon(PlayerPedId(),  smgs[j], 100)
                        
                    end
                    
                    for j = 1, #rifles do
                    
                        giveWeapon(Bodyguard.Guards[i], rifles[j], 100)
                        giveWeapon(PlayerPedId(), rifles[j], 100)
                        
                    end
                    
                    for j = 1, #machineGuns do
                    
                        giveWeapon(Bodyguard.Guards[i], machineGuns[j], 100)
                        giveWeapon(PlayerPedId(), machineGuns[j], 100)
                        
                    end
                    
                    for j = 1, #shotguns do
                    
                        giveWeapon(Bodyguard.Guards[i], shotguns[j], 100)
                        giveWeapon(PlayerPedId(), shotguns[j], 100)
                        
                    end
                    
                    for j = 1, #snipers do
                    
                        giveWeapon(Bodyguard.Guards[i], snipers[j], 100)
                        giveWeapon(PlayerPedId(), snipers[j], 100)
                        
                    end
                    
                    for j = 1, #launchers do
                    
                        giveWeapon(Bodyguard.Guards[i], launchers[j], 100)
                        giveWeapon(PlayerPedId(), launchers[j], 100)
                        
                    end
                    
                    for j = 1, #thrown do
                    
                        giveWeapon(Bodyguard.Guards[i], thrown[j], 100)
                        giveWeapon(PlayerPedId(), thrown[j], 100)
                        
                    end
                    
                    for j = 1, #melee do
                    
                        giveWeapon(Bodyguard.Guards[i], melee[j], 100)
                        giveWeapon(PlayerPedId(), melee[j], 100)
                        
                    end
                    
                    for j = 1, #gadgets do
                    
                        giveWeapon(Bodyguard.Guards[i], gadgets[j], 100)
                        giveWeapon(PlayerPedId(), gadgets[j], 100)
                        
                    end
                    
                    for j = 1, #op do
                    
                        giveWeapon(Bodyguard.Guards[i], op[j], 100)
                        giveWeapon(PlayerPedId(), op[j], 100)
                        
                    end
                    
                        --         giveWeapon(Bodyguard.Guards[i], Bodyguard.SHOTGUN, 100)
                        -- giveWeapon(Bodyguard.Guards[i], Bodyguard.GuardWeapon, 100)
                        -- giveWeapon(Bodyguard.Guards[i], Bodyguard.secondaryWeapon, 100)

                end
                SetPedCanTeleportToGroupLeader(
                    Bodyguard.Guards[i] --[[ Ped ]], 
                playerGroup --[[ integer ]], 
                true --[[ boolean ]]
            )                    SetEntityInvincible(PlayerPedId(), true)

            
            end
            SetEntityInvincible(PlayerPedId(), true)

            SetModelAsNoLongerNeeded(BodyGuardSkinID)
        end
        Citizen.Wait(0)
    end
end)