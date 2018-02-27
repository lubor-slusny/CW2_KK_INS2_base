
// V6 FLASHLIGHT

CustomizableWeaponry_KK.ins2.flashlight.v7 = CustomizableWeaponry_KK.ins2.flashlight.v7 or {}
setmetatable(CustomizableWeaponry_KK.ins2.flashlight.v7, CustomizableWeaponry_KK.ins2.flashlight)

if CLIENT then
	CustomizableWeaponry_KK.ins2.flashlight.v7.white = Color(255,255,255)
	CustomizableWeaponry_KK.ins2.flashlight.v7.texture = "effects/flashlight001"

	function CustomizableWeaponry_KK.ins2.flashlight.v7:Think()
		for _,wep in pairs(ents.GetAll()) do
			if not wep.CW20Weapon then
				continue
			end

			if not self:getFL(wep) then
				continue
			end

			if not wep._KK_INS2_FL_SRCS then
				continue
			end

			for src,_ in pairs(wep._KK_INS2_FL_SRCS) do
				if not IsValid(src) then
					return
				end

				if IsValid(wep._KK_INS2_FLS[src]) then
					continue
				end

				local pt = ProjectedTexture()
				pt:SetTexture(self.texture)
				pt:SetEnableShadows(true)
				pt:SetFarZ(2048)
				pt:SetFOV(60)

				hook.Add("Think", pt, function()
					// garbage-collect-self
						// if parent wep was removed or
						// source element ent is not being used
					if !IsValid(wep) or !IsValid(wep._KK_INS2_FL_SRCS[src]) then
						pt:Remove()
						return
					end

					// im outta variable identifiers here
					local carrier = self:getFL(wep)

					// SetNearZ - ON/OFF
					local wepOK = carrier and wep.ActiveAttachments[carrier.name] and carrier.getLEMState(wep)
					local ownOK = !IsValid(wep.Owner) or (IsValid(wep.Owner) and wep.Owner:GetActiveWeapon() == wep)

					if wepOK and ownOK then
						pt:SetNearZ(1)
					else
						pt:SetNearZ(0)
					end

					// if dropped or in 3rd person, update pos
					local nowner = !IsValid(wep.Owner) // dropped
					local fowner = wep.Owner != LocalPlayer()
					local lowner = wep.Owner == LocalPlayer() and wep.Owner:ShouldDrawLocalPlayer() // local player owns but in 3rd person

					if nowner or fowner or lowner then
						print(wep, "in third person")
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

				wep._KK_INS2_FLS[src] = pt
			end
		end
	end

	hook.Add("Think", CustomizableWeaponry_KK.ins2.flashlight.v7, CustomizableWeaponry_KK.ins2.flashlight.v7.Think)

	function CustomizableWeaponry_KK.ins2.flashlight.v7.elementRender(wep, beamAtt, ent)
		if not IsValid(ent) then return end
		if not beamAtt then return end

		local pt = wep._KK_INS2_FLS[ent]

		if IsValid(pt) then
			pt:SetAngles(beamAtt.Ang)
			pt:SetPos(beamAtt.Pos)
			pt:Update()
		else
			wep._KK_INS2_FL_SRCS[ent] = ent
		end
	end
end

function CustomizableWeaponry_KK.ins2.flashlight.v7.attach(wep, att)
	wep:SetNWInt("INS2LAMMode", 0)
	wep._KK_INS2_FL_SRCS = {}
	wep._KK_INS2_FLS = {}
end

function CustomizableWeaponry_KK.ins2.flashlight.v7:detach(wep)
	wep._KK_INS2_FL_SRCS = nil
	wep._KK_INS2_FLS = nil
end
