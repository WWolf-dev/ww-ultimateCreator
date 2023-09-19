if FrameworkUse == "ESX" then
    if versionESX == "older" then
        ESX = nil
        TriggerEvent(getSharedObjectEvent, function(obj) ESX = obj end)
    elseif versionESX == "newer" then
        FrameworkExport()
    end

    ESX.RegisterServerCallback('fetchPlayerDetails', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if xPlayer then
            local identifier = xPlayer.identifier
    
            MySQL.Async.fetchAll('SELECT firstname, lastname, `group` FROM users WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(results)
                if results[1] and results[1].firstname and results[1].lastname then
                    cb({
                        name = results[1].firstname .. ' ' .. results[1].lastname,
                        group = results[1].group
                    })
                else
                    cb(nil)
                end
            end)
        else
            cb(nil)
        end
    end)
    





































    -- Soon QBCore support
elseif FrameworkUse == "QBCore" then
    return nil
end