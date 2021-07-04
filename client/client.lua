local citizen = false

Citizen.CreateThread(function()
while true do
Citizen.Wait(1)
SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
end
end)

RegisterNetEvent('LRP-Armour:Client:SetEntityHealth')
AddEventHandler('LRP-Armour:Client:SetEntityHealth', function(health)
    Citizen.Wait(60000)  -- Give ESX time to load their stuff. Because some how ESX remove the armour when load the ped.
    SetEntityHealth(PlayerPedId(), tonumber(health))
    citizen = true
end)

local TimeFreshCurrentHealth = 30000  -- 60 seconds

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if citizen == true then
            TriggerServerEvent('LRP-Armour:Server:RefreshCurrentHealth', GetEntityHealth(PlayerPedId()))
            Citizen.Wait(TimeFreshCurrentHealth)
        end
    end
end)
