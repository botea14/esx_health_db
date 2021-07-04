ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    MySQL.Async.fetchScalar("SELECT health FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier()
        }, function(data)
        if (data ~= nil) then
            TriggerClientEvent('LRP-Armour:Client:SetEntityHealth', playerId, data)
        end
    end)
end)

RegisterServerEvent('LRP-Armour:Server:RefreshCurrentHealth')
AddEventHandler('LRP-Armour:Server:RefreshCurrentHealth', function(updateHealth)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute("UPDATE users SET health = @health WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier(),
        ['@health'] = tonumber(updateHealth)
    })
end)

