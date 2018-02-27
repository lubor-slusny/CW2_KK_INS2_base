local att = {}
att.name = "kk_ins2_m6x"
att.displayName = "M6X Tactical Laser Illuminator"
att.displayNameShort = "M6X"

att.statModifiers = {
	VelocitySensitivityMult = -0.2,
	// OverallMouseSensMult = -0.2,
	HipSpreadMult = -0.2,
	DrawSpeedMult = -0.1,
	MaxSpreadIncMult = -0.25
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "[impulse 100] cycles through modes.", c = CustomizableWeaponry.textColors.REGULAR},
		[2] = {t = "Uses LAM/LEM colors.", c = CustomizableWeaponry.textColors.REGULAR},
	}

	local lastLaserPos = {}

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end

		local laserAtts, lightAtts = {}, {}
		local mode = self:GetNWInt("INS2LAMMode")
		local element = self.AttachmentModelsVM[att.name]

		if element then
			if IsValid(element.ent) then
				laserAtts[element.ent] = element.ent:GetAttachment(element.laserAtt or 1)
				lightAtts[element.ent] = element.ent:GetAttachment(element.lightAtt or 2)
			end

			if element.models then
				for _,element in pairs(element.models) do
					if IsValid(element.ent) then
						laserAtts[element.ent] = element.ent:GetAttachment(element.laserAtt or 1) or nil
						lightAtts[element.ent] = element.ent:GetAttachment(element.lightAtt or 2) or nil
					end
				end
			end
		else
			element = self.AttachmentModelsVM["kk_ins2_lam"]
			if element != nil and IsValid(element.ent) then
				laserAtts[element.ent] = element.ent:GetAttachment(element.laserAtt or 1)
			end

			element = self.AttachmentModelsVM["kk_ins2_flashlight"]
			if element != nil and IsValid(element.ent) then
				lightAtts[element.ent] = element.ent:GetAttachment(element.lightAtt or 1)
			end
		end

		if (mode % 2) == 1 then
			for ent,laserAtt in pairs(laserAtts) do
				self.lastLaserPos = lastLaserPos[ent]
				CustomizableWeaponry.registeredAttachmentsSKey["kk_ins2_lam"]._elementRender(self, laserAtt)
				lastLaserPos[ent] = self.lastLaserPos
			end
		else
			lastLaserPos = {}
		end

		for ent,lightAtt in pairs(lightAtts) do
			CustomizableWeaponry_KK.ins2.flashlight.v7.elementRender(self, lightAtt, ent)
		end
	end

	// for V6 LEM, true - ON, false - OFF
	function att:getLEMState()
		return (self:GetNWInt("INS2LAMMode") > 1)
	end
end

function att:attachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v7.attach(self, att)

	if CLIENT then
		if not self.AttachmentModelsVM[att.name] then
			self.AttachmentModelsVM["kk_ins2_flashlight"].active = true
			self.AttachmentModelsVM["kk_ins2_lam"].active = true
		end
	end
end

function att:detachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v7.detach(self, att)

	if CLIENT then
		if not self.AttachmentModelsVM[att.name] then
			self.AttachmentModelsVM["kk_ins2_flashlight"].active = false
			self.AttachmentModelsVM["kk_ins2_lam"].active = false
		end
	end
end

CustomizableWeaponry:registerAttachment(att)
