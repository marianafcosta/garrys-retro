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

  local NameEntry = vgui.Create( "DTextEntry", Frame )
  NameEntry:SetPos( 25, 50 )
  NameEntry:SetSize( 264, 32 )
  NameEntry:SetPlaceholderText( "Add note" )
  NameEntry.OnEnter = function( self )
    net.Start( "Retro_SaveNote" )
      net.WriteString( self:GetValue() )
    net.SendToServer( )
    self:SetText("")
  end
end

hook.Add( "Initialize", "display_dialog", function()
	ShowDialog()
end)