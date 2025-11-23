local treeObj = nil
local treeBlip = nil

CreateThread(function()
    -- Spawn de l’arbre
    local model = Config.TreeProp
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    treeObj = CreateObject(model, Config.TreeCoords.x, Config.TreeCoords.y, Config.TreeCoords.z - 1.0, false, false, false)
    SetEntityHeading(treeObj, Config.TreeHeading)
    FreezeEntityPosition(treeObj, true)

    -- ox_target
    exports.ox_target:addLocalEntity(treeObj, {
        {
            label = Config.TargetLabel,
            icon = 'fa-solid fa-gift',
            distance = 2.0,
            serverEvent = 'TRAP_christmastree:claimGift',
        }
    })

    -- Blip
    if Config.EnableBlip then
        treeBlip = AddBlipForCoord(Config.TreeCoords.x, Config.TreeCoords.y, Config.TreeCoords.z)
        SetBlipSprite(treeBlip, Config.BlipSprite)
        SetBlipColour(treeBlip, Config.BlipColor)
        SetBlipScale(treeBlip, Config.BlipScale)
        SetBlipAsShortRange(treeBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipName)
        EndTextCommandSetBlipName(treeBlip)
    end
end)

-- 🔄 Toggle blip via commande /christmastreeblip (optionnel)
RegisterCommand("christmastreeblip", function()
    if treeBlip then
        RemoveBlip(treeBlip)
        treeBlip = nil
        print("🎄 Christmas Tree blip disabled")
    else
        treeBlip = AddBlipForCoord(Config.TreeCoords.x, Config.TreeCoords.y, Config.TreeCoords.z)
        SetBlipSprite(treeBlip, Config.BlipSprite)
        SetBlipColour(treeBlip, Config.BlipColor)
        SetBlipScale(treeBlip, Config.BlipScale)
        SetBlipAsShortRange(treeBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipName)
        EndTextCommandSetBlipName(treeBlip)
        print("🎄 Christmas Tree blip enabled")
    end
end)
