ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Retrospective Note"
ENT.Spawnable = false

function ENT:SetupDataTables()
  self:NetworkVar("String", 0, "Content")
  self:NetworkVar("String", 1, "NoteType")
  self:NetworkVar("Entity", 2, "Author")
end