-- Make the server send these files to the client
-- Add**ClientSide**LuaFile!
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("Retro_ShowReadNoteDialog")

function ENT:Initialize()

  self:SetModel("models/props_lab/bindergreen.mdl")
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
  net.Start("Retro_ShowReadNoteDialog")
    net.WriteString(self:GetContent())
  net.Send(activator)
end