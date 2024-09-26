
RegisterNetEvent('myScript:spawnAllPeds', function()
    print("Server: Triggering ped spawn for all clients...")  
    TriggerClientEvent('myScript:spawnAllPeds', -1)
end)

RegisterCommand('spawnped', function(source)
    TriggerEvent('myScript:spawnPed')
end)
