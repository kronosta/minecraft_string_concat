data modify storage kronosta_strconcat:concat EnchantText set string block 29999987 314 482035 LastOutput 89

scoreboard objectives add KronostaConcat dummy

scoreboard players set $Length KronostaConcat 0

execute store result score $Length KronostaConcat run data get storage kronosta_strconcat:concat EnchantText

scoreboard players remove $Length KronostaConcat 38

execute store result storage kronosta_strconcat:concat EndIndex int 1.0 run scoreboard players get $Length KronostaConcat

scoreboard objectives remove KronostaConcat

data modify storage kronosta_strconcat:concat Output set value {Result:""}

data modify storage kronosta_strconcat:concat DataStringBuilder set value ["data modify storage kronosta_strconcat:concat Output.Result set string storage kronosta_strconcat:concat EnchantText 0 "]

data modify storage kronosta_strconcat:concat DataStringBuilder append string storage kronosta_strconcat:concat EndIndex

data modify block 29999987 312 482035 Text1 set value '{"nbt":"DataStringBuilder","storage":"kronosta_strconcat:concat","interpret":true}'

data modify entity e31a3cea-06d3-45ca-bd32-5d00f71c0b66 CustomName set from block 29999987 312 482035 Text1

setblock 29999988 314 482035 minecraft:redstone_block

setblock 29999988 314 482035 minecraft:air

schedule function kronosta_strconcat:concat/part3 2t