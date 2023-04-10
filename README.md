This is a datapack that adds string concatenation into vanilla Minecraft, which is now possible as of update 1.19.4.

#How to use

Make sure to run the function `kronosta_strconcat:setup` first, this forceloads a chunk for the concatenation to use. As of 1.17, forceload does not necessarily have an effect on the same tick it was executed in, so `kronosta_strconcat:concat` will automatically wait until the chunk is ready.

In the storage `kronosta_strconcat:concat`, the `Input` field should be a compound tag containing a field called `ToConcat`. `ToConcat` should be an array of strings, which will be concatenated. The result will be in `Output.Result` inside of the storage `kronosta_strconcat:concat`. Note that, due to some nuances of command blocks that I haven't fully figured out, the result will take 6 ticks to be available (`schedule` commands are your friend when using this datapack). Currently this is a speed problem, since this datapack is currently only programmed to handle one string at once, but with a bit more programming, it absolutely could make multiple concatenations.

#How it works

1. Reference the array onto a sign, which causes component resolution, making the JSON string encode the entire contents.
2. Copy the sign's text onto an entity's name. The entity must be incapable of holding an item.
3. Use the enchant command inside of a command block on the entity. When you use the `enchant` command on an entity incapable of holding an item, the LastOutput of the command block running it will contain the flattened version of the nbt json string.
4. Copy the resulting string somewhere, but without the first 89 characters (using the `data modify` command with a string source).
5. Get the length of that string with `execute store` and `data get`.
6. Do steps 1-3 again, but with a string resulting in a `data modify` command with the `string` source, with the length of the first string as the end argument and 0 as the first. This command should copy the first string while also chopping off the last 38 characters.
7. Get the length of the dynamic command, which should have only five possible lengths, one for each number of digits the desired string's length could have.
8. Check each length and use `data modify` with `string` source to turn it into a dynamic command. Once again, the substring commands should remove the first 89 characters and the last 38 characters.
9. Execute the dynamic command.
10. The strings have been concatenated.

#Limitations

This datapack is incapable of handling backslashes or double quotes. Backslashes should be possible by putting the string inside of a dynamic `data modify` command with a single-quotes string, and replacing all instances of a single quote with a backslash followed by a single quote. Double quotes are most likely not possible because single quoted strings do not support double-quote escapes, and the concatenated strings actually escape backslashes and double quotes with actual characters (`"\""` becomes `"\\\""`). However, there are only a few places you would actually need to use double quotes: as an actual character, in JSON text, or in an NBT path featuring spaces, square brackets, curly brackets, or periods. (As it turns out, most symbols are totally fine inside of nbt paths. You can type in something like `@#*` as an nbt path and the nbt path will refer to the correct field, while still being quoted inside of data get commands.) Most other places can use single quotes, such as literal strings or keys inside of literal compound tags.

String concatenation has a character limit for the result string at around 2700 characters (in the resolved string, every character takes 12 characters, and the first takes 24). You could increase this if you concatenate certain length ranges of characters into strings separately, then concatenate the groups as a whole.


