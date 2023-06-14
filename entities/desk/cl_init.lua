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

  local ComboBox = vgui.Create( "DComboBox", Frame )
  ComboBox:SetPos( 10, 30 )
  ComboBox:SetSize( 150, 20 )
  ComboBox:AddChoice( "What went well" )
  ComboBox:AddChoice( "What went wrong" )
  ComboBox:AddChoice( "Ideas for improvement" )
  ComboBox:SetValue( "What went well" )

  local noteType = "What went well"

  ComboBox.OnSelect = function( _, _, value )
    noteType = value
  end

  local NameEntry = vgui.Create( "DTextEntry", Frame )
  NameEntry:SetPos( 10, 70 )
  NameEntry:SetSize( 264, 32 )
  NameEntry:SetPlaceholderText( "Add note" )
  NameEntry.OnEnter = function( self )
    net.Start( "Retro_SaveNote" )
      net.WriteString( self:GetValue() )
      net.WriteString( noteType )
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
