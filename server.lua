ESX.RegisterServerCallback("cdk-garage:server:checkJob", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    cb(job.name)
end)
