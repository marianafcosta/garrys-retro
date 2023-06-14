include("shared.lua")

function ShowReadNoteDialog(note)
  local Panel = vgui.Create( "DFrame" )
	Panel:SetPos( 5, 5 ) 
	Panel:SetSize( 300, 150 ) 
	Panel:SetTitle( "Someone wrote:" ) 
	Panel:SetVisible( true ) 
	Panel:SetDraggable( true ) 
	Panel:ShowCloseButton( true ) 
	Panel:MakePopup()

  Panel:Center()
	
	local NoteContent = vgui.Create( "DLabel", Panel )
	NoteContent:SetPos( 25, 50 )
	NoteContent:SetSize( 264, 32 )
	NoteContent:SetText(note)
end

function ENT:Draw()
  self:DrawModel()
end

net.Receive("Retro_ShowReadNoteDialog", function()
  ShowReadNoteDialog(net.ReadString())
end)