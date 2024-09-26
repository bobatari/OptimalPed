
RegisterNetEvent('myScript:spawnAllPeds', function()
    TriggerClientEvent('myScript:spawnAllPeds', -1)
end)

RegisterCommand('spawnped', function(source)
    TriggerEvent('myScript:spawnPed')
end)
