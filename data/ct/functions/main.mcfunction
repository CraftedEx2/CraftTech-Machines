#conveyer belts
execute at @e[type=item] if block ~ ~-1 ~ minecraft:observer[facing=west] run data merge entity @e[type=item,distance=0,limit=1] {Motion:[0.2d, 0.0d, 0.0d],Age:0s}
execute at @e[type=item] if block ~ ~-1 ~ minecraft:observer[facing=east] run data merge entity @e[type=item,distance=0,limit=1] {Motion:[-0.2d, 0.0d, 0.0d],Age:0s}
execute at @e[type=item] if block ~ ~-1 ~ minecraft:observer[facing=south] run data merge entity @e[type=item,distance=0,limit=1] {Motion:[0.0d, 0.0d, -0.2d],Age:0s}
execute at @e[type=item] if block ~ ~-1 ~ minecraft:observer[facing=north] run data merge entity @e[type=item,distance=0,limit=1] {Motion:[0.0d, 0.0d, 0.2d],Age:0s}

#enchanted quartz
loot give @p[scores={QuartzMined=1}] loot ct:crystalget
scoreboard players reset @p[scores={QuartzMined=1}] QuartzMined

#block breaker
scoreboard players add @e[tag=bb] bb_timer 1
execute at @e[scores={bb_timer=40}] run setblock ~ ~-1 ~ air destroy
scoreboard players reset @e[scores={bb_timer=40}] bb_timer

execute at @e[tag=blockb] align xz run summon minecraft:armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Fire:23000s,Marker:1b,Invisible:1b,Tags:["bb","Machine"],ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",Count:1b,tag:{CustomModelData:3}}]}
execute as @e[tag=bb,nbt={Fire:-1s}] run data merge entity @s {Fire:23000s}
execute at @e[tag=blockb] run setblock ~ ~ ~ minecraft:iron_block
tp @e[tag=blockb] ~ -1000 ~
execute at @e[tag=bb] if block ~ ~ ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{display:{Name:"{\"text\":\"Block Breaker\",\"color\":\"green\",\"bold\":true,\"italic\":false}"},CustomModelData:3,EntityTag:{Silent:1b,NoAI:1b,Tags:["blockb"],ActiveEffects:[{Id:14b,Amplifier:255b,Duration:1000000,ShowParticles:0b}]}}}}
execute at @e[tag=bb] run kill @e[distance=..1,type=item,nbt={Item:{id:"minecraft:iron_block"}}]
execute as @e[tag=bb] at @s if block ~ ~ ~ air run kill @s[tag=bb]

#execute at @e[type=item,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}}] run execute at @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:4b}},distance=..1] run summon item ~ ~0.5 ~ {CustomNameVisible:1b,tag:["bbspawn"],CustomName:"{\"text\":\"Block Breaker\",\"color\":\"aqua\",\"italic\":\"false\"}",Item:{id:"minecraft:iron_pickaxe",Count:1b,tag:{display:{Name:"{\"text\":\"Block Breaker\",\"color\":\"aqua\",\"italic\":\"false\"}",Lore:["Drop on a Piston facing up to","create the Block Breaker"]},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}]}}}
#execute at @e[tag=bbspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:4b}},distance=..1]
#execute at @e[tag=bbspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}},distance=..1]

#trash can
execute at @e[tag=trashbinS] run setblock ~ ~ ~ dropper[facing=down]{CustomName: "{\"text\":\"Trash Can\"}"}
execute at @e[tag=trashbinS] align xz run summon armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Marker:0b,Invisible:1b,Tags:["trashbin","Machine"],ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",Count:1b,tag:{CustomModelData:5}}]}
tp @e[tag=trashbinS] ~ -1000 ~
execute at @e[tag=trashbin] run kill @e[distance=..1,type=item,nbt={Item:{id:"minecraft:dropper"}}]
execute at @e[tag=trashbin] if block ~ ~ ~ air run summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{display:{Name:"{\"text\":\"Trash Can\",\"color\":\"green\",\"bold\":true,\"italic\":false}"},CustomModelData:5,EntityTag:{Silent:1b,NoAI:1b,Tags:["trashbinS"],ActiveEffects:[{Id:14b,Amplifier:255b,Duration:1000000,ShowParticles:0b}]}}}}
execute as @e[tag=trashbin] at @s if block ~ ~ ~ air run kill @s
execute at @e[tag=trashbin] run data merge block ~ ~ ~ {Items:[]}

#ender hopper
execute at @e[tag=endhoppS] run setblock ~ ~ ~ hopper
execute at @e[tag=endhoppS] align xz run summon armor_stand ~0.5 ~ ~0.5 {Small:1b,NoGravity:1b,Marker:1b,Invisible:1b,Tags:["endhopp","Machine"],ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",Count:1b,tag:{CustomModelData:4}}]}
tp @e[tag=endhoppS] ~ -1000 ~
execute at @e[tag=endhopp] run kill @e[distance=..1,type=item,nbt={Item:{id:"minecraft:hopper"}}]
execute as @e[tag=endhopp] at @s run tp @e[type=item,distance=..20,nbt={OnGround:1b}] ~ ~1 ~
execute at @e[tag=endhopp] if block ~ ~ ~ air run summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{display:{Name:"{\"text\":\"Ender Hopper\",\"color\":\"green\",\"bold\":true,\"italic\":false}"},CustomModelData:4,EntityTag:{Silent:1b,NoAI:1b,Tags:["endhoppS"],ActiveEffects:[{Id:14b,Amplifier:255b,Duration:1000000,ShowParticles:0b}]}}}}
execute at @e[tag=endhopp] if block ~ ~ ~ air run kill @e[tag=endhopp,distance=..1]

execute at @e[tag=endhopp] run scoreboard players add @e[type=minecraft:item,distance=..1] ehtimer 1
execute at @e[scores={ehtimer=10}] run tp @e[type=item,sort=nearest,distance=..1] @e[tag=endhopp,limit=1,distance=1..40,sort=nearest]

#execute at @e[type=item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b}}] run execute at @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:4b}},distance=..1] run summon item ~ ~0.5 ~ {CustomNameVisible:1b,tag:["ehspawn"],CustomName:"{\"text\":\"Ender Hopper\",\"color\":\"aqua\",\"italic\":\"false\"}",Item:{id:"minecraft:ender_pearl",Count:1b,tag:{display:{Name:"{\"text\":\"Ender Hopper\",\"color\":\"aqua\",\"italic\":\"false\"}",Lore:["Drop on a Hopper to","create the Ender Hopper"]},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}]}}}
#execute at @e[tag=ehspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:4b}},distance=..1]
#execute at @e[tag=ehspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b}},distance=..1,tag=!ehspawn]

#quarry
#execute at @e[type=item,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}}] run execute at @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:10b}},distance=..1] run summon item ~ ~0.5 ~ {CustomNameVisible:1b,Tags:["qspawn"],CustomName:"{\"text\":\"Quarry\",\"color\":\"aqua\",\"italic\":\"false\"}",Item:{id:"minecraft:iron_pickaxe",Count:1b,tag:{display:{Name:"{\"text\":\"Quarry\",\"color\":\"aqua\",\"italic\":\"false\"}",Lore:["Drop on a Dispenser facing up to","create the Quarry"]},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}]}}}
#execute at @e[tag=qspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:redstone",Count:10b}},distance=..1]
#execute at @e[tag=qspawn] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond_pickaxe",Count:1b}},distance=..1]

execute at @e[tag=Quarry,tag=1,scores={q_timer=200..}] run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 air destroy
execute at @e[tag=Quarry,tag=1,scores={q_timer=200..}] run setblock ~ ~-1 ~ barrier replace
execute at @e[tag=Quarry,tag=1] run setblock ~ ~1 ~ air replace
execute as @e[tag=Quarry,tag=1,scores={q_timer=200..}] at @e[tag=Quarry,tag=1,scores={q_timer=200..}] run tp @s ~ ~-1 ~
execute at @e[tag=Quarry,tag=1,scores={q_timer=1..5}] run kill @e[type=minecraft:experience_orb,distance=..4] 
scoreboard players set @e[tag=Quarry,tag=1,scores={q_timer=200}] q_timer 0

scoreboard players add @e[tag=Quarry,tag=1] q_timer 1

execute at @e[tag=1,tag=Quarry,scores={q_timer=2}] as @e[tag=1,tag=Quarry,scores={q_timer=2}] if block ~ ~-1 ~ minecraft:bedrock run setblock ~ ~ ~ air replace
execute at @e[tag=1,tag=Quarry,scores={q_timer=2}] as @e[tag=1,tag=Quarry,scores={q_timer=2}] if block ~ ~-1 ~ minecraft:bedrock run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:diamond_pickaxe",Count:1b}}
execute at @e[tag=1,tag=Quarry,scores={q_timer=2}] as @e[tag=1,tag=Quarry,scores={q_timer=2}] if block ~ ~-1 ~ minecraft:bedrock run kill @s
#execute at @e[tag=1,tag=Quarry] if block ~ ~-1 ~ minecraft:bedrock run summon item ~ ~0.5 ~ {CustomNameVisible:1b,Tags:["qspawn"],CustomName:"{\"text\":\"Quarry\",\"color\":\"aqua\",\"italic\":\"false\"}",Item:{id:"minecraft:iron_pickaxe",Count:1b,tag:{display:{Name:"{\"text\":\"Quarry\",\"color\":\"aqua\",\"italic\":\"false\"}"},HideFlags:1,Enchantments:[{id:"minecraft:protection",lvl:1}]}}}
#execute at @e[tag=1,tag=Quarry] if block ~ ~ ~ minecraft:air run kill @e[tag=Quarry,distance=..1,limit=1]

execute at @e[tag=QuarryS] run setblock ~ ~ ~ barrier
execute at @e[tag=QuarryS] align xz run summon armor_stand ~0.5 ~ ~0.5 {CustomNameVisible:0b,Marker:1b,NoGravity:1b,Invisible:1b,Tags:["1","Quarry","Mechine"],ArmorItems:[{},{},{},{id:"diamond_hoe",Count:1b,tag:{CustomModelData:1}}],Small:1b}
tp @e[tag=QuarryS] ~ -1000 ~

execute as @e[tag=Quarry,tag=1] at @e[tag=Quarry,tag=1] run teleport @e[type=minecraft:item,distance=..5] ~ ~1 ~

execute at @e[tag=1,scores={q_timer=3..}] run fill ~3 ~ ~-4 ~-3 ~ ~-4 minecraft:cobblestone
execute at @e[tag=1,scores={q_timer=3..}] run fill ~-4 ~ ~3 ~-4 ~ ~-3 minecraft:cobblestone
execute at @e[tag=1,scores={q_timer=3..}] run fill ~3 ~ ~4 ~-3 ~ ~4 minecraft:cobblestone
execute at @e[tag=1,scores={q_timer=3..}] run fill ~4 ~ ~3 ~4 ~ ~-3 minecraft:cobblestone

#Smelter
execute at @e[tag=Smelter] run kill @e[distance=..1,type=item,nbt={Item:{id:"minecraft:polished_andesite"}}]
execute at @e[tag=smelterS] align xz run summon minecraft:armor_stand ~0.5 ~ ~0.5 {NoGravity:1b,Fire:23000s,Small:1b,Invisible:1b,Tags:["Smelter"],ArmorItems:[{},{},{},{id:"minecraft:diamond_hoe",Count:1b,tag:{CustomModelData:7}}]}
execute at @e[tag=smelterS] run setblock ~ ~ ~ minecraft:polished_andesite replace
tp @e[tag=smelterS] ~ -1000 ~
execute as @e[tag=Smelter,nbt={Fire:-1s}] run data merge entity @s {Fire:23000s}
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ iron_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ gold_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ coal_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ minecraft:diamond_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ minecraft:emerald_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ redstone_ore run scoreboard players add @s smelt 1
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ lapis_ore run scoreboard players add @s smelt 1
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ iron_ore run loot spawn ~ ~1 ~ loot ct:ironsmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ iron_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ gold_ore run loot spawn ~ ~1 ~ loot ct:goldsmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ gold_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ coal_ore run loot spawn ~ ~1 ~ loot ct:coalsmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ coal_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ minecraft:diamond_ore run loot spawn ~ ~1 ~ loot ct:diamondsmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ diamond_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ emerald_ore run loot spawn ~ ~1 ~ loot ct:emeraldsmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ emerald_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ redstone_ore run loot spawn ~ ~1 ~ loot ct:redstonesmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ redstone_ore run setblock ~ ~1 ~ air
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ lapis_ore run loot spawn ~ ~1 ~ loot ct:lapissmelt
execute at @e[tag=Smelter,scores={smelt=40}] if block ~ ~1 ~ lapis_ore run setblock ~ ~1 ~ air
execute as @e[tag=Smelter] at @s if block ~ ~1 ~ air run scoreboard players reset @s smelt
execute as @e[tag=Smelter] at @s if block ~ ~ ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",Count:1b,tag:{display:{Name:"{\"text\":\"Smelter\",\"color\":\"green\",\"bold\":true,\"italic\":false}"},CustomModelData:7,EntityTag:{Silent:1b,NoAI:1b,Tags:["smelterS"],ActiveEffects:[{Id:14b,Amplifier:255b,Duration:1000000,ShowParticles:0b}]}}}}
execute as @e[tag=Smelter] at @s if block ~ ~ ~ air run kill @s