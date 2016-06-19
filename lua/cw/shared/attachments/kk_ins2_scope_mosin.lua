local att = {}
att.name = "kk_ins2_scope_mosin"
att.displayNameShort = "Mosin"
att.displayName = "Mosin Scope"
att.aimPos = {"KKINS2ScopeMosinPos", "KKINS2ScopeMosinAng"}
att.FOVModifier = 0
att.AimViewModelFOV = 25
att.isSight = true

-- att.colorType = CustomizableWeaponry.colorableParts.COLOR_TYPE_SIGHT

att.statModifiers = {
	OverallMouseSensMult = -0.1
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/" .. att.name)
	att.description = {
		[1] = {t = "Provides 7x magnification.", c = CustomizableWeaponry.textColors.POSITIVE},
		[2] = {t = "Narrow scope reduces awareness.", c = CustomizableWeaponry.textColors.NEGATIVE},
		[3] = {t = "Can be disorienting at close range.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}
	
	local path = "models/weapons/optics/mosin_crosshair"
	
	att.zoomTextures = {
		{tex = surface.GetTextureID(path), offset = {0, 1}},
	}
	
	att._rtFov = 6
	att._rtReticle = surface.GetTextureID(path)
	att._reticleMat = Material(path)
	
	function att:drawRenderTarget()
		local attachmEnt = self.AttachmentModelsVM[att.name].ent // to b tuned
		if self:isAiming() then 
			attachmEnt:SetSequence(2)
		else
			attachmEnt:SetSequence(1)
		end
		
		CustomizableWeaponry_KK.ins2.renderTargetSight(self, att)
	end
	
	function att:elementRender()
		CustomizableWeaponry_KK.ins2.renderTargetSightStencil(self, att)
	end
end

function att:attachFunc()
	self.OverrideAimMouseSens = 0.1
	self.SimpleTelescopicsFOV = 70
	self.AimViewModelFOV = 50
	self.BlurOnAim = true
	self.ZoomTextures = att.zoomTextures
end

function att:detachFunc()
	self.OverrideAimMouseSens = nil
	self.SimpleTelescopicsFOV = nil
	self.AimViewModelFOV = self.AimViewModelFOV_Orig
	self.BlurOnAim = false
end

CustomizableWeaponry:registerAttachment(att)