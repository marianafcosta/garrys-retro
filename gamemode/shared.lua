GM.Name = "Retro"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
	-- Do stuff
end

if (SERVER) then
  net.Receive("Retro_SaveNote", function( len, ply )
    local note = net.ReadString()
    print( "Got the note!: "..note )
  end)
end