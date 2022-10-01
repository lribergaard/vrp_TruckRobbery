local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

local cooldownTimer = {}
TriggerEvent('vrp:getSharedObject', function(obj) vrp = obj end)

-- server side for cooldown timer
RegisterServerEvent("vrp_TruckRobbery:missionCooldown")
AddEventHandler("vrp_TruckRobbery:missionCooldown",function(source)
	table.insert(cooldownTimer,{CoolTimer = GetPlayerIdentifier(source), time = (Config.CooldownTimer * 60000)}) -- cooldown timer for doing missions
end)

-- server side function to accept the mission
RegisterServerEvent('vrp_TruckRobbery:missionAccepted')
AddEventHandler('vrp_TruckRobbery:missionAccepted', function()

-- thread for syncing the cooldown timer
Citizen.CreateThread(function() -- do not touch this thread function!
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(cooldownTimer) do
			if v.time <= 0 then
				RemoveCooldownTimer(v.CoolTimer)
			else
				v.time = v.time - 1000
			end
		end
	end
end)

-- sync mission data
RegisterServerEvent("vrp_TruckRobbery:syncMissionData")
AddEventHandler("vrp_TruckRobbery:syncMissionData",function(data)
	TriggerClientEvent("vrp_TruckRobbery:syncMissionData",-1,data)
end)

	if not CheckCooldownTimer(GetPlayerIdentifier(source)) then
		if accountMoney <= Config.MissionCost then
			TriggerClientEvent('vrp:showNotification', source, Config.NotEnoughMoney)
		else
			for i = 1, #Players do
				local xPlayer = VRP.GetPlayerFromId(Players[i])
				if xPlayer["job"]["name"] == Config.PoliceDatabaseName then
					policeOnline = policeOnline + 1
				end
			end
			if policeOnline >= Config.RequiredPoliceOnline then
				TriggerEvent("vrp_TruckRobbery:missionCooldown",source)
				TriggerClientEvent("vrp_TruckRobbery:HackingMiniGame",source)
			
				VRP.RegisterServerCallback("vrp_TruckRobbery:StartMissionNow",function(source,cb)
				local _source = source
				local xPlayer = VRP.GetPlayerFromId(_source)cb()
				TriggerClientEvent("vrp_TruckRobbery:startMission",source,0)
				end)
				xPlayer.removeAccountMoney('back',Config.MissionCost)
			else
				TriggerClientEvent('vrp:showNotification', source, Config.NotEnoughPolice)
			end
		end
	else
		TriggerClientEvent("vrp:showNotification",source,string.format(Config.CooldownMessage,GetCooldownTimer(GetPlayerIdentifier(source))))
	end
end)

-- mission reward
RegisterServerEvent('vrp_TruckRobbery:missionComplete')
AddEventHandler('vrp_TruckRobbery:missionComplete', function()
	local _source = source
	local xPlayer = vrp.GetPlayerFromId(_source)
	local reward = math.random(Config.MinReward,Config.MaxReward)
	
	if Config.RewardInDirtyMoney then
		xPlayer.addAccountMoney('dirty_money',tonumber(reward))
	else
		xPlayer.addMoney(reward)
	end	
	TriggerClientEvent('vrp:showNotification', source, string.format(Config.RewardMessage,reward))
	
	if Config.EnableItemReward == true then
		local itemAmount1 = math.random(Config.ItemMinAmount1,Config.ItemMaxAmount1)
		xPlayer.addInventoryItem(Config.ItemName1,itemAmount1)
		local item1 = VRP.GetItemLabel(Config.ItemName1)
		TriggerClientEvent('vrp:showNotification', source, string.format(Config.Item1Message,itemAmount1))
	end
	
	if Config.EnableRareItemReward == true then
		local chance = math.random(1,Config.RandomChance)
		local itemAmount2 = math.random(Config.ItemMinAmount2,Config.ItemMaxAmount2)
		if chance == 1 then
			xPlayer.addInventoryItem(Config.ItemName2,itemAmount2)
			local item2 = VRP.GetItemLabel(Config.ItemName2)
			TriggerClientEvent('vrp:showNotification', source, string.format(Config.Item2Message,itemAmount2))
		end	
	end
	
	Wait(1000)
end)

RegisterServerEvent('vrp_TruckRobbery:TruckRobberyInProgress')
AddEventHandler('vrp_TruckRobbery:TruckRobberyInProgress', function(targetCoords, streetName)
	TriggerClientEvent('vrp_TruckRobbery:outlawNotify', -1,string.format(Config.DispatchMessage,streetName))
	TriggerClientEvent('vrp_TruckRobbery:TruckRobberyInProgress', -1, targetCoords)
end)

-- DO NOT TOUCH!!
function RemoveCooldownTimer(source)
	for k,v in pairs(cooldownTimer) do
		if v.CoolTimer == source then
			table.remove(cooldownTimer,k)
		end
	end
end
-- DO NOT TOUCH!!
function GetCooldownTimer(source)
	for k,v in pairs(cooldownTimer) do
		if v.CoolTimer == source then
			return math.ceil(v.time/60000)
		end
	end
end
-- DO NOT TOUCH!!
function CheckCooldownTimer(source)
	for k,v in pairs(cooldownTimer) do
		if v.CoolTimer == source then
			return true
		end
	end
	return false
end
