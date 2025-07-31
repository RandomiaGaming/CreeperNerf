execute as @e[type=minecraft:creeper,tag=!BombCreeper] run data merge entity @s {ExplosionRadius:0,Fuse:15s}

effect give @e[type=minecraft:creeper,tag=!BombCreeper] minecraft:unluck infinite 255 true

execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27}]}] run execute at @s run scoreboard players set <Global> MobGriefingTimer 10
execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27}]}] run gamerule mobGriefing false
execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27}]}] run execute at @s run summon minecraft:creeper ~ ~ ~ {Fuse:0,ExplosionRadius:2,Tags:["BombCreeper"]}
execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27}]}] run kill @s

execute if score <Global> MobGriefingTimer matches 1.. run scoreboard players remove <Global> MobGriefingTimer 1

execute if score <Global> MobGriefingTimer matches ..0 run gamerule mobGriefing true