AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/humans/group01/female_01.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE + CAP_TURN_HEAD)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()

	self:SetMaxYawSpeed(90)
end

function ENT:AcceptInput(inpt, activator, caller)
	if (inpt == "Use" and activator:IsPlayer()) then
		if table.Count(SH_ACC.AllowedJobs) <= 0 or SH_ACC.AllowedJobs[activator:Team()] then
			SH_ACC:Show(activator)
		else
			activator:PrintMessage(HUD_PRINTTALK, SH_ACC.NotAllowedMessage)
		end
	end
end