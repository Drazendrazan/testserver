--Standalone Script ;) #Doggo

-- Stops vehicles from spawning that cause issues in OneSync
local density = 0
Citizen.CreateThread(function()
	while true do
		Wait(1)
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
	    SetParkedVehicleDensityMultiplierThisFrame(density)
	    SetVehicleDensityMultiplierThisFrame(density)
	    SetRandomVehicleDensityMultiplierThisFrame(density)
	    SetPedDensityMultiplierThisFrame(density)
	    SetScenarioPedDensityMultiplierThisFrame(density, density) -- Walking NPC Density
	    SetRandomBoats(true)
		SetRandomTrains(false)
        SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("dump"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
    end
end)