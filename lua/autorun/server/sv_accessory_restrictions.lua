if not SH_ACC then return end // Checks if base addon is installed

hook.Add("PlayerChangedTeam", "sh_accessories_playerchangeteam", function(ply, oldTeam, newTeam)
	if table.Count(ply.SH_AccessoryInfo.equipped) <= 0 then return end

	if !SH_ACC.AllowedJobs[newTeam] then 
		for id in pairs(ply.SH_AccessoryInfo.equipped) do
			local acc = SH_ACC:GetAccessory(id)
			ply:SH_UnequipAccessory(acc.id)
		end
		SH_ACC:Notify(ply, "", SH_ACC.UnequipAllMessage)
	end
end)