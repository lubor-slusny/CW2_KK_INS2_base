
// V6 FLASHLIGHT

CustomizableWeaponry_KK.ins2.flashlight.v6 = CustomizableWeaponry_KK.ins2.flashlight.v6 or {}
setmetatable(CustomizableWeaponry_KK.ins2.flashlight.v6, CustomizableWeaponry_KK.ins2.flashlight)

if CLIENT then
	CustomizableWeaponry_KK.ins2.flashlight.v6.white = Color(255,255,255)
	CustomizableWeaponry_KK.ins2.flashlight.v6.texture = "effects/flashlight001"

	function CustomizableWeaponry_KK.ins2.flashlight.v6:Think()
		for _,wep in pairs(ents.GetAll()) do
			if not wep.CW20Weapon then
				continue
			end

			// if swep has attachment ...
			if not self:getFL(wep) then
				continue
			end

			// ... but no ProjectedTexture, create it
			if IsValid(wep._KK_INS2_CL_FL) then
				continue
			end

			local pt = ProjectedTexture()
			pt:SetTexture(self.texture)
			pt:SetEnableShadows(true)
			pt:SetFarZ(2048)
			pt:SetFOV(60)

			hook.Add("Think", pt, function()
				// garbage-collect-self
				if !IsValid(wep) then
					pt:Remove()
					return
				end

				local cwAtt = self:getFL(wep)

				// SetNearZ - ON/OFF
				local wepOK = cwAtt and wep.ActiveAttachments[cwAtt.name] and cwAtt.getLEMState(wep)
				local ownOK = !IsValid(wep.Owner) or (IsValid(wep.Owner) and wep.Owner:GetActiveWeapon() == wep)

				if wepOK and ownOK then
					pt:SetNearZ(1)
				else
					pt:SetNearZ(0)
				end

				local wepDropped = !IsValid(wep.Owner)
				local wepOwnedByOther = wep.Owner != LocalPlayer()
				local wepOwnedByLocalThird = wep.Owner == LocalPlayer() and wep.Owner:ShouldDrawLocalPlayer()

				if wepDropped or wepOwnedByOther or wepOwnedByLocalThird then
					local att = wep.WMEnt:GetAttachment(1)

					if att then
						pt:SetAngles(att.Ang)
						pt:SetPos(att.Pos)
					else
						pt:SetAngles(wep.WMEnt:GetAngles())
						pt:SetPos(wep.WMEnt:GetPos())
					end
				end

				// SetColor - CW2 SightColor setting
				local col = wep:getSightColor("kk_ins2_flashlight") or self.white
				pt:SetColor(col)

				// if in fps, position will be updated from ElementRender
				pt:Update()
			end)

			wep._KK_INS2_CL_FL = pt
		end
	end

	hook.Add("Think", CustomizableWeaponry_KK.ins2.flashlight.v6, CustomizableWeaponry_KK.ins2.flashlight.v6.Think)

	function CustomizableWeaponry_KK.ins2.flashlight.v6.elementRender(wep, attBeamSource)
		if not attBeamSource then return end
		if !IsValid(wep._KK_INS2_CL_FL) then return end

		wep._KK_INS2_CL_FL:SetAngles(attBeamSource.Ang)
		wep._KK_INS2_CL_FL:SetPos(attBeamSource.Pos)
	end
end

function CustomizableWeaponry_KK.ins2.flashlight.v6.attach(wep, att)
	-- wep.dt.INS2LAMMode = 0
	wep:SetNWInt("INS2LAMMode", 0)
end

function CustomizableWeaponry_KK.ins2.flashlight.v6:detach()
end
