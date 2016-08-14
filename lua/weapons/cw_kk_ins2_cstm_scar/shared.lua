if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "brMag"

util.PrecacheModel("models/weapons/v_cw_kk_ins2_cstm_scar_tan.mdl")
util.PrecacheModel("models/weapons/w_cw_kk_ins2_cstm_scar_tan.mdl")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "SCAR H"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.Shell = "KK_INS2_762x51"
	SWEP.ShellDelay = 0.06
	
	SWEP.ShellViewAngleAlign = {Forward = 0, Right = 0, Up = -25}
	
	SWEP.AttachmentModelsVM = {	
		["kk_ins2_suppressor_sec"] = {model = "models/weapons/upgrades/a_suppressor_sec.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_bipod"] = {model = "models/weapons/upgrades/a_bipod_scar.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/a_foregrip_scar.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), merge = true},

		["kk_ins2_magnifier"] = {model = "models/weapons/upgrades/a_optic_aimp2x.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		-- ["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_scar.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		-- ["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_scar.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_lam"] = {model = "models/weapons/upgrades/a_laser_rail.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_flashlight"] = {model = "models/weapons/upgrades/a_flashlight_rail.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_anpeq15"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_anpeq_rail.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_aimpoint"] = {model = "models/weapons/upgrades/a_optic_aimpoint.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_elcan"] = {model = "models/weapons/upgrades/a_optic_elcan_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_eotech"] = {model = "models/weapons/upgrades/a_optic_eotech.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_kobra"] = {model = "models/weapons/upgrades/a_optic_kobra_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 1.2},
		["kk_ins2_po4"] = {model = "models/weapons/upgrades/a_optic_po4x24_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_scope_m40"] = {model = "models/weapons/upgrades/a_optic_scar.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},		
		
		["kk_ins2_cstm_cmore"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_cmore.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},		
		["kk_ins2_cstm_microt1"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_microt1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},		
		["kk_ins2_cstm_compm4s"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_compm4s.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},		
		["kk_ins2_cstm_acog"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_acog_m.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, retSizeMult = 0.85},
		["kk_ins2_cstm_barska"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_barska.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},		
		["kk_ins2_cstm_eotechxps"] = {model = "models/weapons/attachments/v_cw_kk_ins2_cstm_eotechxps.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {
		["kk_ins2_suppressor_sec"] = {model = "models/weapons/upgrades/w_sil_sec1.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_bipod"] = {model = "models/weapons/upgrades/w_bipod_m40.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
		
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
	
	SWEP.CustomizePos = Vector(5.488, -1.627, -0.321)
	SWEP.CustomizeAng = Vector(17.009, 29.971, 16.669)
	
	SWEP.IronsightPos = Vector(-2.7302, -2, 1.4336)
	SWEP.IronsightAng = Vector(0.0885, 0, 0)

	SWEP.KKINS2KobraPos = Vector(-2.723, -3, 0.7389)
	SWEP.KKINS2KobraAng = Vector(0, 0, 0)

	SWEP.KKINS2EoTechPos = Vector(-2.7149, -3, 0.8153)
	SWEP.KKINS2EoTechAng = Vector(0, 0, 0)

	SWEP.KKINS2AimpointPos = Vector(-2.7194, -3, 0.8211)
	SWEP.KKINS2AimpointAng = Vector(0, 0, 0)

	SWEP.KKINS2ElcanPos = Vector(-2.7197, -4, 0.7178)
	SWEP.KKINS2ElcanAng = Vector(0, 0, 0)

	SWEP.KKINS2PO4Pos = Vector(-2.6695, -5, 1.0781)
	SWEP.KKINS2PO4Ang = Vector(0, 0, 0)

	SWEP.KKINS2ScopeM40Pos = Vector(-2.7217, -1.5, 0.7025)
	SWEP.KKINS2ScopeM40Ang = Vector(0, 0, 0)

	SWEP.KKINS2MagnifierPos = Vector(-2.7185, -3, 0.822)
	SWEP.KKINS2MagnifierAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(0, -1, 0.5)
	
	SWEP.CustomizationMenuScale = 0.016
end

SWEP.Attachments = {
	{header = "Sight", offset = {400, -500}, atts = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40", "kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_microt1", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"}, /*dependencies = {["kk_ins2_sights_base"] = true, ["kk_ins2_sights_cstm"] = true}*/ },
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_suppressor_sec"}},
	{header = "Under", offset = {-400, -50}, atts = {"kk_ins2_bipod", "kk_ins2_vertgrip"}},
	{header = "Lasers", offset = {150, 300}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_anpeq15"}},
	{header = "More Sight", offset = {1000, -25}, atts = {"kk_ins2_magnifier"}, dependencies = CustomizableWeaponry_KK.ins2.magnifierDependencies},
	{header = "Flavor", offset = {-300, 500}, atts = {"kk_ins2_cstm_scar_skin"}},
	-- ["+use"] = {header = "Sight Contract", offset = {400, -25}, atts = {"kk_ins2_sights_base", "kk_ins2_sights_cstm"}},
	["+use"] = {header = "Sight Contract", offset = {400, -25}, atts = {"kk_ins2_sights_cstm"}},
	["+reload"] = {header = "Ammo", offset = {800, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

// this was too fun to just delete

-- SWEP.AttachmentExclusions = {
	-- ["kk_ins2_kobra"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_eotech"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_aimpoint"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_elcan"] = {"kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_scope_m40"] = {"kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_cstm_barska"] = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40"},
	-- ["kk_ins2_cstm_eotechxps"] = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40"},
	-- ["kk_ins2_cstm_microt1"] = {"kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40"},
	-- ["kk_ins2_cstm_compm4s"] = {"kk_ins2_cstm_cmore", "kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40"},
	-- ["kk_ins2_cstm_acog"] = {"kk_ins2_cstm_cmore", "kk_ins2_kobra", "kk_ins2_eotech", "kk_ins2_aimpoint", "kk_ins2_elcan", "kk_ins2_scope_m40"},
-- }

-- SWEP.AttachmentDependencies = {
	-- ["kk_ins2_cstm_barska"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_cstm_eotechxps"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_cstm_microt1"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_cstm_compm4s"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
	-- ["kk_ins2_cstm_acog"] = {"kk_ins2_cstm_cmore", "kk_ins2_cstm_barska", "kk_ins2_cstm_eotechxps", "kk_ins2_cstm_microt1", "kk_ins2_cstm_compm4s", "kk_ins2_cstm_acog"},
-- }

SWEP.Animations = {
	draw = "base_ready",

	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "base_draw_empty",
	base_fire = "base_fire",
	base_fire_aim = {"iron_fire","iron_fire_a","iron_fire_b","iron_fire_c","iron_fire_d","iron_fire_e","iron_fire_f"},
	base_fire_last = "base_fire_last",
	base_fire_last_aim = "iron_fire_last",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_idle_empty = "base_idle_empty",
	base_holster = "base_holster",
	base_holster_empty = "base_holster_empty",
	base_firemode = "base_fireselect",
	base_firemode_empty = "base_fireselect_empty",
	base_firemode_aim = "iron_fireselect",
	base_firemode_empty_aim = "iron_fireselect_empty",
	base_sprint = "base_sprint",
	base_sprint_empty = "base_sprint_empty",
	base_safe = "base_down",
	base_safe_empty = "base_down_empty",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "iron_down_empty",
	
	foregrip_pickup = "foregrip_ready",
	foregrip_draw = "foregrip_draw",
	foregrip_draw_empty = "foregrip_draw_empty",
	foregrip_fire = "foregrip_fire",
	foregrip_fire_aim = {"foregrip_iron_fire","foregrip_iron_fire_a","foregrip_iron_fire_b","foregrip_iron_fire_c","foregrip_iron_fire_d","foregrip_iron_fire_e","foregrip_iron_fire_f"},
	foregrip_fire_last = "foregrip_fire_last",
	foregrip_fire_last_aim = "foregrip_iron_fire_last",
	foregrip_fire_empty = "foregrip_dryfire",
	foregrip_fire_empty_aim = "foregrip_iron_dryfire_b",
	foregrip_reload = "foregrip_reload",
	foregrip_reload_empty = "foregrip_reloadempty",
	foregrip_idle = "foregrip_draw",
	foregrip_idle_empty = "foregrip_draw_empty",
	foregrip_holster = "foregrip_holster",
	foregrip_holster_empty = "foregrip_holster_empty",
	foregrip_firemode = "foregrip_fireselect",
	foregrip_firemode_empty = "foregrip_fireselect_empty",
	foregrip_firemode_aim = "foregrip_iron_fireselect",
	foregrip_firemode_empty_aim = "foregrip_iron_fireselect_empty",
	foregrip_sprint = "foregrip_sprint",
	foregrip_sprint_empty = "foregrip_sprint_empty",
	foregrip_safe = "foregrip_down",
	foregrip_safe_empty = "foregrip_down_empty",
	foregrip_safe_aim = "foregrip_iron_down",
	foregrip_safe_empty_aim = "foregrip_iron_down_empty",
	
	bipod_in = "deployed_out",
	bipod_in_empty = "deployed_out_empty",
	
	bipod_fire = "deployed_fire",
	bipod_fire_aim = "deployed_iron_fire",
	bipod_fire_last = "deployed_fire_last",
	bipod_fire_last_aim = "deployed_iron_fire_last",
	bipod_fire_empty = "deployed_dryfire",
	bipod_fire_empty_aim = "deployed_iron_dryfire",
	bipod_reload = "deployed_reload_half",
	bipod_reload_empty = "deployed_reload_empty",
	bipod_firemode = "deployed_fireselect",
	bipod_firemode_empty = "deployed_fireselect_empty",
	bipod_firemode_aim = "deployed_iron_fireselect",
	bipod_firemode_empty_aim = "deployed_iron_fireselect_empty",
	
	bipod_out = "deployed_in",
	bipod_out_empty = "deployed_in_empty",
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_kk_ins2_base_deploy"
SWEP.Category = "CW 2.0 KK INS2 WS"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_cw_kk_ins2_cstm_scar.mdl"
SWEP.WorldModel		= "models/weapons/w_cw_kk_ins2_cstm_scar.mdl"

SWEP.WMPos = Vector(4.072, 0.924, -0.537)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.wsContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.wsContentMounted()

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "7.62x51MM"

SWEP.FireDelay = 60/625
SWEP.FireSound = "CW_KK_INS2_CSTM_SCAR_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_M14_FIRE_SUPPRESSED"

SWEP.Recoil = 1.6
SWEP.RecoilToSpread = 0.8 
SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 63

SWEP.base_ReloadTime = 2.7
SWEP.base_ReloadTime_Empty = 2.7
SWEP.base_ReloadHalt = 3.4
SWEP.base_ReloadHalt_Empty = 5

SWEP.bipod_ReloadTime = 2.3
SWEP.bipod_ReloadTime_Empty = 2.3
SWEP.bipod_ReloadHalt = 3.2
SWEP.bipod_ReloadHalt_Empty = 4.5

SWEP.SnapToIdlePostReload = false

SWEP.FirstDeployTime = 1.8
SWEP.DeployTime = 0.71
SWEP.HolsterTime = 0.56

SWEP.WeaponLength = 28

SWEP.KK_INS2_EmptyIdle = true

SWEP.MuzzleVelocity = 714

if CLIENT then
	local zero = Vector(0, 0, 0)
	
	function SWEP:updateOtherParts()
		self.AttachmentModelsVM.kk_ins2_vertgrip.ent:ManipulateBoneScale(0, zero)
	end
end