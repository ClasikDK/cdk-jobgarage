CreateThread(function()
    Wait(3000)
    if IsModelInCdimage(Config.PedModel) then
        RequestModel(Config.PedModel)
        while not HasModelLoaded(Config.PedModel) do
            Wait(10)
        end
        for k, v in pairs(Config.Garages) do
            local ground = v.garageCoords.z - 1.01
            local spawnPed = CreatePed(0, Config.PedModel, v.garageCoords.x, v.garageCoords.y, ground,
                v.garageCoords.w, true, true)
            FreezeEntityPosition(spawnPed, true)
            SetEntityInvincible(spawnPed, true)
            SetBlockingOfNonTemporaryEvents(spawnPed, true)
            SetEntityAsMissionEntity(spawnPed, true, true)
            local spawnPedId = NetworkGetNetworkIdFromEntity(spawnPed)
            SetModelAsNoLongerNeeded(Config.PedModel)

            exports.ox_target:addEntity(
                spawnPedId,
                {
                    label = "Job Garage",
                    onSelect = function()
                        TriggerEvent("cdk-garage:client:openGarage")
                    end,
                    groups = k,
                    icon = "fa fa-car",
                    distance = 3.0
                }
            )

            lib.registerContext({
                id = 'garage-' .. k,
                title = v.name,
                icon = v.icon,
                options = v.vehicles,
            });
        end
    end
end)

RegisterNetEvent("cdk-garage:client:openGarage", function()
    ESX.TriggerServerCallback("cdk-garage:server:checkJob", function(cb)
        lib.showContext("garage-" .. cb)
    end)
end)


RegisterNetEvent("cdk-garage:client:spawnVehicle")
AddEventHandler("jobgarage:spawnVehicle", function(data)
    local ped = PlayerPedId()
    local spawnCoords = Config.Garages[data.job].spawnCoords
    local vehicleId = data.model
    local vehicle = nil

    if Config.ProgressCircle then
        if lib.progressCircle({
                label = "Trækker køretøj ud..",
                duration = Config.Duration,
                useWhileDead = false,
                allowCuffed = false,
                canCancel = true,
            })
        then
            RequestModel(vehicleId)
            while not HasModelLoaded(vehicleId) do
                Wait(10)
            end
            vehicle = CreateVehicle(vehicleId, spawnCoords, true, false)

            lib.notify({
                type = 'success',
                title = 'Køretøj trukket ud',
            })
        else
            lib.notify({
                type = 'error',
                title = 'Annulleret handling',
            })
        end
    else
        RequestModel(vehicleId)
        while not HasModelLoaded(vehicleId) do
            Wait(10)
        end
        vehicle = CreateVehicle(vehicleId, spawnCoords, true, false)
    end

    if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
        if Config.SetInVehicle then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
        SetVehicleOnGroundProperly(vehicle)
        if Config.UseCustomNumberPlate then
            SetVehicleNumberPlateText(vehicle, tostring(Config.Garages[data.job].plate))
        end
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleDirtLevel(vehicle, 0)

        if Config.CustomKeyScirpt then
            TriggerEvent("cdk-keys:client:spawnKeys", GetVehicleNumberPlateText(vehicle))
        end

        for i = 1, 12 do
            if data.extras[tostring(i)] then
                SetVehicleExtra(vehicle, i, false)
            else
                SetVehicleExtra(vehicle, i, true)
            end
        end

        if Config.Locked then
            SetVehicleDoorsLocked(vehicle, 2)
        else
            SetVehicleDoorsLocked(vehicle, 1)
        end
        SetModelAsNoLongerNeeded(vehicle)
    else
        Wait(10)
    end
end)
