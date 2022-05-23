local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
EncoreHelper = {}
Rocket = {}
QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

local bezig = false
huidigehuis = 1





Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
            local pos = GetEntityCoords(PlayerPedId())
            local coords = vector3(Rocket.Start.x, Rocket.Start.y, Rocket.Start.z)
            local dis = GetDistanceBetweenCoords(pos, coords)
            if PlayerJob.name == "thuisbezorgd" then
                if dis < 8 then
                    if dis >= 1 then
                        DrawText3Ds(Rocket.Start.x, Rocket.Start.y, Rocket.Start.z, 'Thuisbezorgd Computer')
                        DrawMarker(20, coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 136, 38, 25, 100, false, true, 2, true, false, false, false)
                    elseif dis < 1 then
                        DrawText3Ds(Rocket.Start.x, Rocket.Start.y, Rocket.Start.z, Rocket.DrawTextKleur ..'E~w~ · Open Computer')
                        DrawMarker(20, coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 136, 38, 25, 100, false, true, 2, true, false, false, false)
                    if IsControlJustPressed(0, 38) then
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            action = "open",
                        })
                    end
                end    
            end
        end
    end
end)


RegisterNUICallback("close", function(data)
    SetNuiFocus(false,false)
end)

RegisterNUICallback("run", function(data)
    local voed = data.soort
    local hoeveel = data.aantal
    SetNuiFocus(false,false)
    BeginRun(voed, hoeveel)
        exports['mythic_notify']:SendAlert('success', "Je kan nu beginnen met het leveren van " .. voed)
        SpawnAuto()
        CreateJobBlip()
        bezig = true
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        if bezig and not autoweggezet then
        local pos = GetEntityCoords(PlayerPedId())
        local takeDist = GetDistanceBetweenCoords(pos, Rocket.VoertuigVerwijder.x, Rocket.VoertuigVerwijder.y, Rocket.VoertuigVerwijder.z)
        if takeDist <= 11 then
                DrawMarker(2, Rocket.VoertuigVerwijder.x, Rocket.VoertuigVerwijder.y, Rocket.VoertuigVerwijder.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, Rocket.Marker.r, Rocket.Marker.g, Rocket.Marker.b, 100, false, true, 2, true, false, false, false)
            else
                Citizen.Wait(1000)
                end
            if takeDist <= 2 and IsPedInVehicle(PlayerPedId(), kankerautoneef, false) then
                DrawText3Ds(Rocket.VoertuigVerwijder.x, Rocket.VoertuigVerwijder.y, Rocket.VoertuigVerwijder.z, Rocket.DrawTextKleur ..'E~w~ - Auto Verwijderen!')
            if IsControlJustPressed(0, 38) then
                QBCore.Functions.DeleteVehicle(kankerautoneef)
                autoweggezet = true
                end
            end
        else
            Citizen.Wait(1000)
        end
    end     
end)

RegisterCommand('endbezorgerrun', function(source, args, RawCommand)
    if bezig then
        bezig = false
        huidigehuis = 1
        RemoveBlip(currentBlip)
        else
            exports['mythic_notify']:DoHudText('error', 'Je bent niet bezig!')
        end
end)

BeginRun = function(niga1, niga2)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if huidigehuis ~= tonumber(niga2) + 1 then
                    local coords = GetEntityCoords(PlayerPedId())
                    local dist = GetDistanceBetweenCoords(coords, Rocket.Loc[huidigehuis].x, Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z)
                    if dist < 11 then
                        DrawMarker(2, Rocket.Loc[huidigehuis].x,Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, Rocket.Marker.r, Rocket.Marker.g, Rocket.Marker.b, 100, false, true, 2, true, false, false, false)
                    if dist < 3 then 
                        DrawText3Ds(Rocket.Loc[huidigehuis].x,Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z, Rocket.DrawTextKleur ..'E~w~ - '.. niga1 .. ' leveren!')
                        DrawMarker(2, Rocket.Loc[huidigehuis].x,Rocket.Loc[huidigehuis].y, Rocket.Loc[huidigehuis].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, Rocket.Marker.r, Rocket.Marker.g, Rocket.Marker.b, 100, false, true, 2, true, false, false, false)
                            if IsControlJustReleased(0, Keys["E"]) then
                                Progressbar("leve", niga1.. " Afleveren..", 10000, false, true, {
                                    disableMovement = true,
                                    disableControls = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                animDict = "anim@heists@keycard@",
                                anim = "exit",
                                flags = 48,
                            }, {}, {}, function() 
                                    huidigehuis = huidigehuis + 1
                                    ClearPedTasks(PlayerPedId())
                                    CreateJobBlip()
                                    local kanker = 45245657554684542516546745469849786463
                                    TriggerServerEvent("rocket-Thuisbezorgd:server:pankie", kanker)
                                end, function() 
                                    
                                end)
                            end
                        end
                    end
                else
                    exports['mythic_notify']:SendAlert('success', "Je job is gedaan, je kan je auto gaan wegzetten!")
                    break
                end
            end
        end)
end

SpawnAuto = function()
  local Coordinates = vector3(Rocket.SpawnAuto.x, Rocket.SpawnAuto.y, Rocket.SpawnAuto.z)
  local TruckModel = Rocket.AutoNaam
  local  Heading     = Rocket.SpawnAuto.h
  local playerPed = PlayerPedId()
    QBCore.Functions.SpawnVehicle(TruckModel, function(veh)
        SetVehicleNumberPlateText(veh, "ThuisB"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, Rocket.SpawnAuto.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        SetVehicleLivery(veh, 4)
        SetVehicleColours(veh, 1, 1)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        kankerautoneef = veh
    end, Coordinates, true)
end



function close()
    Menu.hidden = true
end

Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish ~= nil then
                onFinish()
            end
        else
            if onCancel ~= nil then
                onCancel()
            end
        end
    end)
end

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end