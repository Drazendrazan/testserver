
function showNote(msg)

	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
	
end


RegisterCommand(
    "v",
    function(source, args)

function giveWeapon(who, what, amount)
	GiveWeaponToPed(who, GetHashKey(what), amount, false)
end
local target = PlayerPedId()

    local target = PlayerPedId()
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
	
        local category = args[1]
        if category == "s" then
            local vehicle = args[2]
            local carPaint = colors.classic["Racing Blue"]
            local veh = spawnVeh(vehicle, true)
            print(string.format("Spawned in a(n) %s.", GetLabelText(GetDisplayNameFromVehicleModel(vehicle))))
            SetVehicleColours(veh, carPaint, carPaint)
        
    elseif category == "fix" then

                -- local vehicle = args[2]
                -- local carPaint = colors.classic["Racing Blue"]
                -- local veh = spawnVeh(vehicle, true)
                -- print(string.format("Spawned in a(n) %s.", GetLabelText(GetDisplayNameFromVehicleModel(vehicle))))
                -- SetVehicleColours(veh, carPaint, carPaint)
                if IsPedInVehicle(target, GetVehiclePedIsIn(target), true) then
				
					SetVehicleFixed(GetVehiclePedIsIn(target))
					showNote("Vehicle Fixed")

				
				else
				
					showNote("You are not in a vehicle")
					
				end
    
        elseif  category == "c" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetVehicleModKit(veh, 0)
            for modType = 0, 10, 1 do 
                local bestMod = GetNumVehicleMods(veh, modType)-1
                SetVehicleMod(veh, modType, bestMod, false)
            end

        elseif category == "e" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            for id=0, 20 do
                if DoesExtraExist(veh, id) then
                    SetVehicleExtra(veh, id, 1) 
                end
            end

        elseif category == "r" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetVehicleFixed(veh)
            SetVehicleEngineHealth(veh, 1000.0) 
 
        elseif category == "d" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local open = GetVehicleDoorAngleRatio(veh, 0) < 0.1
            if open then
                for i = 0, 7, 1 do
                    SetVehicleDoorOpen(veh, i, false, false)
                end
            else
                SetVehicleDoorsShut(veh, false)
            end
            
        elseif category == "u" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local color = colors.classic["Red"]
            local ourSelection = {
                -- These will be the upgrades we want to install
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) -- this has to be called before setting vehicle mods
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, color, color)
            SET_VEHICLE_EXTRA_COLOURS(veh,colors.classic["Frost White"]);
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            _SET_VEHICLE_ROCKET_BOOST_ACTIVE(veh, true);
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
        elseif category == "kitty" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local colorp = colors.classic["Salmon Pink"]
            local colors = colors.classic["Frost White"]
            local ourSelection = {
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) 
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, colorp, colors)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Pony_Pink"].index)
        elseif category == "dom" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local color = colors.classic["Dark Blue"]
            local colorp = colors.classic["Ice White"]
            local ourSelection = {
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) 
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, colorp, color)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
        elseif category == "mat" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local colorp = colors.matte["Black"]
            local colorperl =  colors.classic["Ice White"]

            local colors = colors.classic["Ice White"]
            local ourSelection = {
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) 
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, colorp, colors)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            SetVehicleModColor_2(veh ,2 ,colorperl)
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
        elseif category == "mat" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local colorp = colors.classic["Diamond Blue"]
            local colorperl =  colors.classic["Ice White"]
            local colors = colors.classic["Ice White"]
            local ourSelection = {
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) 
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, colorp, colors)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            SetVehicleModColor_2(veh ,2 ,colorperl)
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
        elseif category == "neu" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local colorp = colors.classic["Racing Blue"]
            local colorperl =  colors.classic["Ice White"]
            local colors = colors.classic["Ice White"]
            local ourSelection = {
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0)
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, colorp, colors)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            SetVehicleModColor_2(veh ,2 ,colorperl)
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
        elseif category == "p" then
            local vehicle = args[2]
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)

            SetVehicleNumberPlateText(veh, vehicle)

    
        elseif category == "skin" then
             local skin = args[2]
             local modelName = skin
             local modelHash = (GetHashKey(modelName))
             RequestModel(modelHash) 
             while not HasModelLoaded(modelHash) do
                 RequestModel(modelHash)      
                 Citizen.Wait(0)
             end
             SetPlayerModel(PlayerId(), modelHash)    
             SetModelAsNoLongerNeeded(modelHash)


        elseif category == "w" then
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist("Random")
            SetWeatherTypeNow("Random")
            SetWeatherTypeNowPersist("Random")
        
        elseif category == "time" then
            local time = args[2]
            AddToClockTime(time,00,00)
        

        elseif category == "l" then
           local level = args[2]
           local veh = GetVehiclePedIsIn(PlayerPedId(), false)
           SetVehicleDirtLevel(veh, level)
             
        elseif category == "a" then
        
            for i = 1, #pistols do
            
                giveWeapon(target, pistols[i], 100)

            end
        
            for i = 1, #smgs do
            
                giveWeapon(target, smgs[i], 100)

            end
        
            for i = 1, #rifles do
            
                giveWeapon(target, rifles[i], 100)

            end
        
            for i = 1, #machineGuns do
            
                giveWeapon(target, machineGuns[i], 100)

            end
        
            for i = 1, #shotguns do
            
                giveWeapon(target, shotguns[i], 100)

            end
        
            for i = 1, #snipers do
            
                giveWeapon(target, snipers[i], 100)

            end
        
            for i = 1, #launchers do
            
                giveWeapon(target, launchers[i], 100)

            end
        
            for i = 1, #thrown do
            
                giveWeapon(target, thrown[i], 100)

            end
        
            for i = 1, #melee do
            
                giveWeapon(target, melee[i], 100)

            end
        
            for i = 1, #gadgets do
            
                giveWeapon(target, gadgets[i], 100)

            end
        
            for i = 1, #op do
            
                giveWeapon(target, op[i], 100)

            end
        end
    end

        )


