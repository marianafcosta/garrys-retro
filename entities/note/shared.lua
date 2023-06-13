ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Retrospective Note"
ENT.Spawnable = true

function ENT:SetupDataTables()
  self:NetworkVar("String", 0, "Content")
  self:NetworkVar("Entity", 1, "Author")
end