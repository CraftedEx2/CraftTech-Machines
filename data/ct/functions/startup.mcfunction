tellraw @p[tag=!ct] ["",{"text":"==================================","color":"yellow"},{"text":"\nThanks for downloading CraftTech","color":"aqua"},{"text":"\n Your are running ","color":"aqua"},{"text":"version 1.5.0","color":"white"},{"text":"\n\nInformation and Recipes","color":"dark_blue","bold":true,"clickEvent":{"action":"open_url","value":"https://minecraft.curseforge.com/projects/crafttech-machines"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Go the the project website","color":"white"}]}}},{"text":"\nYouTube Showcases","color":"dark_blue","bold":true,"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"If doing a YouTube showcase remember to give me credit","color":"white"}]}}},{"text":"\nJoin the Discord","color":"dark_blue","bold":true,"clickEvent":{"action":"open_url","value":"https://discord.gg/Eb2kBSf"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Join the Discord!","color":"white"}]}}},{"text":"\n==================================","color":"yellow","bold":false}]
tag @p[tag=!ct] add ct
scoreboard objectives add q_timer dummy
scoreboard objectives add QuartzMined minecraft.mined:minecraft.nether_quartz_ore
scoreboard objectives remove QuartzMined2
scoreboard objectives add ehtimer dummy
scoreboard objectives add bb_timer dummy
scoreboard objectives add smelt dummy