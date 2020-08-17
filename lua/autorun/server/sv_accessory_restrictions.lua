if not SH_ACC then return end // Checks if base addon is installed

hook.Add("PlayerChangedTeam", "sh_accessories_playerchangeteam", function(ply, oldTeam, newTeam)
	for _, id in pairs(ply.SH_AccessoryInfo.equipped) do
		ply:SH_RemoveAccessory(id)
	end
	net.Start("SH_ACC_EQUIPS")
		net.WriteEntity(ply)
		net.WriteUInt(table.Count(ply.SH_AccessoryInfo.equipped), 16)

		for id in pairs(ply.SH_AccessoryInfo.equipped) do
			net.WriteString(id)
		end
	net.Send(ply)
	PrintTable(ply.SH_AccessoryInfo.equipped)
end)