if FrameworkUse == "ESX" then     --𝔽ℝ𝔸𝕄𝔼𝕎𝕆ℝ𝕂 𝕋𝕐ℙ𝔼
    -- Check the ESX Version to work with the script
    if versionESX == "older" then -- Activate the old way of ESX to work with the script
        ESX = nil
        CreateThread(function()
            while ESX == nil do
                TriggerEvent(getSharedObjectEvent, function(obj) ESX = obj end)
                Wait(0)
            end
        end)
    elseif versionESX == "newer" then -- Activate the new way of ESX to work with the script
        FrameworkExport()             --Function wh-ere the export of ESX is stored
    end


    -- Event when a player is loaded
    RegisterNetEvent(playerLoadedEvent)
    AddEventHandler(playerLoadedEvent, function(xPlayer)
        ESX.PlayerData = xPlayer
        PlayerLoaded = true
    end)

        	-- Event when a player is setjob
	RegisterNetEvent(setJobEvent)
	AddEventHandler(setJobEvent, function(job)
		ESX.PlayerData.job = job
	end)

    RegisterCommand("creator", function()
        ESX.TriggerServerCallback('fetchPlayerDetails', function(details)
            if details then
                if details.group == 'admin' or details.group == 'mod' then
                    -- Send name and group to the NUI
                    SendNUIMessage({
                        type = "creator",
                        status = true,
                        playerName = details.name,
                        playerGroup = details.group
                    })

                    SetNuiFocus(true, true)
                else
                    print('You do not have the required permissions to use this command!')
                end
            else
                print('Error fetching player details.')
            end
        end)
    end)

    RegisterNUICallback('closeInterface', function()
        SetNuiFocus(false, false) -- désactive l'interface utilisateur
    end)

    RegisterNuiCallback('goIntoBlipBuilder', function()
        SetNuiFocus(false, false) -- désactive l'interface utilisateur
        exports["ww-blipsbuilder"]:BlipsCreatorMenu()
    end)

        -- Soon QBCore support
elseif FrameworkUse == "QBCore" then
    return nil
end