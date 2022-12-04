-- TODO: Get actual exhaust positions and rotations. This is based on bone
-- positions, but custom exhausts can have different positions or rotations.


function CreateVehicleExhaustBackfire(vehicle, scale)
  -- local exhaustNames = {
  --   "exhaust",    "exhaust_2",  "exhaust_3",  "exhaust_4",
  --   "exhaust_5",  "exhaust_6",  "exhaust_7",  "exhaust_8",
  --   "exhaust_9",  "exhaust_10", "exhaust_11", "exhaust_12",
  --   "exhaust_13", "exhaust_14", "exhaust_15", "exhaust_16"
  -- }
   -- TODO: Fix for all exhaust
   
   local scale = 1.0
   local count = 500
   local particleDict = "veh_xs_vehicle_mods"
   local particleCar = GetVehiclePedIsIn(playerPed, false)
   RequestNamedPtfxAsset(particleDict)
   while not HasNamedPtfxAssetLoaded(particleDict) do
       Citizen.Wait(0)
   end
   UseParticleFxAssetNextCall(particleDict)

   local particles = {}

   
  local exhausts = {
    "exhaust"
}

  for i=2, 30 do
    exhausts[#exhausts+1] = "exhaust_"..i
end

local pitch = GetEntityPitch(vehicle)
local carPos = GetEntityCoords(vehicle, false)
 for i,v in pairs(exhausts) do
    local bone = GetEntityBoneIndexByName(vehicle, v)
    if bone ~= -1 then
        local offset = GetWorldPositionOfEntityBone(vehicle, bone)
        UseParticleFxAsset(particleDict)
        particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_nitrous", vehicle, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
        -- particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_backfire", vehicle, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
        local boneIndex = GetEntityBoneIndexByName(vehicle, v)

            if boneIndex ~= -1 then
              local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
              local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
        
              -- UseParticleFxAssetNextCall('core')
              UseParticleFxAssetNextCall(particleDict)
        
              StartParticleFxNonLoopedOnEntity('veh_backfire', vehicle, off.x, off.y, off.z, 0.0, 0.0, 0.0, scale, false, false, false)
            end
                        end
end

Citizen.Wait(1000)

for i,v in pairs(exhausts) do
    local bone = GetEntityBoneIndexByName(vehicle, v)
    if bone ~= -1 then
        local offset = GetWorldPositionOfEntityBone(vehicle, bone)
        UseParticleFxAsset(particleDict)
        particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_nitrous", vehicle, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
        -- particles[#particles+1] = StartNetworkedParticleFxLoopedOnEntityBone("veh_backfire", vehicle, 0.0,0.0,0.0 , 0.0, pitch, 0.0, bone, 1.0, false, false, false)
        local boneIndex = GetEntityBoneIndexByName(vehicle, v)

        if boneIndex ~= -1 then
          local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
          local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
    
          -- UseParticleFxAssetNextCall('core')
          UseParticleFxAssetNextCall(particleDict)
    
          StartParticleFxNonLoopedOnEntity('veh_backfire', vehicle, off.x, off.y, off.z, 0.0, 0.0, 0.0, scale, false, false, false)
        end
      end
end

Citizen.SetTimeout(1 , function()
  removeParticles()
  -- endNos()
end)

 function removeParticles()
  Citizen.CreateThread(function()
      for i,v in pairs(particles) do
          RemoveParticleFx(v)
      end
      -- Citizen.Wait(2000)
      for i,v in pairs(particles) do
          RemoveParticleFx(v)
          particles[i] = nil
      end
  end)
end
--   for _, exhaustName in ipairs(exhaustNames) do
--     local boneIndex = GetEntityBoneIndexByName(vehicle, exhaustName)

--     -- if boneIndex ~= -1 then
--     --   local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
--     --   local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)

--     --   -- UseParticleFxAssetNextCall('core')
--     --   UseParticleFxAssetNextCall(particleDict)

--     --   StartParticleFxNonLoopedOnEntity('veh_backfire', vehicle, off.x, off.y, off.z, 0.0, 0.0, 0.0, scale, false, false, false)
    
--   end
end

function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
  UseParticleFxAssetNextCall('core')
  -- UseParticleFxAssetNextCall(particleDict)

  return StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, false, false, false)
end

function CreateVehicleLightTrail(vehicle, bone, scale)
  -- UseParticleFxAssetNextCall('core')
  UseParticleFxAssetNextCall(particleDict)


  local ptfx = StartParticleFxLoopedOnEntityBone('veh_light_red_trail', vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
  SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
  return ptfx
end


function StopVehicleLightTrail(ptfx, duration)
  Citizen.CreateThread(function()
    local startTime = GetGameTimer()
    local endTime = GetGameTimer() + duration
    while GetGameTimer() < endTime do 
      Citizen.Wait(0)
      local now = GetGameTimer()
      local scale = (endTime - now) / duration
      SetParticleFxLoopedScale(ptfx, scale)
      SetParticleFxLoopedAlpha(ptfx, scale)
    end
    StopParticleFxLooped(ptfx)

  end)

end

-- function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, density, r, g, b)
--   local boneIndex = GetEntityBoneIndexByName(vehicle, 'bonnet')
--   local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
--   local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
--
--   local xOffset = (xOffset or 0) + off.x
--   local yOffset = (yOffset or 0) + off.y
--   local zOffset = (zOffset or 0) + off.z
--
--   local xRot = xRot or 0
--   local yRot = yRot or 0
--   local zRot = zRot or 0
--
--   local scale = scale or 0.5
--   local density = density or 3
--
--   local r = (r or 255) / 255
--   local g = (g or 255) / 255
--   local b = (b or 255) / 255
--
--   local particles = {}
--
--   for i = 0, density do
--     UseParticleFxAssetNextCall('core')
--     local fx1 = StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, off.x - 0.5, off.y + 0.05, off.z, 40.0, -20.0, 0.0, 0.5, false, false, false)
--     SetParticleFxLoopedColour(fx1, r, g, b)
--
--     UseParticleFxAssetNextCall('core')
--     local fx2 = StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, off.x + 0.5, off.y + 0.05, off.z, 40.0, 20.0, 0.0, 0.5, false, false, false)
--     SetParticleFxLoopedColour(fx2, r, g, b)
--   end
-- end
