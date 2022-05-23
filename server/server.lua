QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('rocket-Thuisbezorgd:server:pankie')
AddEventHandler('rocket-Thuisbezorgd:server:pankie', function(anticheat)
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
      if anticheat == 45245657554684542516546745469849786463 then
         Player.Functions.AddMoney('cash', Rocket.PrijsPerLevering, "Thuisbezorgd Levering")
         TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Je hebt €' .. Rocket.PrijsPerLevering ..' gekregen!'})
      else
         DropPlayer(src, 'Nice Try Bitch xx Rocket Scripts')
      end
end)
