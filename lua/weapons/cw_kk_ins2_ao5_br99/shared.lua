if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_soundscript.lua")
include("sh_soundscript.lua")

local spawnable = file.Exists("models/weapons/v_br99.mdl", "GAME") and file.Exists("models/weapons/w_br99.mdl", "GAME")

SWEP.magType = "arMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "[AO5] BR99"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "w"
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.Shell = "KK_INS2_12guage"
	SWEP.ShellDelay = 0.06

	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/a_standard_br99.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_counter"] = {model = "models/weapons/upgrades/a_standard_br99.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, nodraw = true},
		
		["kk_ins2_suppressor_shotgun"] = {model = "models/weapons/upgrades/a_suppressor_12ga.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/a_foregrip_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), attachment = "Foregrip"},

		["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_rail.mdl", bone = "Weapon", pos = Vector(-0.005, 6.264, 3.607), angle = Angle(0, -90, 180), size = Vector(1, 1, 1)},
		["kk_ins2_m6x"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_rail.mdl", bone = "Weapon", pos = Vector(-0.005, 6.264, 3.607), angle = Angle(0, -90, 180), size = Vector(1, 1, 1)},

		["bg_foldsight"] = {model = "models/weapons/attachments/v_cw_kk_ins2_flipsight.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/a_optic_aimp2x_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.25},
		
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech_xl.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.25},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra_xl.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.6},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_scope_m40"] = {model = "models/weapons/upgrades/a_optic_m40_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_cmore_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_compm4s_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_microt1_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_acog.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska_xl.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.25},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_eotechxps_xl.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.25},
	}
	
	SWEP.AttachmentModelsWM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/w_flipup_br99.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_ins2_suppressor_shotgun"] = {model = "models/weapons/upgrades/w_sil_pistol.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/w_foregrip_sec1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/w_laser_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/w_magaim.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/w_elcan.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/w_kobra.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/w_po.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_scope_m40"] = {model = "models/weapons/upgrades/w_scope_m40.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_cmore.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/upgrades/w_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_acog.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/upgrades/w_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/w_cw_kk_ins2_cstm_eotechxps.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.4954, -2, 0.6686)
	SWEP.IronsightAng = Vector(-0.2838, 0.05, 0)

	SWEP.FoldSightPos = Vector(-2.4932, -2, 0.9581)
	SWEP.FoldSightAng = Vector(-0.8694, 0.0447, 0)

	SWEP.M203Pos = Vector(-0.5204, -2, 1.1308)
	SWEP.M203Ang = Vector(0.685, 0.05, 0)

	SWEP.KKINS2KobraPos = Vector(-2.4973, -2, 0.3775)
	SWEP.KKINS2KobraAng = Vector(0, 0, 0)

	SWEP.KKINS2EoTechPos = Vector(-2.4952, -2, 0.5576)
	SWEP.KKINS2EoTechAng = Vector(0, 0, 0)

	SWEP.KKINS2AimpointPos = Vector(-2.4968, -2, 0.5831)
	SWEP.KKINS2AimpointAng = Vector(0, 0, 0)

	SWEP.KKINS2ElcanPos = Vector(-2.4906, -2, 0.5367)
	SWEP.KKINS2ElcanAng = Vector(0, 0, 0)

	SWEP.KKINS2PO4Pos = Vector(-2.42, -2, 0.7497)
	SWEP.KKINS2PO4Ang = Vector(0, 0, 0)

	SWEP.KKINS2ScopeM40Pos = Vector(-2.4989, 0, 0.7409)
	SWEP.KKINS2ScopeM40Ang = Vector(0, 0, 0)

	SWEP.KKINS2MagnifierPos = Vector(-2.4914, -1, 0.5701)
	SWEP.KKINS2MagnifierAng = Vector(0, 0, 0)

	SWEP.CustomizationMenuScale = 0.018
end

SWEP.SightBGs = {main = 0, foldsight = 0}

SWEP.Attachments = {
	{header = "Sight", offset = {500, -500}, atts = {"bg_foldsight", "kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_po4", "kk_ins2_scope_m40", "kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_microt1", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"}},
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_suppressor_shotgun"}},
	{header = "Under", offset = {-500, 0}, atts = {"kk_ins2_vertgrip"}},
	{header = "Lasers", offset = {125, 400}, atts = {"kk_ins2_anpeq15"}},
	{header = "More Sight", offset = {1100, 0}, atts = {"kk_ins2_magnifier"}, dependencies = CustomizableWeaponry_KK.ins2.magnifierDependencies},
	["+use"] = {header = "Sight Contract", offset = {500, 0}, atts = {"kk_ins2_sights_cstm"}},
	["+reload"] = {header = "Ammo", offset = {900, 500}, atts = {"am_slugrounds", "am_flechetterounds"}}
}

if CustomizableWeaponry_KK.HOME then
	table.insert(SWEP.Attachments, {header = "Skill1", offset = {2300, -600}, atts = {"kk_aimbot"}})
	table.insert(SWEP.Attachments, {header = "Skill2", offset = {2300, -100}, atts = {"kk_wallhaq"}})
	table.insert(SWEP.Attachments, {header = "CSGO", offset = {2300, 300}, atts = {"kk_counter"}})
end

SWEP.Animations = {
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
	base_crawl = "base_crawl",
	
	foregrip_pickup = "foregrip_ready",
	foregrip_draw = "foregrip_draw",
	foregrip_fire = "foregrip_fire",
	foregrip_fire_aim = {"foregrip_iron_fire","foregrip_iron_fire_a","foregrip_iron_fire_b","foregrip_iron_fire_c","foregrip_iron_fire_d","foregrip_iron_fire_e","foregrip_iron_fire_f"},
	foregrip_fire_empty = "foregrip_dryfire",
	foregrip_fire_empty_aim = "foregrip_iron_dryfire",
	foregrip_reload = "foregrip_reload",
	foregrip_reload_empty = "foregrip_reloadempty",
	foregrip_idle = "foregrip_holster",
	foregrip_holster = "foregrip_holster",
	foregrip_firemode = "foregrip_fireselect",
	foregrip_firemode_aim = "foregrip_iron_fireselect",
	foregrip_sprint = "foregrip_sprint",
	foregrip_safe = "foregrip_down",
	foregrip_safe_aim = "foregrip_iron_down",
	foregrip_crawl = "foregrip_crawl",
	
	gl_off_pickup = "gl_ready",
	gl_off_draw = "gl_draw",
	gl_off_fire = "gl_fire",
	gl_off_fire_aim = {"gl_iron_fire","gl_iron_fire_a","gl_iron_fire_b","gl_iron_fire_c","gl_iron_fire_d","gl_iron_fire_e","gl_iron_fire_f"},
	gl_off_fire_empty = "gl_dryfire",
	gl_off_fire_empty_aim = "gl_iron_dryfire",
	gl_off_reload = "gl_reload",
	gl_off_reload_empty = "gl_reloadempty",
	gl_off_idle = "gl_holster",
	gl_off_holster = "gl_holster",
	gl_off_firemode = "gl_fireselect",
	gl_off_firemode_aim = "gl_fireselect",
	gl_off_sprint = "gl_sprint",
	gl_off_safe = "gl_down",
	gl_off_safe_aim = "gl_iron_down",
	
	gl_on_draw = "glsetup_draw",
	gl_on_fire = "glsetup_fire",
	gl_on_fire_aim = "glsetup_iron_fire",
	gl_on_fire_empty = "glsetup_dryfire",
	gl_on_fire_empty_aim = "glsetup_iron_dryfire",
	gl_on_reload = "glsetup_reload",
	gl_on_idle = "glsetup_holster",
	gl_on_holster = "glsetup_holster",
	gl_on_sprint = "glsetup_sprint",
	gl_on_safe = "glsetup_down",
	gl_on_safe_aim = "glsetup_iron_down",
	
	gl_turn_on = "glsetup_in",
	gl_turn_off = "glsetup_out",
	
	bipod_fire = "deployed_fire",
	bipod_fire_aim = "deployed_fire",
	bipod_fire_last = "deployed_fire",
	bipod_fire_empty = "deployed_dryfire",
	bipod_fire_empty_aim = "deployed_dryfire",
	bipod_reload = "deployed_reload_half",
	bipod_reload_empty = "deployed_reload_empty",
	bipod_firemode = "deployed_fireselect",
	bipod_firemode_aim = "deployed_iron_fireselect",
	
	bipod_in = "deployed_in",
	bipod_idle = "deployed_idle",
	bipod_out = "deployed_out",
}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_br99.mdl"
SWEP.WorldModel		= "models/weapons/w_br99.mdl"

SWEP.WMPos = Vector(5.219, 0.554, -0.893)
SWEP.WMAng = Vector(-10, -1, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted() and spawnable
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted() and spawnable

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "12 Gauge"

SWEP.FireDelay = 0.2
SWEP.FireSound = "CW_KK_INS2_TOZ_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_TOZ_FIRE_SUPPRESSED"
SWEP.Recoil = 1.05

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.013
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 11

SWEP.FirstDeployTime = 2.3
SWEP.DeployTime = 0.7
SWEP.HolsterTime = 0.5

SWEP.base_ReloadTime = 2.9
SWEP.base_ReloadTime_Empty = 2.9
SWEP.base_ReloadHalt = 3.7
SWEP.base_ReloadHalt_Empty = 4.3

SWEP.gl_on_ReloadTime = 2.6
SWEP.gl_on_ReloadHalt = 3.17

SWEP.WeaponLength = 24
