if not ESX then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterNetEvent("TRAP_christmastree:claimGift", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    local identifier = xPlayer.getIdentifier()
    local now = os.time()

    -- 🔍 Vérifier le dernier claim (oxmysql)
    exports.oxmysql:scalar(
        "SELECT last_claim FROM trap_christmastree WHERE identifier = ?",
        { identifier },
        function(lastClaim)

            lastClaim = lastClaim or 0

            -- Cooldown pas terminé
            if now - lastClaim < Config.Cooldown then
                local remaining = Config.Cooldown - (now - lastClaim)
                local hours = math.floor(remaining / 3600)
                local minutes = math.floor((remaining % 3600) / 60)

                TriggerClientEvent('ox_lib:notify', src, {
                    title = '🎄 Arbre de Noël',
                    description = ('Tu dois attendre %dh %dmin pour ton prochain cadeau.'):format(hours, minutes),
                    type = 'error'
                })
                return
            end

            -- 🎁 Choisir un cadeau aléatoire
            local gift = Config.Gifts[math.random(#Config.Gifts)]
            local quantity = math.random(gift.min, gift.max)

            -- Donner l’item
            exports.ox_inventory:AddItem(src, gift.item, quantity)

            -- 📌 Sauvegarder l’heure du claim (UPSERT)
            exports.oxmysql:update(
                "INSERT INTO trap_christmastree (identifier, last_claim) VALUES (?, ?) ON DUPLICATE KEY UPDATE last_claim = ?",
                { identifier, now, now }
            )

            TriggerClientEvent('ox_lib:notify', src, {
                title = '🎁 Cadeau reçu',
                description = ('Tu as reçu : %sx %s'):format(quantity, gift.item),
                type = 'success'
            })
        end
    )
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    print('^4████████╗██████╗  █████╗ ██████╗ ')
    print('^4╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗')
    print('^4   ██║   ██████╔╝███████║██████╔╝')
    print('^4   ██║   ██╔══██╗██╔══██║██╔═══╝ ')
    print('^4   ██║   ██║  ██║██║  ██║██║     ')
    print('^4   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ')
    print('^7')
    print('^6   Discord : https://discord.gg/rjjU2y93X7')
    print('^8   Créé par TRAPZY')
    print('^3   © TRAP Development')

end)
