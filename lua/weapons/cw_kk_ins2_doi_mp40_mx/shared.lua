if not CustomizableWeaponry then return end
-- if not CustomizableWeaponry_KK.HOME then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "smgMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HK MP40"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15

	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_mp40")

	SWEP.Shell = "KK_INS2_9x19"
	SWEP.ShellDelay = 0.1

	SWEP.ShellViewAngleAlign = {Forward = 0, Right = 0, Up = 180}
	SWEP.ShellWorldAngleAlign = {Forward = 0, Right = 0, Up = 180}

	SWEP.AttachmentModelsVM = {
		["kk_ins2_ww2_sling"] = {model = "models/weapons/upgrades/a_sling_mp40.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},

		["ins2"] = {model = "models/weapons/v_cw_kk_ins2_mp40.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, nodraw = true, active = true, material = CustomizableWeaponry_KK.ins2.nodrawMatPath},

		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_modkit_04.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},

		["kk_ins2_suppressor_ins"] = {model = "models/weapons/upgrades/a_suppressor_ins.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},

		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_band.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_band.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},
		["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_band_l.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},

		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/a_optic_aimp2x_m.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},

		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan_m.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24_m.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},

		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_cmore_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_compm4s_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_microt1_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_acog_m.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_eotechxps_m.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), rel = "ins2", merge = true, retSizeMult = 0.85},
	}

	SWEP.AttachmentModelsWM = {}

	SWEP.IronsightPos = Vector(-2.5062, -2, 0.5482)
	SWEP.IronsightAng = Vector(0.2105, 0.0425, 0)

	SWEP.KKINS2EoTechPos = Vector(-2.5102, -2, -0.2916)
	SWEP.KKINS2EoTechAng = Vector()

	SWEP.KKINS2AimpointPos = Vector(-2.505, -2, -0.2748)
	SWEP.KKINS2AimpointAng = Vector()

	SWEP.KKINS2KobraPos = Vector(-2.5103, -2, -0.3096)
	SWEP.KKINS2KobraAng = Vector()

	SWEP.KKINS2PO4Pos = Vector(-2.4542, -3, -0.1948)
	SWEP.KKINS2PO4Ang = Vector()

	SWEP.KKINS2MagnifierPos = Vector(-2.5024, -3, -0.2802)
	SWEP.KKINS2MagnifierAng = Vector()

	SWEP.KKINS2ElcanPos = Vector(-2.5041, -3, -0.5503)
	SWEP.KKINS2ElcanAng = Vector()

end

SWEP.MuzzleEffect = "muzzleflash_mp40_1p"
SWEP.MuzzleEffectWorld = "muzzleflash_mp40_3p"

SWEP.Attachments = {
	{header = "Sight", offset = {300, -500}, atts = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", /*"kk_ins2_elcan", "kk_ins2_po4",*/ "kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_microt1", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_compm4s", /*"kk_ins2_cstm_acog"*/}},
	{header = "Barrel", offset = {-300, -500}, atts = {"kk_ins2_suppressor_ins"}},
	{header = "Lasers", offset = {-500, 0}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_anpeq15"}},
	-- {header = "More Sight", offset = {800, 0}, atts = {"kk_ins2_magnifier"}, dependencies = CustomizableWeaponry_KK.ins2.magnifierDependencies},
	{header = "Stock", offset = {600, 500}, atts = {"kk_ins2_ww2_sling"}},
	["+use"] = {header = "Sight Contract", offset = {300, 0}, atts = {"kk_ins2_sights_cstm"}},
	["+reload"] = {header = "Ammo", offset = {0, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "empty_draw",
	base_fire = {"base_fire", "base_fire2", "base_fire3"},
	base_fire_aim = {"iron_fire","iron_fire_a","iron_fire_b","iron_fire_c","iron_fire_d","iron_fire_e","iron_fire_f"},
	base_fire_last = "base_firelast",
	base_fire_last_aim = "iron_firelast",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "empty_holster",
	base_sprint = "base_sprint",
	base_sprint_empty = "empty_sprint",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	base_safe_empty = "empty_down",
	base_safe_empty_aim = "iron_empty_down",
	base_crawl = "base_crawl",
	base_crawl_empty = "empty_crawl",
	base_melee = "base_melee_bash",
	base_melee_empty = "empty_melee_bash",
}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 EXT"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw_kk_doi/v_mp40.mdl"
SWEP.WorldModel		= "models/weapons/w_cw_kk_doi_mp40.mdl"

SWEP.WMPos = Vector(5.176, 0.889, -1.417)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.NormalHoldType = "cw_kk_dods_mp40"
SWEP.WMPos = Vector(4, 2, -1)
SWEP.WMAng = Vector(5, -5, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.f1
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.gurkha

local hasBase = CustomizableWeaponry_KK.ins2.isContentMounted4({Folder = "weapons/cw_kk_ins2_base"})

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP) and hasBase
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP) and hasBase

SWEP.Primary.ClipSize		= 32
SWEP.Primary.DefaultClip	= 32
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "9x19MM"

SWEP.FireDelay = 60/550
SWEP.FireSound = "CW_KK_INS2_DOI_MP40_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_MP40_FIRE_SUPPRESSED"
SWEP.Recoil = 0.77

SWEP.HipSpread = 0.035
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 1.5
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.13
SWEP.Shots = 1
SWEP.Damage = 25

SWEP.FirstDeployTime = 1.7
SWEP.DeployTime = 0.7
SWEP.HolsterTime = 0.5

SWEP.Chamberable = false

SWEP.WeaponLength = 16 // this things gotta b longer than MP5k

SWEP.KK_INS2_EmptyIdle = true

SWEP.ReloadTimes = {
	base_reload = {2.2, 2.95},
	base_reloadempty = {3.2, 4.55},

	base_melee_bash = {0.3, 0.9},
	empty_melee_bash = {0.3, 0.9},
}

SWEP.MuzzleVelocity = 400
