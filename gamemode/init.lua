AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

util.AddNetworkString("Retro_SaveNote")

NOTES = {}

net.Receive("Retro_SaveNote", function( len, ply )
  local note = net.ReadString()
  table.insert(NOTES, note)
  print( "Got the note!: "..note )
end)