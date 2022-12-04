RegisterServerEvent('carwash:checkmoney')
AddEventHandler('carwash:checkmoney', function()
	local src = source
	-- local player = exports["np-base"]:getModule("Player"):GetUser(src)
	-- local costs = 0

	-- if player:getCash() >= costs then
		TriggerClientEvent("carwash:free", src)
	-- 	player:removeMoney(costs)
	-- else
	-- 	moneyleft = costs - player:getCash()
	-- 	TriggerClientEvent('notenoughmoney', src, moneyleft)
	-- end
end)
