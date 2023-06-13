include("shared.lua")

function ShowWriteNoteDialog(spawnPos)
  local Frame = vgui.Create( "DFrame" )
  Frame:SetSize( 300, 150 ) 
  Frame:SetTitle( "Write a note" ) 
  Frame:SetVisible( true ) 
  Frame:SetDraggable( true ) 
  Frame:ShowCloseButton( true ) 
  Frame:MakePopup()
  Frame:Center()

  local NameEntry = vgui.Create( "DTextEntry", Frame )
  NameEntry:SetPos( 25, 50 )
  NameEntry:SetSize( 264, 32 )
  NameEntry:SetPlaceholderText( "Add note" )
  NameEntry.OnEnter = function( self )
    print("Note written: "..self:GetValue())
    net.Start( "Retro_SaveNote" )
      net.WriteString( self:GetValue() )
      net.WriteVector( spawnPos )
    net.SendToServer( )
    self:SetText("")
  end
end

function ENT:Draw()
  self:DrawModel()
end

net.Receive("Retro_ShowWriteNoteDialog", function()
  local spawnPos = net.ReadVector()
  ShowWriteNoteDialog(spawnPos)
end)
