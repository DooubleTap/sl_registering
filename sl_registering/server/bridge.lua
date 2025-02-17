if GetResourceState("es_extended") == "started" then
    local ESX = exports["es_extended"]:getSharedObject()

    ---@param source number|string
    ---@return string identifier
    function GetPlayerIdentifier(source)
        return ESX.GetPlayerFromId(source).getIdentifier()
    end

elseif GetResourceState("qb-core") == "started" then
    local QB = exports['qb-core']:GetCoreObject()

    ---@param source number|string
    ---@return string identifier
    function GetPlayerIdentifier(source)
        local qPlayer = QBCore.Functions.GetPlayer(tonumber(source))
        return Player.PlayerData.citizenid
    end

else --[[ Standalone, no Framework ]]

    ---@param source number|string
    ---@return string identifier
    function GetPlayerIdentifier(source)
        return GetPlayerIdentifierByType(source, license)
    end
end
