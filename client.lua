local QBCore = exports['qb-core']:GetCoreObject()

local function changePlayerModel(pedModel)
    local modelHash = GetHashKey(pedModel)

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(100)
    end

    SetPlayerModel(PlayerId(), modelHash)
    
    SetPedDefaultComponentVariation(PlayerPedId())

    SetModelAsNoLongerNeeded(modelHash)

    QBCore.Functions.Notify("You have changed to the new ped model!", "success")
end

local function spawnPed(pedModel, coords, heading)

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(1)
    end

    if not HasModelLoaded(pedModel) then
        return nil
    end

    local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z, heading, false, true)

    if DoesEntityExist(ped) then
    else
        return nil
    end

    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)

    return ped
end


local function addPedInteraction(ped, pedModel)
    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'ped_interaction',
            icon = 'fas fa-user',
            label = "Become this Ped",
            onSelect = function()
                changePlayerModel(pedModel)
            end,
            distance = 2.5
        }
    })
end

local function spawnAllPeds()
    for _, pedData in ipairs(Config.Peds) do
        local ped = spawnPed(pedData.model, pedData.location, pedData.heading)
        if ped then
            addPedInteraction(ped, pedData.model)
        else
        end
    end
end


RegisterNetEvent('myScript:spawnAllPeds', function()
    spawnAllPeds()
end)


RegisterCommand("spawnpeds", function()
    TriggerServerEvent('myScript:spawnAllPeds')
end)
