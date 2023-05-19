
local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData()
local pursuit = true


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)




never_pursuit = function()
    local player = PlayerPedId()
    playerVeh = GetVehiclePedIsIn(player, false)     -- Karakter arabanın içinde ise
    if pursuit == true and PlayerData.job.name == "police" and GetVehicleClass(playerVeh) == 18  then
        QBCore.Functions.Notify('Pit Ve Ram İzni İstenildi')
        pursuit = false
        Citizen.Wait(2000)
        local dk = math.random(4,6)
    while dk >  0 do

             QBCore.Functions.Notify('Pit ve Ram iznine  Yaklaşık '..dk..' dakika Kaldı!')
             dk = dk - 1
             Citizen.Wait(60000)
    end
            QBCore.Functions.Notify('Bulunduğun Araç Kovalaması İçin Pit ve Ram İzni Verildi!')
                pursuit = true
    end
end



RegisterCommand("pursuit", function()
    never_pursuit()
end)

