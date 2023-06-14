-- Make the server send these files to the client
-- Add**ClientSide**LuaFile!
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("Retro_ShowWriteNoteDialog")
util.AddNetworkString("Retro_SaveNote")

function ENT:Initialize()

  self:SetModel("models/props_interiors/Furniture_Desk01a.mdl")
  self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)	
  -- Call ENTITY:Use hook only once at every use
  self:SetUseType( SIMPLE_USE )

  local phys = self:GetPhysicsObject()

  if phys:IsValid() then
    phys:Wake()
  end
		
end

function ENT:Use(activator)
  net.Start("Retro_ShowWriteNoteDialog")
    net.WriteVector(self:GetPos())
	net.Send(activator)
end

net.Receive("Retro_SaveNote", function( len, ply )
  local content = net.ReadString()
  local noteType = net.ReadString()
  local spawnPos = net.ReadVector()
  local note = ents.Create("note") -- Classname of the entity; name of the file
  note:SetPos(spawnPos + Vector(0, 0, 25))
  note:SetContent(content)
  note:SetNoteType(noteType)
  note:SetAuthor(ply)
  note:UpdateModel()
  note:Spawn()
end)