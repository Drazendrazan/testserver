local iplStates = {}
-- local interiorCoords = {
--   { -470.07, 42.59, 52.42 },
-- }
-- { -468.12, 45.67, 46.24},


RegisterCommand(
    "gallery",
    function(source, args)

      local category = args[1]
      if category == "1" then
        local intIds = {}
        -- for k, v in pairs(iplStates) do
          -- local coords = i{ -468.12, 45.67, 46.24}
          local interiorId =  GetInteriorAtCoords( -468.12, 45.67, 46.24)
          -- intIds[interiorId] = true
          -- if v.state then
            ActivateInteriorEntitySet(interiorId, k)
          -- else
          --   DeactivateInteriorEntitySet(interiorId, k)
          -- end
        -- end
        for interiorId, v in pairs(intIds) do
          RefreshInterior(interiorId)
        end
      
      
      else if category == "2" then
        for k, v in pairs(iplStates) do
          -- local coords =   { -470.07, 42.59, 52.42 }
          local interiorId = v.interiorId or GetInteriorAtCoords(-470.07, 42.59, 52.42)
          intIds[interiorId] = true
          if v.state then
            ActivateInteriorEntitySet(interiorId, k)
          else
            DeactivateInteriorEntitySet(interiorId, k)
          end
        end
        for interiorId, v in pairs(intIds) do
          RefreshInterior(interiorId)
        end
      end
      end
    end)
        

-- local function updateIpls()
--   local intIds = {}
--   for k, v in pairs(iplStates) do
--     local coords =   { -470.07, 42.59, 52.42 }
--     local interiorId = v.interiorId or GetInteriorAtCoords(coords[1], coords[2], coords[3])
--     intIds[interiorId] = true
--     if v.state then
--       ActivateInteriorEntitySet(interiorId, k)
--     else
--       DeactivateInteriorEntitySet(interiorId, k)
--     end
--   end
--   for interiorId, v in pairs(intIds) do
--     RefreshInterior(interiorId)
--   end
-- end

-- RegisterNetEvent("np-galleria:iplStatesUpdate")
-- AddEventHandler("np-galleria:iplStatesUpdate", function(pStates)
--   iplStates = pStates
--   updateIpls()
-- end)

-- Citizen.CreateThread(function()
--   TriggerServerEvent("np-galleria:getIplsStates")
-- end)
