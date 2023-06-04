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

  local Notes = {}
  local NumberOfNotes = 0

  local NameEntry = vgui.Create( "DTextEntry", Frame )
  NameEntry:SetPos( 25, 50 )
  NameEntry:SetSize( 264, 32 )
  NameEntry:SetPlaceholderText( "Add note" )
  NameEntry.OnEnter = function( self )
    NumberOfNotes = NumberOfNotes + 1
    Notes[NumberOfNotes] = self:GetValue()
    print( "The note is: "..Notes[NumberOfNotes])
    print( "We currently have: "..NumberOfNotes)
    self:SetText("")
  end
end

hook.Add( "Initialize", "display_dialog", function()
	ShowDialog()
end)