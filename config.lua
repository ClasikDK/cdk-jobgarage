Config = {

    CustomKeyScirpt = true,        -- Set up to CDK-Keys script
    SetInVehicle = false,          -- Set the player in the vehicle after pulling it out
    Locked = false,                -- Lock the vehicle after pulling it out
    ProgressCircle = true,         -- Use progress circle while pulling out the vehicle
    Duration = 3000,               -- How long it takes to pull out the vehicle in ms ( only if "ProgressCircle" is true )
    PedModel = "mp_m_waremech_01", -- Ped model to that will spawn when pulling out the vehicle
    UseCustomNumberPlate = true,   -- Use custom number plate defined under vehicles

    Garages = {
        ["ambulance"] = {                                                           -- Job name
            name = "EMS Garage",                                                    -- Garage name
            garageCoords = vector4(323.314301, -557.960449, 28.740601, 340.157471), -- Garage coords
            spawnCoords = vector4(316.008789, -553.661560, 28.740601, 269.291351),  -- Spawn coords
            plate = "ems",                                                          -- Vehicle NumberPlate
            vehicles = {                                                            -- Vehicles
                {
                    title = "Ambulance",                                            -- Vehicle Name
                    icon = "truck-medical",                                         -- Icon
                    args = {
                        model = "ambulance",                                        -- Vehicle model
                        extras = {
                            ['1'] = false,
                            ['2'] = false,
                            ['3'] = false,
                            ['4'] = false,
                            ['5'] = false,
                            ['6'] = false,
                            ['7'] = false,
                            ['8'] = false,
                            ['9'] = false,
                            ['10'] = false,
                            ['11'] = false,
                            ['12'] = false,
                        },
                        job = "ambulance" -- Job type's
                    },
                    event = "jobgarage:spawnVehicle"
                },
            }
        },
        ["police"] = {
            name = "Police Garage",
            garageCoords = vector4(424.523071, -1016.584595, 29.027100, 226.771667),
            spawnCoords = vector4(430.1531, -1021.3553, 28.8494, 309.4456),
            plate = "pol",
            vehicles = {
                {
                    title = "Police Car",
                    icon = "car-side",
                    args = {
                        model = "police",
                        extras = {
                            ['1'] = false,
                            ['2'] = false,
                            ['3'] = false,
                            ['4'] = false,
                            ['5'] = false,
                            ['6'] = false,
                            ['7'] = false,
                            ['8'] = false,
                            ['9'] = false,
                            ['10'] = false,
                            ['11'] = false,
                            ['12'] = false,
                        },
                        job = "police"
                    },
                    event = "jobgarage:spawnVehicle"
                },
                {
                    title = "Police Bike",
                    icon = "motorcycle",
                    args = {
                        model = "policeb",
                        extras = {
                            ['1'] = false,
                            ['2'] = false,
                            ['3'] = false,
                            ['4'] = false,
                            ['5'] = false,
                            ['6'] = false,
                            ['7'] = false,
                            ['8'] = false,
                            ['9'] = false,
                            ['10'] = false,
                            ['11'] = false,
                            ['12'] = false,
                        },
                        job = "police"
                    },
                    event = "jobgarage:spawnVehicle"
                },
            }
        },
        ["mechanic"] = {
            name = "Mechanic Garage",
            garageCoords = vector4(326.320892, -558.738464, 28.740601, 342.992126),
            spawnCoords = vector4(329.512085, -541.200012, 28.740601, 184.251968),
            plate = "mec",
            icon = "fa fa-car",
            vehicles = {
                {
                    title = "Flatbed",
                    arrow = true,
                    args = {
                        model = "flatbed",
                        extras = {
                            ['1'] = false,
                            ['2'] = false,
                            ['3'] = false,
                            ['4'] = false,
                            ['5'] = false,
                            ['6'] = false,
                            ['7'] = false,
                            ['8'] = false,
                            ['9'] = false,
                            ['10'] = false,
                            ['11'] = false,
                            ['12'] = false,
                        },
                        job = "mechanic"
                    },
                    event = "jobgarage:spawnVehicle"
                },
            }
        },
    },
}
