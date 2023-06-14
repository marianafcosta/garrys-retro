-- Make the server send these files to the client
-- Add**ClientSide**LuaFile!
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("Retro_ShowReadNoteDialog")

function ENT:Initialize()

  if (self:GetModel() == nil) then
    self:SetModel("models/props_lab/bindergreen.mdl")
  end
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
    net.WriteString(self:GetNoteType())
  net.Send(activator)
end

function ENT:UpdateModel()
  local noteType = self:GetNoteType()
  if (noteType == "What went well") then
    self:SetModel("models/props_lab/bindergreen.mdl")
  elseif (noteType == "What went wrong") then
    self:SetModel("models/props_lab/binderredlabel.mdl")
  else
    self:SetModel("models/props_lab/binderblue.mdl")
  end
end