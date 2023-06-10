AddCSLuaFile()

ENT.Base = "base_nextbot"
ENT.Type = "nextbot"
ENT.Spawnable		= true
ENT.Note = {}

function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox03a.mdl" )

	if SERVER then
		-- Init physics only on server, so it doesn't mess up physgun beam
		self:PhysicsInit( SOLID_VPHYSICS )
	end

	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	if SERVER then
		-- Call ENTITY:Use hook only once at every use
		self:SetUseType( SIMPLE_USE )
		
		print("Initialized note entity with note: "..self.Note.content.." written by "..self.Note.player:Nick())
	end

end

function ENT:Use( activator )
	print("Sending note to client...")
	net.Start("Retro_DisplayNote")
		net.WriteString(self.Note.content)
		net.WriteString(self.Note.player:Nick())
	net.Send(activator)
	print("Note sent!")
end

if CLIENT then

hook.Add("HUDPaint", "display_read_instruction", function()
	local eyetrace = LocalPlayer():GetEyeTrace()

  if eyetrace.Entity:GetClass() == "note" then
    draw.SimpleText( "Read note", "DermaLarge", ScrW()/2, ScrH()/2, color_white, 1)
  end
end)

end