if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "AKM"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "b"
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.Shell = "KK_INS2_762x39"
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_modkit_06.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["handguardStandard"] = {model = "models/weapons/upgrades/a_standard_akm.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_ins2_pbs1"] = {model = "models/weapons/upgrades/a_suppressor_ak.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/a_woodgrips_akm.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_gl_gp25"] = {model = "models/weapons/upgrades/a_gl_gp25.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_band.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_band.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_band.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/a_optic_aimp2x.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_cmore.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_compm4s.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_microt1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_acog_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_eotechxps.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}

	SWEP.AttachmentModelsWM = {
		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/w_modkit_6.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["handguardStandard"] = {model = "models/weapons/upgrades/w_standard_akm.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_ins2_pbs1"] = {model = "models/weapons/upgrades/w_sil_ins1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/w_foregrip_wood_1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_gl_gp25"] = {model = "models/weapons/upgrades/w_gp25.mdl", attachment = "gl", pos = Vector(-10.75,0.2,0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_ins.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_ins.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/w_magaim.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/w_elcan.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/w_kobra.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/w_po.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_cmore.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_acog.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_eotechxps.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.296, -2, 0.062)
	SWEP.IronsightAng = Vector(1.3, 0.07, 0)
	
	SWEP.M203Pos = Vector(-1.0384, -4, 0.8356)
	SWEP.M203Ang = Vector(1.0281, -0.0059, 0)
	
	SWEP.KKINS2KobraPos = Vector(-2.3112, -2, -0.5898)
	SWEP.KKINS2KobraAng = Vector(0, 0, 0)

	SWEP.KKINS2EoTechPos = Vector(-2.3111, -2, -0.5139)
	SWEP.KKINS2EoTechAng = Vector(0, 0, 0)

	SWEP.KKINS2AimpointPos = Vector(-2.3114, -2, -0.4725)
	SWEP.KKINS2AimpointAng = Vector(0, 0, 0)

	SWEP.KKINS2ElcanPos = Vector(-2.3106, -2, -0.606)
	SWEP.KKINS2ElcanAng = Vector(0, 0, 0)

	SWEP.KKINS2PO4Pos = Vector(-2.2519, -2, -0.4049)
	SWEP.KKINS2PO4Ang = Vector(0, 0, 0)

	SWEP.KKINS2MagnifierPos = Vector(-2.3084, -1, -0.5088)
	SWEP.KKINS2MagnifierAng = Vector(0, 0, 0)

	SWEP.KKINS2CSTMCMorePos = Vector(-2.3163, -2, -0.4865)
	SWEP.KKINS2CSTMCMoreAng = Vector(0, 0, 0)

	SWEP.KKINS2CSTMBarskaPos = Vector(-2.3111, -2, -0.5139)
	SWEP.KKINS2CSTMBarskaAng = Vector(0, 0, 0)

	SWEP.KKINS2CSTMMicroT1Pos = Vector(-2.305, -2, -0.4975)
	SWEP.KKINS2CSTMMicroT1Ang = Vector(0, 0, 0)

	SWEP.KKINS2CSTMEoTechXPSPos = Vector(-2.3111, -2, -0.5139)
	SWEP.KKINS2CSTMEoTechXPSAng = Vector(0, 0, 0)

	SWEP.KKINS2CSTMCompM4SPos = Vector(-2.305, -2, -0.488)
	SWEP.KKINS2CSTMCompM4SAng = Vector(0, 0, 0)

	SWEP.KKINS2CSTMACOGPos = Vector(-2.3106, -3, -0.606)
	SWEP.KKINS2CSTMACOGAng = Vector(0, 0, 0)
end

SWEP.Attachments = {
	{header = "Sight", offset = {400, -450}, atts = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_po4", "kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_microt1", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"}},
	{header = "Barrel", offset = {-100, -450}, atts = {"kk_ins2_pbs1"}},
	{header = "Under", offset = {-400, 0}, atts = {"kk_ins2_vertgrip", "kk_ins2_gl_gp25"}},
	{header = "Lasers", offset = {200, 400}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_anpeq15"}},
	{header = "More Sight", offset = {1000, 0}, atts = {"kk_ins2_magnifier"}, dependencies = CustomizableWeaponry_KK.ins2.magnifierDependencies},
	["+use"] = {header = "Sight Contract", offset = {400, -0}, atts = {"kk_ins2_sights_cstm"}},
	["+reload"] = {header = "Ammo", offset = {900, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_fire = "base_fire",
	base_fire_aim = {"iron_fire","iron_fire_a","iron_fire_b","iron_fire_c","iron_fire_d","iron_fire_e","iron_fire_f"},
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_holster = "base_holster",
	base_firemode = "base_fireselect",
	base_firemode_aim = "iron_fireselect",
	base_sprint = "base_sprint",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	
	foregrip_pickup = "foregrip_ready",
	foregrip_draw = "foregrip_draw",
	foregrip_fire = "foregrip_fire",
	foregrip_fire_aim = "foregrip_iron_fire",
	foregrip_fire_empty = "foregrip_dryfire",
	foregrip_fire_empty_aim = "foregrip_iron_dryfire_b",
	foregrip_reload = "foregrip_reload",
	foregrip_reload_empty = "foregrip_reloadempty",
	foregrip_idle = "foregrip_draw",
	foregrip_holster = "foregrip_holster",
	foregrip_firemode = "foregrip_fireselect",
	foregrip_firemode_aim = "foregrip_iron_fireselect",
	foregrip_sprint = "foregrip_sprint",
	foregrip_safe = "foregrip_down",
	foregrip_safe_aim = "foregrip_iron_down",
	
	gl_off_pickup = "gl_ready",
	gl_off_draw = "gl_draw",
	gl_off_fire = "gl_fire",
	gl_off_fire_aim = {"gl_iron_fire","gl_iron_fire_a","gl_iron_fire_b","gl_iron_fire_c","gl_iron_fire_d","gl_iron_fire_e","gl_iron_fire_f"},
	gl_off_fire_empty = "gl_dryfire",
	gl_off_fire_empty_aim = "gl_iron_dryfire_b",
	gl_off_reload = "gl_reload",
	gl_off_reload_empty = "gl_reloadempty",
	gl_off_idle = "gl_draw",
	gl_off_holster = "gl_holster",
	gl_off_firemode = "gl_fireselect",
	gl_off_firemode_aim = "gl_iron_fireselect_b",
	gl_off_sprint = "gl_sprint",
	gl_off_safe = "gl_down",
	gl_off_safe_aim = "gl_iron_down",
	
	gl_on_draw = "glsetup_draw",
	gl_on_fire = "glsetup_fire",
	gl_on_fire_aim = "glsetup_iron_fire",
	gl_on_fire_empty = "glsetup_dryfire",
	gl_on_fire_empty_aim = "glsetup_iron_dryfire",
	gl_on_reload = "glsetup_reload",
	gl_on_idle = "glsetup_draw",
	gl_on_holster = "glsetup_holster",
	gl_on_sprint = "glsetup_sprint",
	gl_on_safe = "glsetup_down",
	gl_on_safe_aim = "glsetup_iron_down",
	
	gl_turn_on = "glsetup_in",
	gl_turn_off = "glsetup_out",
}

SWEP.ReloadTimes = {
	base_reload = {2.2, 3.15},
	base_reloadempty = {2.2, 4.35},
	foregrip_reload = {2.2, 3.15},
	foregrip_reloadempty = {2.2, 4.35},
	gl_reload = {2.2, 3.15},
	gl_reloadempty = {2.2, 4.35},
	glsetup_reload = {1.75, 2.67}
}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_akm.mdl"
SWEP.WorldModel		= "models/weapons/w_akm.mdl"

SWEP.WMPos = Vector(5.666, 0.66, -1.055)
SWEP.WMAng = Angle(-10, 0, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenades.f1
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnives.gurkha
SWEP.CW_KK_40MM_MDL = "models/weapons/upgrades/a_projectile_gp25.mdl"

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x39MM"

SWEP.FireDelay = 0.092307692307692
SWEP.FireSound = "CW_KK_INS2_AKM_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_AKM_FIRE_SUPPRESSED"

SWEP.Recoil = 1.2
SWEP.HipSpread = 0.043
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadPerShot = 0.007
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 33

SWEP.DeployTime = 0.6

SWEP.FirstDeployTime = 2
SWEP.WeaponLength = 22

if CLIENT then 
	function SWEP:updateOtherParts()
		self.AttachmentModelsVM.handguardStandard.active = !self.ActiveAttachments.kk_ins2_vertgrip
			
		-- local hasInstalledScope = self:getActiveAttachmentInCategory(1) != nil
		-- local isBipod = self.dt.INS2GLActive //self.dt.BipodDeployed
		
		-- //bipod aimpos switch
		-- if self.ActiveAttachments.kk_ins2_magnifier then
			-- local name = "KKINS2Magnifier"
			-- if isBipod then
				-- self[name .. "Pos"] = self[name .. "Pos_gl"]
				-- self[name .. "Ang"] = self[name .. "Ang_gl"]
			-- else
				-- self[name .. "Pos"] = self[name .. "Pos_def"]
				-- self[name .. "Ang"] = self[name .. "Ang_def"]
			-- end
			-- self.AimPos = self[name .. "Pos"]
			-- self.AimAng = self[name .. "Ang"]
		-- elseif hasInstalledScope then
			-- local sight = CustomizableWeaponry.sights[self:getActiveAttachmentInCategory(1)]
			-- if isBipod then
				-- self[sight.aimPos[1]] = self[sight.aimPos[1] .. "_gl"]
				-- self[sight.aimPos[2]] = self[sight.aimPos[2] .. "_gl"]
			-- else
				-- self[sight.aimPos[1]] = self[sight.aimPos[1] .. "_def"]
				-- self[sight.aimPos[2]] = self[sight.aimPos[2] .. "_def"]
			-- end
			-- self.AimPos = self[sight.aimPos[1]]
			-- self.AimAng = self[sight.aimPos[2]]
		-- else
			-- if isBipod then
				-- self.IronsightPos = self.IronsightPos_gl
				-- self.IronsightAng = self.IronsightAng_gl
			-- else
				-- self.IronsightPos = self.IronsightPos_def
				-- self.IronsightAng = self.IronsightAng_def
			-- end
			-- self.AimPos = self.IronsightPos
			-- self.AimAng = self.IronsightAng
		-- end
		
		-- if self.ActiveAttachments.kk_ins2_gl_gp25 then
			-- self.AttachmentModelsVM.ins_gl_gp30.active = true
		-- else
			-- self.AttachmentModelsVM.ins_gl_gp30.active = false
		-- end
				
		-- if self.dt.INS2GLActive then
			-- self.AimPos = self.IronsightPos_gl
			-- self.AimAng = self.IronsightAng_gl
			-- self.AimPos = Vector(-2.1406, -6, -1.0247)
			-- self.AimAng = Vector(8.1154, -0.1384, -1)
		-- else
			-- if self.ActiveAttachments.kk_ins2_magnifier then
				-- local name = "KKINS2Magnifier"
				-- self.AimPos = self[name .. "Pos"]
				-- self.AimAng = self[name .. "Ang"]
			-- elseif self:getActiveAttachmentInCategory(1) != nil then
				-- local sight = CustomizableWeaponry.sights[self:getActiveAttachmentInCategory(1)]
				-- self.AimPos = self[sight.aimPos[1]]
				-- self.AimAng = self[sight.aimPos[2]]
			-- else
				-- self.AimPos = self.IronsightPos
				-- self.AimAng = self.IronsightAng
			-- end
		-- end
		
		local hasInstalledScope = self:getActiveAttachmentInCategory(1) != nil
		local isGL = self.dt.INS2GLActive
		
		// bipod aimpos switch // 3rd iteration kek
		if self.ActiveAttachments.kk_ins2_magnifier then
			local name = "KKINS2Magnifier"
			if isGL then
				self.AimPos = self.M203Pos
				self.AimAng = self.M203Ang
			else
				self.AimPos = self[name .. "Pos"]
				self.AimAng = self[name .. "Ang"]
			end
		elseif hasInstalledScope then
			local sight = CustomizableWeaponry.sights[self:getActiveAttachmentInCategory(1)]
			if isGL then
				self.AimPos = self.M203Pos
				self.AimAng = self.M203Ang
			else
				self.AimPos = self[sight.aimPos[1]]
				self.AimAng = self[sight.aimPos[2]]
			end
		else
			if isGL then
				self.AimPos = self.M203Pos
				self.AimAng = self.M203Ang
			else
				self.AimPos = self.IronsightPos
				self.AimAng = self.IronsightAng
			end
		end
		
	end
end