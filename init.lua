obsidianstuff = {}

local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end



--
-- Crafitems
--

minetest.register_craftitem("obsidianstuff:ingot", {
    description = S("Obsidion Ingot"),
    inventory_image = "obsidianstuff_ingot.png",
    
})

minetest.register_craft({
    type = "shapeless",
    output = "obsidianstuff:ingot 2",
    recipe = {"default:steel_ingot", "default:obsidian"}
})

--
-- Tools
--

minetest.register_tool("obsidianstuff:sword", {
    description = S("Obsidian Sword"),
    inventory_image = "obsidianstuff_sword.png",
    
    tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {1.7, 0.7, 0.25},
				uses = 50,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 10, burns = 0},
    },
})




    minetest.register_tool("obsidianstuff:pick", {
        description = S("Obsidian Pickaxe"),
        inventory_image = "obsidianstuff_pick.png",
       
        tool_capabilities = {

            full_punch_interval = 0.7,
            max_drop_level = 3,
            groupcaps={
                cracky = {
                    times = {[1] = 1.8, [2] = 0.8, [3] = 0.40},
                    uses = 40,
                    maxlevel = 3
                },
            },
            damage_groups = {fleshy = 6, burns = 0},
        },
    })






minetest.register_tool("obsidianstuff:shovel", {
    description = S("Obsidian Shovel"),
    inventory_image = "obsidianstuff_shovel.png",
    wield_image = "obsidianstuff_shovel.png^[transformR90",

    tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
    on_place = obsidianstuff.tool_fire_func,
    sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("obsidianstuff:axe", {
    description = S("Obsidian Axe"),
    inventory_image = "obsidianstuff_axe.png",

    tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				times = {[1] = 2.00, [2] = 0.80, [3] = 0.40},
				uses = 40,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 7, burns = 0},
	},

})
--
-- Tool Crafts
--

minetest.register_craft({
    output = "obsidianstuff:sword",
    recipe = {
        {"obsidianstuff:ingot"},
        {"obsidianstuff:ingot"},
        {"default:obsidian_shard"},
    }
})

minetest.register_craft({
    output = "obsidianstuff:pick",
    recipe = {
        {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
        {"", "default:obsidian_shard", ""},
        {"", "default:obsidian_shard", ""},
    }
})

minetest.register_craft({
    output = "obsidianstuff:shovel",
    recipe = {
        {"obsidianstuff:ingot"},
        {"default:obsidian_shard"},
        {"default:obsidian_shard"},
    }
})

minetest.register_craft({
    output = "obsidianstuff:axe",
    recipe = {
        {"obsidianstuff:ingot", "obsidianstuff:ingot", ""},
        {"obsidianstuff:ingot", "default:obsidian_shard", ""},
        {"", "default:obsidian_shard", ""},
    }
})


--
-- Armor
--

if minetest.get_modpath("3d_armor") then
    armor:register_armor("obsidianstuff:helmet", {
        description = S("Obsidian Helmet"),
        inventory_image = "obsidianstuff_inv_helmet.png",

        groups = {armor_head=1, armor_heal=12, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=15},
        damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })

    armor:register_armor("obsidianstuff:chestplate", {
        description = S("Obsidian Chestplate"),
        inventory_image = "obsidianstuff_inv_chestplate.png",

        groups = {armor_torso=1, armor_heal=12, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=20},
        damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })

    armor:register_armor("obsidianstuff:leggings", {
        description = S("Obsidian Leggings"),
        inventory_image = "obsidianstuff_inv_leggings.png",

        groups = {armor_legs=1, armor_heal=12, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=20},
        damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })

    armor:register_armor("obsidianstuff:boots", {
        description = S("Obsidian Boots"),
        inventory_image = "obsidianstuff_inv_boots.png",

        groups = {armor_feet=1, armor_heal=12, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })

    armor:register_armor("obsidianstuff:shield", {
        description = S("Obsidian Shield"),
        inventory_image = "obsidianstuff_inven_shield.png",

        groups = {armor_shield=1, armor_heal=12, armor_use=100, armor_fire=0},
        armor_groups = {fleshy=20},
        damage_groups = {cracky=2, snappy=1, level=3},
        wear = 0,
    })
end

--
-- Armor Crafts
--

if minetest.get_modpath("3d_armor") then
    minetest.register_craft({
        output = "obsidianstuff:helmet",
        recipe = {
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
            {"", "", ""},
        }
    })

    minetest.register_craft({
        output = "obsidianstuff:chestplate",
        recipe = {
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
        }
    })

    minetest.register_craft({
        output = "obsidianstuff:leggings",
        recipe = {
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
        }
    })

    minetest.register_craft({
        output = "obsidianstuff:boots",
        recipe = {
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "", "obsidianstuff:ingot"},
        }
    })

    minetest.register_craft({
        output = "obsidianstuff:shield",
        recipe = {
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
            {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
            {"", "obsidianstuff:ingot", ""},
        }
    })
end

--
-- Nodes
--

minetest.register_node("obsidianstuff:block", {
    description = S("Obsidian Block"),
    tiles = {"obsidianstuff_block.png"},
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    groups = {cracky = 2, level = 2},
    light_source = 2,
})

minetest.register_craft({
    type = "shapeless",
    output = "obsidianstuff:ingot 9",
    recipe = {"obsidianstuff:block"}
})

minetest.register_craft({
    output = "obsidianstuff:block",
    recipe = {
        {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
        {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
        {"obsidianstuff:ingot", "obsidianstuff:ingot", "obsidianstuff:ingot"},
    }
})


--
--Toolranks support
--

if minetest.get_modpath("toolranks") then
    minetest.override_item("obsidianstuff:sword", {
        description = toolranks.create_description(S("Obsidian Sword"), 0, 1),
        original_description = S("Obsidian Sword"),
        after_use = toolranks.new_afteruse
    })

    minetest.override_item("obsidianstuff:pick", {
        description = toolranks.create_description(S("Obsidian Pickaxe"), 0, 1),
        original_description = S("Obsidian Pickaxe"),
        after_use = toolranks.new_afteruse
    })

    minetest.override_item("obsidianstuff:axe", {
        description = toolranks.create_description(S("Obsidian Axe"), 0, 1),
        original_description = S("Obsidian Axe"),
        after_use = toolranks.new_afteruse
    })

    minetest.override_item("obsidianstuff:shovel", {
        description = toolranks.create_description(S("Obsidian Shovel"), 0, 1),
        original_description = S("Obsidian Shovel"),
        after_use = toolranks.new_afteruse
    })
end

