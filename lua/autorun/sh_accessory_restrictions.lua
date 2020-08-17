if not SH_ACC then print("[SH_ACCESSORIES_JOB_RESTRICTIONS] SH Accessories addon is not installed. Please download from gmodstore for this addon to work") return end // Checks if base addon is installed
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SH_ACC.NotAllowedMessage = "You are not allowed to use this shop."

hook.Add("InitPostEntity", "sh_acc_restrictions_init", function() // This hook is just to prevent table index nil errors on server start-up
    SH_ACC.AllowedJobs = {
        [TEAM_CITIZEN] = true
    }
end)