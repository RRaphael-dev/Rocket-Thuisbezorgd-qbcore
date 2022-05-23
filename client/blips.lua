QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}



RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  PlayerJob = QBCore.Functions.GetPlayerData().job
  if PlayerJob.name == "thuisbezorgd" then
    blipcrap = AddBlipForCoord(Rocket.Start.x, Rocket.Start.y, Rocket.Start.z)
    SetBlipSprite (blipcrap, 478)
    SetBlipDisplay(blipcrap, 4)
    SetBlipScale  (blipcrap, 0.8)
    SetBlipColour (blipcrap, 83)
    SetBlipAsShortRange(blipcrap, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('ThuisBezorgd')
    EndTextCommandSetBlipName(blipcrap)
  end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerJob = JobInfo
  if PlayerJob.name == "thuisbezorgd" then
    blipcrap = AddBlipForCoord(Rocket.Start.x, Rocket.Start.y, Rocket.Start.z)
    SetBlipSprite (blipcrap, 478)
    SetBlipDisplay(blipcrap, 4)
    SetBlipScale  (blipcrap, 0.8)
    SetBlipColour (blipcrap, 83)
    SetBlipAsShortRange(blipcrap, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('ThuisBezorgd')
    EndTextCommandSetBlipName(blipcrap)
  end
end)

CreateJobBlip = function()
    RemoveBlip(currentBlip)
    print(Rocket.Loc[huidigehuis].x,Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z)
    if Rocket.Loc[huidigehuis] ~= nil then
        if DoesBlipExist(currentBlip) then
            RemoveBlip(currentBlip)
        end
        currentBlip = AddBlipForCoord(Rocket.Loc[huidigehuis].x,Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z)

        SetBlipSprite (currentBlip, 280)
        SetBlipDisplay(currentBlip, 4)
        SetBlipScale  (currentBlip, 0.8)
        SetBlipAsShortRange(currentBlip, true)
        SetBlipColour(currentBlip, 1)
    
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Thuisbezorgd Werk')
        EndTextCommandSetBlipName(currentBlip)
        SetBlipRoute(currentBlip, true)
        print(currentBlip)
    else
        Citizen.Wait(1000)
        end
end