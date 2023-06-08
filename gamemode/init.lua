AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

util.AddNetworkString("Retro_SaveNote")

NOTES = {}

net.Receive("Retro_SaveNote", function( len, ply )
  local data = net.ReadString()
  local note = {
    content = data,
    player = ply
  }
  table.insert(NOTES, note)
  print( "Got the note!: '"..note.content.."' by "..note.player:Nick() )
  local entity = ents.Create("note") -- Classname of the entity; name of the file
  entity:Spawn()
  entity:SetPos(ply:GetPos() + Vector(50, 50, 0))
end)