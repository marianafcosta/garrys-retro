include( "shared.lua" )

function ShowDialog()
  local Frame = vgui.Create( "DFrame" )
  Frame:SetPos( 5, 5 ) 
  Frame:SetSize( 300, 150 ) 
  Frame:SetTitle( "Add note" ) 
  Frame:SetVisible( true ) 
  Frame:SetDraggable( false ) 
  Frame:ShowCloseButton( true ) 
  Frame:MakePopup()
end

hook.Add( "Initialize", "display_dialog", function()
	ShowDialog()
end)