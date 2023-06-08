AddCSLuaFile()

ENT.Base = "base_nextbot"
ENT.Type = "nextbot"
ENT.Spawnable		= true

function ENT:Initialize()

	-- Sets what model to use
	self:SetModel( "models/weapons/c_medkit.mdl" )

	-- Sets what color to use
	self:SetColor( Color( 200, 255, 200 ) )

	-- Physics stuff
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_BBOX)

	if ( SERVER ) then
		-- Init physics only on server, so it doesn't mess up physgun beam
		self:PhysicsInit( SOLID_VPHYSICS )

		-- Call ENTITY:Use hook only once at every use
		self:SetUseType( SIMPLE_USE )
	end

end

function ENT:Use( activator )
	print("The player read the note")
end