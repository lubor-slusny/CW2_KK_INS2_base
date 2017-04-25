if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Lods-Emone"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_enfield")
	
	SWEP.NoShells = true
	SWEP.Shell = "KK_INS2_762x54"
	-- SWEP.ShellDelay = 0.7
	
	SWEP.BackupSights = {
		["kk_ins2_scope_m82"] = {
			Vector(-2.5678, -3, 1.5173),
			Vector(-0.1284, 0, 0)
		},
	}
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/a_iron_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		["bg_foldsight"] = {model = "models/weapons/attachments/v_iron_enfield_up.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["sleeve"] = {model = "models/weapons/upgrades/a_clothwrap_enfield.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_ww2_stripper"] = {model = "models/weapons/upgrades/a_enfield_stripper_clip.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/a_enfield_bayonet.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_ww2_knife_fat"] = {model = "models/weapons/upgrades/a_enfield_bayonet_spike.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_gl_enfield"] = {model = "models/weapons/upgrades/a_enfield_gl.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["ani_body"] = {model = "models/weapons/v_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, hideVM = true, active = true},
		["kk_ins2_ww2_sling"] = {model = "models/weapons/upgrades/a_sling_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, rel = "ani_body"},
		-- ["kk_ins2_ww2_sling"] = {model = "models/weapons/upgrades/a_sling_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_enfield"] = {model = "models/weapons/upgrades/a_optic_enfield.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_wa5"] = {model = "models/weapons/upgrades/a_optic_enfield_7x.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_m82"] = {model = "models/weapons/upgrades/a_optic_garand.mdl", rLight = true, pos = Vector(-6.8185, -0.963, 0.265), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), bone = "Weapon"},
		["kk_ins2_scope_m82_backup"] = {model = "models/weapons/upgrades/a_iron_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
	}

	SWEP.AttachmentModelsWM = {
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/w_enfield_bayonet.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_ww2_knife_fat"] = {model = "models/weapons/upgrades/w_enfield_bayonet_spike.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["sleeve"] = {model = "models/weapons/upgrades/w_clothwrap_enfield.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_gl_enfield"] = {model = "models/weapons/upgrades/w_enfield_gl.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_enfield"] = {model = "models/weapons/upgrades/w_optic_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_wa5"] = {model = "models/weapons/upgrades/w_optic_enfield.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.5678, -3, 1.5173)
	SWEP.IronsightAng = Vector(-0.1284, 0, 0)

	SWEP.FoldSightPos = Vector(-2.5618, -3, 1.5173)
	SWEP.FoldSightAng = Vector(-0.1284, 0.0305, 0)

	SWEP.KKINS2ScopeEnfieldPos = Vector(-2.5738, -1.5, 0.8389)
	SWEP.KKINS2ScopeEnfieldAng = Vector()

	SWEP.KKINS2ScopeWA5Pos = Vector(-2.563, -4, 1.1737)
	SWEP.KKINS2ScopeWA5Ang = Vector(0, 0, 0)

	SWEP.M203Pos = Vector(-2.71, -6, 1.8053)
	SWEP.M203Ang = Vector(-4.5019, 0, 0)

	SWEP.KKINS2ScopeM82Pos = Vector(-1.7607, -2, 0.9956)
	SWEP.KKINS2ScopeM82Ang = Vector(0, 0, 0)

	SWEP.CustomizationMenuScale = 0.018
end

SWEP.SightBGs = {main = 0, foldsight = 0}

SWEP.MuzzleEffect = "muzzleflash_garand_1p"
SWEP.MuzzleEffectWorld = "muzzleflash_garand_3p"

SWEP.Attachments = {
	{header = "Sight", offset = {500, -500}, atts = {"bg_foldsight", "kk_ins2_scope_m82", "kk_ins2_scope_enfield", "kk_ins2_scope_wa5"}},
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_ww2_knife", "kk_ins2_ww2_knife_fat", "kk_ins2_gl_enfield"}},
	{header = "Stock", offset = {1000, 0}, atts = {"kk_ins2_ww2_sling"}},
	{header = "Clip", offset = {300, 0}, atts = {"kk_ins2_ww2_stripper"}, exclusions = {["kk_ins2_scope_enfield"] = true, ["kk_ins2_scope_wa5"] = true}},
	{header = "Inside", offset = {-400, 0}, atts = {"kk_ins2_ww2_bolt"}},
	{header = "Flavor", offset = {0, 500}, atts = {"kk_ins2_bs"}},
	["+reload"] = {header = "Ammo", offset = {900, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.AttachmentExclusions = {
	["kk_ins2_scope_enfield"] = {"kk_ins2_ww2_stripper"},
	["kk_ins2_scope_wa5"] = {"kk_ins2_ww2_stripper"}
}

SWEP.Animations = {
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "base_draw_empty",
	base_fire = "base_fire_start",
	base_fire_aim = "iron_fire_start",
	base_fire_last = "base_fire_last",
	base_fire_last_aim = "iron_fire_last",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_bolt = "base_fire_end",
	base_bolt_aim = "iron_fire_end",
	base_reload_start = "base_reload_start",
	base_reload_start_empty = "base_reload_start_empty",
	base_insert = "base_reload_insert",
	base_reload_end = "base_reload_end",
	base_reload_end_empty = "base_reload_end",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "base_holster_empty",
	base_sprint = "base_sprint",
	base_sprint_empty = "base_sprint_empty",
	base_sprint_knife = "base_sprint_bayonet",
	base_sprint_knife_empty = "base_sprint_bayonet_empty",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	base_safe_empty = "base_down_empty",
	base_safe_empty_aim = "iron_down_empty",
	base_crawl = "base_crawl",
	base_crawl_empty = "base_crawl_empty",
	base_melee = "base_melee_bash",
	base_melee_empty = "base_melee_bash_empty",
	base_stab = "base_melee_end",
	base_stab_empty = "base_melee_end_empty",

	gl_off_pickup = "base_ready",
	gl_off_draw = "base_draw",
	gl_off_draw_empty = "base_draw_empty",
	gl_off_fire = "base_fire_start",
	gl_off_fire_aim = "iron_fire_start",
	gl_off_fire_last = "base_fire_last",
	gl_off_fire_last_aim = "iron_fire_last",
	gl_off_fire_empty = "base_dryfire",
	gl_off_fire_empty_aim = "iron_dryfire",
	gl_off_bolt = "base_fire_end",
	gl_off_bolt_aim = "iron_fire_end",
	gl_off_reload_start = "base_reload_start",
	gl_off_reload_start_empty = "base_reload_start_empty",
	gl_off_insert = "base_reload_insert",
	gl_off_reload_end = "base_reload_end",
	gl_off_reload_end_empty = "base_reload_end",
	gl_off_idle = "base_idle",
	gl_off_idle_empty = "empty_idle",
	gl_off_holster = "base_holster",
	gl_off_holster_empty = "base_holster_empty",
	gl_off_sprint = "base_sprint",
	gl_off_sprint_empty = "base_sprint_empty",
	gl_off_safe = "base_down",
	gl_off_safe_aim = "iron_down",
	gl_off_safe_empty = "base_down_empty",
	gl_off_safe_empty_aim = "iron_down_empty",
	gl_off_crawl = "base_crawl",
	gl_off_crawl_empty = "base_crawl_empty",
	gl_off_melee = "base_melee_bash",
	gl_off_melee_empty = "base_melee_bash_empty",
	
	gl_on_draw = "glsetup_draw",
	gl_on_draw_empty = "glsetup_draw_empty",
	gl_on_fire = "glsetup_fire",
	gl_on_fire_aim = "glsetup_iron_fire",
	gl_on_fire_empty = "glsetup_dryfire",
	gl_on_fire_empty_aim = "glsetup_iron_dryfire",
	gl_on_reload = "glsetup_reload",
	gl_on_idle = "glsetup",
	gl_on_idle_empty = "glsetup_idle_empty",
	gl_on_holster = "glsetup_holster",
	gl_on_holster_empty = "glsetup_holster_empty",
	gl_on_sprint = "glsetup_sprint",
	gl_on_sprint_empty = "glsetup_sprint_empty",
	gl_on_safe = "glsetup_down",
	gl_on_safe_aim = "glsetup_iron_down",
	gl_on_safe_empty = "glsetup_down_empty",
	gl_on_safe_empty_aim = "glsetup_iron_down_empty",
	gl_on_crawl = "glsetup_crawl",
	gl_on_crawl_empty = "glsetup_crawl_empty",
	
	gl_turn_on_full = "glsetup_in",
	gl_turn_on = "glsetup_in_empty",
	gl_turn_off = "glsetup_out",
	gl_turn_off_empty = "glsetup_out_empty",
	
	// V1
	-- stripper_reload_1 = "base_reload_clip",
	-- stripper_reload_1_empty = "base_reload_full_clip",
	-- stripper_reload_2 = "base_reload_empty_clip",
	
	// V2
	-- base_reload = "base_reload_clip",
	-- base_reload_empty = "base_reload_full_clip",
	-- base_reload_empty_2 = "base_reload_empty_clip",
	
	-- gl_off_reload = "base_reload_clip",
	-- gl_off_reload_empty = "base_reload_full_clip",
	-- gl_off_reload_empty_2 = "base_reload_empty_clip",
	
	// V2k17
	base_reload_stripper_1 = "base_reload_clip",
	base_reload_stripper_1_empty = "base_reload_clip_empty",
	base_reload_stripper_2 = "base_reload_clip2",
	base_reload_stripper_2_empty = "base_reload_clip2_empty",
	
	gl_off_reload_stripper_1 = "base_reload_clip",
	gl_off_reload_stripper_1_empty = "base_reload_clip_empty",
	gl_off_reload_stripper_2 = "base_reload_clip2",
	gl_off_reload_stripper_2_empty = "base_reload_clip2_empty",
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
-- SWEP.ViewModel		= "models/weapons/v_cw_kk_doi_enfield.mdl"
-- SWEP.ViewModel		= "models/weapons/cw_kk_doi/v_enfield.mdl"
SWEP.ViewModel		= "models/weapons/cw_kk_doi/v_enfield_oldgl.mdl"
SWEP.WorldModel		= "models/weapons/w_enfield.mdl"

SWEP.WMPos = Vector(14, 0.5, -3)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.ww2gb
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.ww2gb
SWEP.CW_KK_40MM_MDL = "models/weapons/w_grenade_enfield.mdl"

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP)
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP)

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".303 British"

SWEP.FireDelay = 0.3
SWEP.FireSound = "CW_KK_INS2_DOI_ENFIELD_FIRE"
SWEP.Recoil = 2.5

SWEP.HipSpread = 0.075
SWEP.AimSpread = 0.001
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.2
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 1.6
SWEP.Shots = 1
SWEP.Damage = 61

SWEP.FirstDeployTime = 2.7
SWEP.DeployTime = 0.7
SWEP.HolsterTime = 0.5

SWEP.SnapToIdlePostReload = false

SWEP.Chamberable = false
SWEP.SnapToIdlePostReload = false
SWEP.ReticleInactivityPostFire = SWEP.FireDelay + 0.2
SWEP.GlobalDelayOnShoot = SWEP.FireDelay

SWEP.KK_INS2_EmptyIdle = true
SWEP.KK_INS2_EmptyIdleGL = true
SWEP.WeaponLength = 38

SWEP.MuzzleVelocity = 744

SWEP.ReloadTimes = {
	base_fire_end = {20/38, 1.1},
	iron_fire_end = {16/38, 1.3},
	
	-- base_reload_clip = {90/36, 4.8, KK_INS2_STRIPPERCLIP_UNLOAD_ONE, 29/36},
	-- base_reload_full_clip = {90/36, 4.81},
	-- base_reload_empty_clip = {90/36, 7.39, KK_INS2_STRIPPERCLIP_UNLOAD_ONE, 29/36, 176/36},
	
	base_reload_clip = {90/36, 4.8, KK_INS2_STRIPPERCLIP_UNLOAD_ONE, 29/36},
	base_reload_clip_empty = {90/36, 4.8},
	base_reload_clip2 = {90/36, 7.5, KK_INS2_STRIPPERCLIP_UNLOAD_ONE, 29/36, 176/36},
	base_reload_clip2_empty = {90/36, 7.5, nil, nil, 176/36},
	
	base_reload_start = {29/38.5, 1.12, KK_INS2_SHOTGUN_UNLOAD_ONE},
	base_reload_start_empty = {1.12, 1.12},
	base_reload_insert = {20/40.2, 0.92},
	base_reload_end = {1.30, 1.30},
	
	glsetup_reload = {5.2, 6.62},
	
	glsetup_in = {5.2, 6.62, KK_INS2_RIFLEGL_UNLOAD_ONE, 29/35.5},
	glsetup_in_empty = {5.2, 6.62},
	glsetup_out = {1.8, 5},
	glsetup_out_empty = {2.23, 2.23},
	
	base_melee_bash = {0.3, 0.9},
	base_melee_bash_empty = {0.3, 0.9},
}

-- SWEP.reloadProgressAnimsRaw = {
	-- stripper_reload_1 = true,
	-- stripper_reload_1_empty = true,
	-- stripper_reload_2 = true,
-- }

-- SWEP.reticleInactivityCallbacksRaw = {
	-- ["stripper_reload_1"] = 0.1,
	-- ["stripper_reload_1_empty"] = 0.1,
	-- ["stripper_reload_2"] = 0.1,
-- }

-- function SWEP:overrideReloadAnim()
	-- if self.dt.INS2GLActive then
		-- return "gl_on_reload"
	-- end
	
	-- local clip = self:Clip1()
	
	-- clip = clip > 0 and clip - 1 or clip
	
	-- local loadAmmount = self.getFullestMag and self:getFullestMag() or math.Clamp(self.Owner:GetAmmoCount(self.Primary.Ammo), 0, self.Primary.ClipSize)
	
	-- if loadAmmount - clip < 6 then 
		-- if clip < 1 then
			-- return "stripper_reload_1_empty"
		-- else
			-- return "stripper_reload_1"
		-- end
	-- end
	
	-- return "stripper_reload_2"
-- end

-- if CLIENT then
	-- local one = Vector(1, 1, 1)
	-- local zero = Vector()
	
	-- function SWEP:updateOtherParts()
		-- self.CW_VM:ManipulateBoneScale(80, (self.Sequence == self.Animations.stripper_reload_1_empty) and zero or one)
	-- end
-- end

-- function SWEP:IndividualInitialize()
	-- self.magType = "NONE"
	-- self.ShotgunReload = true
-- end

SWEP.magType = "NONE"
SWEP.ShotgunReload = true

if CLIENT then
	function SWEP:updateStandardParts()
		-- self:setElementActive("sleeve", 
			-- self.ActiveAttachments.kk_ins2_scope_enfield
			-- or self.ActiveAttachments.kk_ins2_scope_m82
		-- )
		
		self:setElementActive("kk_ins2_scope_m82_backup", 
			self.ActiveAttachments.kk_ins2_scope_m82
		)
	end
end

SWEP.reloadProgressAnimsRaw = {
	-- base_reload_empty_2 = true,
	-- gl_off_reload_empty_2 = true,
	
	base_reload_stripper_1 = true,
	base_reload_stripper_1_empty = true,
	base_reload_stripper_2 = true,
	base_reload_stripper_2_empty = true,
	gl_off_reload_stripper_1 = true,
	gl_off_reload_stripper_1_empty = true,
	gl_off_reload_stripper_2 = true,
	gl_off_reload_stripper_2_empty = true,
}

SWEP.reticleInactivityCallbacksRaw = {
	-- ["base_reload_empty_2"] = 0.1,
	-- ["gl_off_reload_empty_2"] = 0.1,
		
	["base_reload_stripper_1"] = 0.1,
	["base_reload_stripper_1_empty"] = 0.1,
	["base_reload_stripper_2"] = 0.1,
	["base_reload_stripper_2_empty"] = 0.1,
	
	["gl_off_reload_stripper_1"] = 0.1,
	["gl_off_reload_stripper_1_empty"] = 0.1,
	["gl_off_reload_stripper_2"] = 0.1,
	["gl_off_reload_stripper_2_empty"] = 0.1,
}

-- if CLIENT then
	-- local v0 = Vector()
	-- local v1 = Vector(1, 1, 1)
	
	-- function SWEP:updateOtherParts()
		-- self.CW_VM:ManipulateBoneScale(80, (self.Sequence == "base_reload_full_clip") and v0 or v1)
		-- self.CrosshairEnabled = true
		-- self.FadeCrosshairOnAim = false
	-- end
-- end

function SWEP:getStripperClipAnimation(ammo, mag)
	local suffix = ""
	
	if mag < 1 then
		suffix = "_empty"
	end
	
	local clipDiff = math.floor(math.Clamp(self.Primary.ClipSize + 1 - mag, 0, self.Primary.ClipSize) / self.stripperCapacity)
	local clipIn = 1
	
	for i = 1, clipDiff - 1 do
		if (ammo - self.stripperCapacity >= clipIn * self.stripperCapacity) then
			clipIn = clipIn + 1
		end
	end
	
	return "reload_stripper_" .. tostring(clipIn) .. suffix
end
