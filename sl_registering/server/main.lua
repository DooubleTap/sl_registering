local weaponCheckHook = exports.ox_inventory:registerHook('buyItem', function(payload)
    if payload then
        if payload.metadata.serial then
            local identifier = GetPlayerIdentifier(payload.source)
            if identifier then

                local data = {
                    owner = identifier,
                    weaponName = payload.itemName,
                }

                local serialNumber = payload.metadata.serial

                exports["lb-tablet"]:RegisterWeapon(serialNumber, data)
            end
        end
    end
    return true
end, {
    print = false,
})
