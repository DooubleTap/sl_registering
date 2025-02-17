local QBCore = exports['qb-core']:GetCoreObject()

local weaponCheckHook = exports.ox_inventory:registerHook('buyItem', function(payload)
    if payload then
        if payload.metadata.serial then
            local Player = QBCore.Functions.GetPlayer(payload.source)
            if Player then
                local citizenid = Player.PlayerData.citizenid
                --print("got serial")
                local data = {
                    owner = citizenid,
                    weaponName = payload.itemName,
                }
                --print("weapon_name : " .. data.weaponName)
                local serialNumber = payload.metadata.serial
                exports["lb-tablet"]:RegisterWeapon(serialNumber, data)
            end
        end
    end
    return true
end, {
    print = false,
})
