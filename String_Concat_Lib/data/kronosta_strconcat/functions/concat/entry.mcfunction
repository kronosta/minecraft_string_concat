fill 29999987 -63 482035 29999987 319 482035 minecraft:air

setblock 29999987 315 482035 minecraft:stone

summon minecraft:boat 29999987 316 482035 {UUID:[I;-484819734,114509258,-1120772864,-149157018]}

setblock 29999987 314 482035 minecraft:command_block[conditional=false]{TrackOutput:1b,conditionMet:1b}

setblock 29999987 311 482035 minecraft:stone

setblock 29999987 312 482035 minecraft:oak_sign

data modify block 29999987 312 482035 Text1 set value '{"nbt":"Input.ToConcat","storage":"kronosta_strconcat:concat","interpret":true}'

data modify entity e31a3cea-06d3-45ca-bd32-5d00f71c0b66 CustomName set from block 29999987 312 482035 Text1

data modify block 29999987 314 482035 Command set value "enchant e31a3cea-06d3-45ca-bd32-5d00f71c0b66 minecraft:aqua_affinity"

setblock 29999988 314 482035 minecraft:redstone_block

setblock 29999988 314 482035 minecraft:air

schedule function kronosta_strconcat:concat/part2 2t

