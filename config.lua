Config = {}

-- Position de l’arbre
Config.TreeCoords = vec3(224.2769, -795.9024, 30.7683)
Config.TreeHeading = 120.0

-- Prop de l’arbre de Noël
Config.TreeProp = `prop_xmas_tree_int`

-- Cooldown 24h
Config.Cooldown = 86400

-- Liste des cadeaux possibles (un au hasard sera donné)
Config.Gifts = {
    { item = "bread", min = 1, max = 3 },
    { item = "water", min = 1, max = 2 },
    { item = "weapon_pistol", min = 1, max = 1 },
    { item = "money", min = 1000, max = 5000 }     -- si tu donnes de l'argent via item

}

Config.TargetLabel = "Réclamer ton cadeau 🎁"

-- 🔔 Blip
Config.EnableBlip = true -- true = visible, false = invisible
Config.BlipSprite = 140     -- type du blip
Config.BlipColor = 2        -- couleur du blip
Config.BlipScale = 0.8      -- taille du blip
Config.BlipName = "Christmas Tree"  -- nom affiché
