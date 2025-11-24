

# 🎄 TRAP_christmastree

**License: MIT**

Christmas Tree Daily Gift System – ESX + ox_inventory + ox_target + oxmysql

---

## ✨ Description

TRAP_christmastree adds an **interactive Christmas tree** to your FiveM server.
Each player can **claim a gift once every 24 hours**, even after a server restart (cooldown saved in SQL).

The gifts are **random** from a configurable list and use **ox_inventory**.

---

## 🎁 Features

* 🎄 3D Christmas tree prop placed on the map
* 🎁 Random rewards from a configurable list
* ⏳ 24h cooldown (configurable)
* 💾 **Persistent cooldown** via SQL (oxmysql)
* 🎯 Interaction via **ox_target**
* 📦 Compatible with **ox_inventory**
* ♻️ Works with ESX Legacy / ESX Rework
* 🔧 Easy configuration in `config.lua`

---

## 📦 Dependencies

This script requires:

* **ESX**
* **ox_inventory**
* **ox_target**
* **ox_lib**
* **oxmysql** (or oxsql)

Make sure your `server.cfg` includes:

```cfg
ensure oxmysql
ensure ox_lib
ensure ox_inventory
ensure ox_target
ensure es_extended
ensure TRAP_christmastree
```

---

## 🗂️ Installation

### 1. Add the resource

Place the **TRAP_christmastree** folder in your `resources/` directory.

### 2. Add the SQL table

Run the following in your database:

```sql
CREATE TABLE IF NOT EXISTS trap_christmastree (
    identifier VARCHAR(50) NOT NULL,
    last_claim INT NOT NULL,
    PRIMARY KEY (identifier)
);
```

### 3. Configuration (`config.lua`)

Customize:

* tree position
* prop to use
* cooldown
* list of gifts

Example:

```lua
Config.Gifts = {
    { item = "bread", min = 1, max = 3 },
    { item = "water", min = 1, max = 2 },
    { item = "weapon_pistol", min = 1, max = 1 },
}
```

You can add as many items as you want.

---

## 🎮 How it works for players

A Christmas tree will appear on the map.
Players can:

➡️ Approach the tree
➡️ Use **ox_target**
➡️ Click **“Claim your gift 🎁”**

They will receive a random item.

If the cooldown is not finished:
❌ A notification will show the remaining time (hours + minutes).

---

## 🔧 Features to Add/Toggle

* You can enable/disable the **map blip** for the tree in `config.lua`.

---

## 💬 Support / Script Creation

For support or custom script creation, join our Discord:
[https://discord.gg/rjjU2y93X7](https://discord.gg/rjjU2y93X7)

---


Veux‑tu que je fasse ça ?
