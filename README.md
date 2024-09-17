Teleports the player column by column, row by row, in an NxN square matrix (non-spiral implementation) to pre-generate chunks in minecraft worlds.

Has the advantage of being highly flexible and compatible with every kind of modpack.

If you want to run this on a server computer instead of an "OP" client, feel free to adjust the chat commands in the main loop by excluding chat interface opening and adding the name of the player into the fixed command.

As a quick and dirty fix, if you had to interrupt the script for any reason and need to restart from where you left off, you can change the "currentZPos" to one more southwards and either adjust the main loop count or just stop the script early.
