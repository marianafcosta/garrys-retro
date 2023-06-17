# Garry's Retro

Just a little project that lets you hold sprint retrospectives in Garry's Mod. If, for some reason, you'd ever want to do that.

[🎬 Demo](https://vimeo.com/837219984?share=copy)

# Usage

You can spawn the "Retrospective Desk" from spawn menu. Once spawned, if you interact with it, a promp to write a note will show up. Beside writing a note, you can also set the type of the note, i.e. whether it's something that went well, something that went wrong, or just an idea for improvement. Once you are finished writing the note and press Enter, a note will be spawned on top of the table. You can read that note if you interact with it.

# Why?

I wanted to dip my feet in the modding world, and Garry's Mod seemed like a sensible choice (plus, I have fond memories of playing Prop Hunt and TTT). The idea came to me after I was looking around for Garry's Mod modding resources after work, and it seemed like a feasible little project to get to know the environment.

# Setup

You'll have to copy the entities (the `desk` and `note` folders) in this repository to the Garry's Mod installation folder. In OSX, it will likely be:

```
/Users/<username>/Library/Application Support/Steam/steamapps/common/GarrysMod/garrysMod/lua/entities
```

The same applies to the folder that contains the spawn icon for the desk (the `entities` folder in `materials`):

```
/Users/<username>/Library/Application Support/Steam/steamapps/common/GarrysMod/garrysMod/materials
```
