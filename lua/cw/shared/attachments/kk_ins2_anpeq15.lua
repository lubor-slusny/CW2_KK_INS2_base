local att = {}
att.name = "kk_ins2_anpeq15"
att.displayNameShort = "ATPIAL"
att.displayName = "AN/PEQ-15"

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

	local laserAtt, lightAtt

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end

		local mode = self:GetNWInt("INS2LAMMode")
		local element = self.AttachmentModelsVM[att.name]

		if element then
			laserAtt = element.ent:GetAttachment(element.laserAtt or 1) or nil
			lightAtt = element.ent:GetAttachment(element.lightAtt or 2) or nil
			lightEnt = element.ent
		else
			laserAtt = self.AttachmentModelsVM["kk_ins2_lam"].ent:GetAttachment(1)
			lightAtt = self.AttachmentModelsVM["kk_ins2_flashlight"].ent:GetAttachment(1)
			lightEnt = self.AttachmentModelsVM["kk_ins2_flashlight"].ent
		end

		if (mode % 2) == 1 then
			CustomizableWeaponry.registeredAttachmentsSKey["kk_ins2_lam"]._elementRender(self, laserAtt)
		else
			self.lastLaserPos = nil
		end

		CustomizableWeaponry_KK.ins2.flashlight.v7.elementRender(self, lightAtt, lightEnt)
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
