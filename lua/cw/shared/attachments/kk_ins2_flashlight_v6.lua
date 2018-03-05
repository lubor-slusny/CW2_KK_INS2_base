local att = {}
att.name = "kk_ins2_flashlight"
att.displayName = "Light Emitting Module v6.2"
att.displayNameShort = "LEM6"
att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_KK_FLASHLIGHT

att.statModifiers = {
	// OverallMouseSensMult = -0.05
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "[impulse 100] toggles on/off.", c = CustomizableWeaponry.textColors.REGULAR},
		[2] = {t = "100% clientside projected texture.", c = CustomizableWeaponry.textColors.VPOSITIVE},
	}

	att.reticle = "cw2/reticles/aim_reticule"

	local model, beamAtt

	function att:elementRender()
		if not self.ActiveAttachments[att.name] then return end

		beamAtts = {}

		if self.KK_INS2_FL_SRC_OVERRIDE then
			beamAtts[self.Owner] = self:KK_INS2_FL_SRC_OVERRIDE()
		end

		local element = self.AttachmentModelsVM[att.name]

		if element and IsValid(element.ent) then
			beamAtts[element.ent] = element.ent:GetAttachment(element.lightAtt or 1)
		end

		if element and element.models then
			for _,subElement in pairs(element.models) do
				if IsValid(subElement.ent) then
					beamAtts[subElement.ent] = subElement.ent:GetAttachment(subElement.lightAtt or 1)
				end
			end
		end

		if table.Count(beamAtts) < 1 then
			beamAtts[self.CW_VM] = self.CW_VM:GetAttachment(self.lightAtt or 1)
		end

		for ent,beamAtt in pairs(beamAtts) do
			CustomizableWeaponry_KK.ins2.flashlight.v7.elementRender(self, beamAtt, ent)
		end
	end

	// for V6 LEM, true - ON, false - OFF
	function att:getLEMState()
		return (self:GetNWInt("INS2LAMMode") % 2) != 0
	end
end

function att:attachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v7.attach(self, att)
end

function att:detachFunc()
	CustomizableWeaponry_KK.ins2.flashlight.v7.detach(self, att)
end

if CLIENT then
	CustomizableWeaponry:createStatText(att)
end

CustomizableWeaponry:registerAttachment(att)
