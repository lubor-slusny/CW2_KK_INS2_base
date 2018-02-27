

CustomizableWeaponry_KK.ins2.stencilSight = CustomizableWeaponry_KK.ins2.stencilSight or {}

CustomizableWeaponry_KK.ins2.stencilSight.lenses = {}
CustomizableWeaponry_KK.ins2.stencilSight.lenses["models/weapons/optics/aimpoint_lense"] = true
CustomizableWeaponry_KK.ins2.stencilSight.lenses["models/weapons/optics/kobra_lense"] = true
CustomizableWeaponry_KK.ins2.stencilSight.lenses["models/weapons/optics/eotech_lense"] = true
CustomizableWeaponry_KK.ins2.stencilSight.lenses["models/weapons/attachments/cw_kk_ins2_cstm_barska/barska_lense"] = true
CustomizableWeaponry_KK.ins2.stencilSight.lenses["models/weapons/upgrades/eotech_556/eotech_glass"] = true

local strStencil = "models/weapons/attachments/cw_kk_ins2_shared/stencil"
local strNoDraw = "models/weapons/attachments/cw_kk_ins2_shared/nodraw"

CustomizableWeaponry_KK.ins2.stencilSight.lenses[strStencil] = true
CustomizableWeaponry_KK.ins2.stencilSight.lenses[strNoDraw] = false

function CustomizableWeaponry_KK.ins2.stencilSight:_drawStencilEnt(wep, v)
	if not v then
		return
	end

	if not v.stencilEnt then
		v.stencilEnt = wep:createManagedCModel(v.ent:GetModel(), RENDERGROUP_BOTH)
		v.stencilEnt:SetNoDraw(true)

		if v.size then
			v.matrix = Matrix()
			v.matrix:Scale(v.size)
			v.stencilEnt:EnableMatrix("RenderMultiply", v.matrix)
		end

		if v.bodygroups then
			for main, sec in pairs(v.bodygroups) do
				v.stencilEnt:SetBodygroup(main, sec)
			end
		end

		v.stencilEnt:SetupBones()

		if v.merge then
			v.stencilEnt:SetParent(v.ent:GetParent())
			v.stencilEnt:AddEffects(EF_BONEMERGE)
			v.stencilEnt:AddEffects(EF_BONEMERGE_FASTCULL)
		end

		for i,m in pairs(v.stencilEnt:GetMaterials()) do
			if self.lenses[m] then
				v.stencilEnt:SetSubMaterial(i - 1, strStencil)
			else
				v.stencilEnt:SetSubMaterial(i - 1, strNoDraw)
			end
		end
	else
		if not v.merge then
			v.stencilEnt:SetPos(v.ent:GetPos())
			v.stencilEnt:SetAngles(v.ent:GetAngles())
		end

		v.stencilEnt:SetSequence(v.ent:GetSequence())
		v.stencilEnt:DrawModel()
	end
end

local iMatDot = Material("cw2/reticles/aim_reticule")

local colBlue = Color(0,255,0)
local colWhite = Color(255,255,255)
local colWhiteTr = Color(255,255,255,123)

local cvFreeze = CustomizableWeaponry_KK.ins2.conVars.other["cw_kk_freeze_reticles"]
local cvAnimated = CustomizableWeaponry_KK.ins2.conVars.main["cw_kk_ins2_animate_reticle"]

local CW2ATTS = CustomizableWeaponry.registeredAttachmentsSKey

local attachmEnt, retAtt
local retSize, retDist, retPos, retNorm, retAng
local EA, nearWallOutTime

function CustomizableWeaponry_KK.ins2.stencilSight:elementRender(wep, att)
	if not wep then return end
	if not att then return end
	if not wep.ActiveAttachments[att.name] then return end

	if not wep.AttachmentModelsVM then return end
	if not wep.AttachmentModelsVM[att.name] then return end

	local element = wep.AttachmentModelsVM[att.name]
	local elements = element.models or {element}

	for _,element in pairs(elements) do
		attachmEnt = element.ent
		retAtt = attachmEnt:GetAttachment(element.reticleAtt or 1)

		if not retAtt then
			continue
		end

		retSize = att._reticleSize * (element.retSizeMult or 1)

		render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilFailOperation(STENCILOPERATION_KEEP)
		render.SetStencilZFailOperation(STENCILOPERATION_KEEP)

		self:_drawStencilEnt(wep, element)

		render.SetStencilWriteMask(2)
		render.SetStencilTestMask(2)
		render.SetStencilReferenceValue(2)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		retDist = (retAtt.Pos:Distance(EyePos())) * 50
		retPos = retAtt.Pos + retAtt.Ang:Forward() * retDist

		render.SetMaterial(iMatDot)

		if cvFreeze:GetInt() == 1 then
			cam.IgnoreZ(true)
				render.DrawSprite(retPos, retSize/2, retSize/2, colBlue)
				render.DrawSprite(retPos, retSize/2, retSize/2, colBlue)
				render.DrawSprite(retPos, retSize/6, retSize/6, colWhite)
				render.DrawSprite(retPos, retSize/6, retSize/6, colWhite)
			cam.IgnoreZ(false)
		end

		if wep:isNearWall() or (wep.IsOwnerCrawling and wep:IsOwnerCrawling()) then
			nearWallOutTime = CurTime() + 0.3
		elseif not nearWallOutTime then
			nearWallOutTime = CurTime()
		end

		if (cvAnimated:GetInt() != 1 or cvFreeze:GetInt() == 1) or (!wep:isAiming() and wep.dt.BipodDeployed) then
			if wep:isReticleActive() and nearWallOutTime < CurTime() then //
				EA = wep:getReticleAngles()
				retPos = EyePos() + EA:Forward() * retDist
			end
		end

		retNorm = retAtt.Ang:Forward()
		retAng = 90 + retAtt.Ang.z

		cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)
				render.SetMaterial(att._reticle)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, colWhite, retAng)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, colWhiteTr, retAng)
			render.CullMode(MATERIAL_CULLMODE_CCW)
		cam.IgnoreZ(false)

		render.SetStencilEnable(false)
	end
end

local colMainReticle = Color(255,255,255,255)
local colTopReticle = Color(255,255,255,255)
local colFallback = Color(255,0,255,255)

local rc

function CustomizableWeaponry_KK.ins2.stencilSight:elementRenderColorable(wep, att)
	if true then
		self:elementRender(wep, att)
	end

	if not wep then return end
	if not att then return end
	if not wep.ActiveAttachments[att.name] then return end

	if not wep.AttachmentModelsVM then return end
	if not wep.AttachmentModelsVM[att.name] then return end

	local element = wep.AttachmentModelsVM[att.name]
	local elements = element.models or {element}

	for _,element in pairs(elements) do
		attachmEnt = element.ent
		retAtt = attachmEnt:GetAttachment(element.reticleAtt or 1)

		if not retAtt then
			continue
		end

		retSize = att._reticleSize * (element.retSizeMult or 1)

		render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_ALWAYS)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilFailOperation(STENCILOPERATION_KEEP)
		render.SetStencilZFailOperation(STENCILOPERATION_KEEP)

		self:_drawStencilEnt(wep, element)

		render.SetStencilWriteMask(2)
		render.SetStencilTestMask(2)
		render.SetStencilReferenceValue(2)
		render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
		render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		retDist = (retAtt.Pos:Distance(EyePos())) * 50
		retPos = retAtt.Pos + retAtt.Ang:Forward() * retDist

		render.SetMaterial(iMatDot)

		if cvFreeze:GetInt() == 1 then
			cam.IgnoreZ(true)
				render.DrawSprite(retPos, retSize/2, retSize/2, colBlue)
				render.DrawSprite(retPos, retSize/2, retSize/2, colBlue)
				render.DrawSprite(retPos, retSize/6, retSize/6, colWhite)
				render.DrawSprite(retPos, retSize/6, retSize/6, colWhite)
			cam.IgnoreZ(false)
		end

		if wep:isNearWall() or (wep.IsOwnerCrawling and wep:IsOwnerCrawling()) then
			nearWallOutTime = CurTime() + 0.3
		elseif not nearWallOutTime then
			nearWallOutTime = CurTime()
		end

		if (cvAnimated:GetInt() != 1 or cvFreeze:GetInt() == 1) or (!wep:isAiming() and wep.dt.BipodDeployed) then
			if wep:isReticleActive() and nearWallOutTime < CurTime() then
				EA = wep:getReticleAngles()
				retPos = EyePos() + EA:Forward() * retDist
			end
		end

		retNorm = retAtt.Ang:Forward()
		retAng = 90 + retAtt.Ang.z

		cam.IgnoreZ(true)
			render.CullMode(MATERIAL_CULLMODE_CW)

				rc = wep:getSightColor(att.name) or colFallback
				colMainReticle.r = rc.r
				colMainReticle.g = rc.g
				colMainReticle.b = rc.b

				render.SetMaterial(att._reticleCol or att._reticle)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, colMainReticle, retAng)

				-- local m = math.sqrt(rc.r * rc.r + rc.g * rc.g + rc.b * rc.b)

				colTopReticle.r = math.sqrt(rc.r) + 150
				colTopReticle.g = math.sqrt(rc.g) + 150
				colTopReticle.b = math.sqrt(rc.b) + 150

				render.SetMaterial(att._reticleTop)
				render.DrawQuadEasy(retPos, retNorm, retSize, retSize, colTopReticle, retAng)

			render.CullMode(MATERIAL_CULLMODE_CCW)
		cam.IgnoreZ(false)

		render.SetStencilEnable(false)
	end
end
