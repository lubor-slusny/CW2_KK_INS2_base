if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

SWEP.magType = "pistolMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M45"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "KK_INS2_45apc"
	
	SWEP.AttachmentModelsVM = {		
		["kk_ins2_mag_m45_8"] = {model = "models/weapons/upgrades/a_magazine_m45_8.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_m45_15"] = {model = "models/weapons/upgrades/a_magazine_m45_15.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_suppressor_pistol"] = {model = "models/weapons/upgrades/a_suppressor_pistol.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_mak.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_mak.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_m6x"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_m6x.mdl", bone = "Weapon", pos = Vector(0.004, 1.105, -1.175), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},

		["kk_ins2_m6x_rail"] = {model = "models/cw2/attachments/lowerpistolrail.mdl", bone = "Weapon", pos = Vector(0.006, 0.765, -0.561), angle = Angle(0, 90, 0), size = Vector(0.105, 0.105, 0.105), 
			material = "models/weapons/attachments/cw_kk_ins2_cstm_m6x/rail_gy",
			active = function(self) return self.ActiveAttachments.kk_ins2_m6x end
		},
		
		["kk_counter"] = {model = "models/weapons/stattrack_cut.mdl", bone = "Slide", pos = Vector(0.451, 0, 0.028), angle = Angle(0, -90, 0), size = Vector(0.8, 0.8, 0.8)},
	}

	SWEP.AttachmentModelsWM = {
		["kk_ins2_suppressor_pistol"] = {model = "models/weapons/upgrades/w_sil_pistol.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_mag_m45_8"] = {model = "models/weapons/upgrades/w_magazine_m45_8.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_m45_15"] = {model = "models/weapons/upgrades/w_magazine_m45_15.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-1.859, 0, 0.3468)
	SWEP.IronsightAng = Vector(0.3062, -0.0054, 0)

	SWEP.CustomizationMenuScale = 0.01
	SWEP.ReloadViewBobEnabled = false
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.WeaponLength = 16

SWEP.Attachments = {
	{header = "Lasers", offset = {500, -400}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_m6x"}},
	{header = "Barrel", offset = {-500, -400}, atts = {"kk_ins2_suppressor_pistol"}},
	{header = "Reload Aid", offset = {-500, 150}, atts = {"kk_ins2_mag_m45_15"}},
	["+reload"] = {header = "Ammo", offset = {500, 150}, atts = {"am_magnum", "am_matchgrade"}}
}

if CustomizableWeaponry_KK.HOME then
	table.insert(SWEP.Attachments, {header = "CSGO", offset = {1500, -400}, atts = {"kk_counter"}})
end

SWEP.KK_INS2_emptyIdle = true

SWEP.Animations = {
	draw = "base_ready",
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "empty_draw",
	base_fire = {"base_fire","base_fire2","base_fire3"},
	base_fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	base_fire_last = "base_firelast",
	base_fire_last_aim = "iron_firelast",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_mm = "base_reload_extmag",
	base_reload_empty = "base_reloadempty",
	base_reload_empty_mm = "base_reloadempty_extmag",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "empty_holster",
	base_sprint = "base_sprint",
	base_sprint_empty = "empty_sprint",
	base_safe = "base_down",
	base_safe_empty = "empty_down",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "empty_iron_down",
}
	
SWEP.Sounds = {
	base_ready = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
		{time = 4/30, sound = "CW_KK_INS2_M45_SAFETY"},
		{time = 9/30, sound = "CW_KK_INS2_M45_BOLTBACK"},
		{time = 19/30, sound = "CW_KK_INS2_M45_BOLTRELEASE"},
	},

	base_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
	},

	base_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_HOLSTER"},
	},

	base_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M45_EMPTY"},
	},

	base_reload = {
		{time = 0, sound = "CW_KK_INS2_M45_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_M45_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_M45_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_M45_MAGHIT"},
	},

	base_reload_extmag = {
		{time = 0, sound = "CW_KK_INS2_M45_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_M45_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_M45_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_M45_MAGHIT"},
	},

	base_reloadempty = {
		{time = 0/30, sound = "CW_KK_INS2_M45_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_M45_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_M45_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_M45_MAGHIT"},
		{time = 71/30, sound = "CW_KK_INS2_M45_BOLTRELEASE"},
	},

	base_reloadempty_extmag = {
		{time = 0/30, sound = "CW_KK_INS2_M45_MAGRELEASE"},
		{time = 7/30, sound = "CW_KK_INS2_M45_MAGOUT"},
		{time = 35/30, sound = "CW_KK_INS2_M45_MAGIN"},
		{time = 58/30, sound = "CW_KK_INS2_M45_MAGHIT"},
		{time = 71/30, sound = "CW_KK_INS2_M45_BOLTRELEASE"},
	},

	empty_draw = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_DRAW"},
	},

	empty_holster = {
		{time = 0, sound = "CW_KK_INS2_UNIVERSAL_PISTOL_HOLSTER"},
	},

	iron_dryfire = {
		{time = 0, sound = "CW_KK_INS2_M45_EMPTY"},
	},
}

SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_m45.mdl"
SWEP.WorldModel		= "models/weapons/w_m45.mdl"

SWEP.WMPos = Vector(5.309, 1.623, -1.616)
SWEP.WMAng = Vector(-3, -5, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= 7
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 0.1
SWEP.FireSound = "CW_KK_INS2_M45_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_M45_FIRE_SUPPRESSED"
SWEP.Recoil = 1

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.013
SWEP.VelocitySensitivity = 1.25
SWEP.MaxSpreadInc = 0.036
SWEP.SpreadPerShot = 0.0125
SWEP.SpreadCooldown = 0.22
SWEP.Shots = 1
SWEP.Damage = 25

SWEP.FirstDeployTime = 1.2
SWEP.DeployTime = 0.46

SWEP.ReloadTime = 2
SWEP.ReloadHalt = 2.65

SWEP.ReloadTime_Empty = 2
SWEP.ReloadHalt_Empty = 2.65

if CLIENT then 
	function SWEP:updateOtherParts()
		local active = self.ActiveAttachments
	
		self.AttachmentModelsVM.kk_ins2_mag_m45_8.active = !active.kk_ins2_mag_m45_15
	end
end
