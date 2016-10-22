if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "smgMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1928A1 Thompson"
	
	SWEP.IconLetter = "q"
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "KK_INS2_45apc"
	SWEP.ShellDelay = 0.13

	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/a_iron_thompson_s.mdl", pos = Vector(), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), merge = true, active = false},
		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_iron_thompson_l.mdl", pos = Vector(), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), merge = true},
		
		["kk_ins2_ww2_knife"] = {model = "models/weapons/v_brassknuckles.mdl", pos = Vector(-2.3145, -0.7286, 11.7285), angle = Angle(-49.8959, 22.8366, 26.1512), size = Vector(1, 1, 1), bone = "R Hand", nodraw = true},
		
		["handguard"] = {model = "models/weapons/upgrades/a_thompson_standard.mdl", pos = Vector(), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), merge = true, active = true},
		["kk_ins2_mag_thom_20"] = {model = "models/weapons/upgrades/a_thompson_mag_20.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_ins2_mag_thom_30"] = {model = "models/weapons/upgrades/a_thompson_mag_30.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_mag_thom_50"] = {model = "models/weapons/upgrades/a_thompson_mag_50.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_suppressor_sec"] = {model = "models/weapons/upgrades/a_suppressor_sec.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},

		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/a_thompson_foregrip.mdl", pos = Vector(), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {
		["handguard"] = {model = "models/weapons/upgrades/w_thompson_standard.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_mag_thom_20"] = {model = "models/weapons/upgrades/w_thompson_mag_20.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		
		["kk_ins2_mag_thom_30"] = {model = "models/weapons/upgrades/w_thompson_mag_30.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		["kk_ins2_mag_thom_50"] = {model = "models/weapons/upgrades/w_thompson_mag_50.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_vertgrip"] = {model = "models/weapons/upgrades/w_thompson_foregrip.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
	}

	SWEP.IronsightPos = Vector(-2.2377, -2, 1.0456)
	SWEP.IronsightAng = Vector(0.1611, 0.0052, 0)

	SWEP.FoldSightPos = Vector(-2.2377, -2, 1.0456)
	SWEP.FoldSightAng = Vector(0.1611, 0.0052, 0)

end

SWEP.MuzzleEffect = "muzzleflash_thompson_1p_core"
SWEP.MuzzleEffectWorld = "muzzleflash_thompson_3p"

SWEP.Attachments = {
	{header = "Sight", offset = {400, -500}, atts = {"bg_foldsight"}},
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_ww2_knife"}},
	{header = "Under", offset = {-500, 0}, atts = {"kk_ins2_vertgrip"}},
	{header = "Magazine", offset = {-50, 500}, atts = {"kk_ins2_mag_thom_30", "kk_ins2_mag_thom_50"}},
	{header = "Stock", offset = {1000, 0}, atts = {"kk_ins2_ww2_sling"}},
	["+reload"] = {header = "Ammo", offset = {900, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

-- if CustomizableWeaponry_KK.HOME then
	-- table.insert(SWEP.Attachments, {header = "Lasers", offset = {125, 0}, atts = {"kk_ins2_lam", "kk_ins2_flashlight", "kk_ins2_anpeq15"}})
-- end

SWEP.Animations = {
	base_pickup = "base_ready",
	base_draw = "base_draw",
	-- base_draw_empty = "empty_draw",
	base_draw_empty_mm = "base_draw_empty_drum",
	base_fire = {"base_fire_1", "base_fire_2"},
	base_fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	base_fire_last = "base_fire_last",
	base_fire_last_aim = "iron_fire_last",
	base_fire_last_mm = "base_fire_last_drum",
	base_fire_last_mm_aim = "iron_fire_last_drum",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_fire_empty_mm = "base_dryfire_drum",
	base_fire_empty_mm_aim = "iron_dryfire_drum",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_reload_mm = "base_reload_drum",
	base_reload_empty_mm = "base_reloadempty_drum",
	base_idle = "base_idle",
	-- base_idle_empty = "empty_idle",
	base_idle_empty_mm = "empty_idle_drum",
	base_holster = "base_holster",
	-- base_holster_empty = "base_holster_empty",
	base_holster_empty_mm = "base_holster_empty_drum",
	base_firemode = "base_fireselect",
	base_firemode_aim = "iron_fireselect",
	-- base_firemode_empty = "base_fireselect_empty",
	-- base_firemode_empty_aim = "iron_fireselect_empty",
	base_firemode_empty_mm = "base_fireselect_empty_drum",
	base_firemode_empty_mm_aim = "iron_fireselect_empty_drum",
	base_sprint = "base_sprint",
	-- base_sprint_empty = "base_sprint_empty",
	base_sprint_empty_mm = "base_sprint_empty_drum",
	base_sprint_knife = "base_down",
	base_sprint_knife_empty_mm = "base_down_empty_drum",
	base_safe = "base_down",
	base_safe_aim = "iron_down",
	-- base_safe_empty = "base_down_empty",
	-- base_safe_empty_aim = "iron_down_empty",
	base_safe_empty_mm = "base_down_empty_drum",
	base_safe_empty_mm_aim = "iron_down_empty_drum",
	base_crawl = "base_crawl",
	base_crawl_empty_mm = "base_crawl_empty_drum",
	
	base_melee = "base_melee",
	base_melee_empty_mm = "base_melee_empty_drum",
	
	foregrip_pickup = "foregrip_ready",
	foregrip_draw = "foregrip_draw",
	-- foregrip_draw_empty = "foregrip_draw_empty",
	foregrip_draw_empty_mm = "foregrip_draw_empty_drum",
	foregrip_fire = {"foregrip_fire_1", "foregrip_fire_2"},
	foregrip_fire_aim = {"foregrip_iron_fire_1","foregrip_iron_fire_2","foregrip_iron_fire_3"},
	foregrip_fire_last = "foregrip_fire_last",
	foregrip_fire_last_aim = "foregrip_iron_fire_last",
	foregrip_fire_last_mm = "foregrip_fire_last_drum",
	foregrip_fire_last_mm_aim = "foregrip_iron_fire_last_drum",
	foregrip_fire_empty = "foregrip_dryfire",
	foregrip_fire_empty_aim = "foregrip_iron_dryfire",
	foregrip_fire_empty_mm = "foregrip_dryfire_drum",
	foregrip_fire_empty_mm_aim = "foregrip_iron_dryfire_drum",
	foregrip_reload = "foregrip_reload",
	foregrip_reload_empty = "foregrip_reloadempty",
	foregrip_reload_mm = "foregrip_reload_drum",
	foregrip_reload_empty_mm = "foregrip_reloadempty_drum",
	foregrip_idle = "foregrip_holster",
	-- foregrip_idle_empty = "foregrip_holster_empty",
	foregrip_idle_empty_mm = "foregrip_empty_idle_drum",
	foregrip_holster = "foregrip_holster",
	-- foregrip_holster_empty = "foregrip_holster_empty",
	foregrip_holster_empty_mm = "foregrip_holster_empty_drum",
	foregrip_firemode = "foregrip_fireselect",
	foregrip_firemode_aim = "foregrip_iron_fireselect",
	-- foregrip_firemode_empty = "foregrip_fireselect_empty",
	-- foregrip_firemode_empty_aim = "foregrip_iron_fireselect_empty",
	foregrip_firemode_empty_mm = "foregrip_fireselect_empty_drum",
	foregrip_firemode_empty_mm_aim = "foregrip_iron_fireselect_empty_drum",
	foregrip_sprint = "foregrip_sprint",
	-- foregrip_sprint_empty = "foregrip_sprint_empty",
	foregrip_sprint_empty_mm = "foregrip_sprint_empty_drum",
	foregrip_sprint_knife = "foregrip_down",
	foregrip_sprint_knife_empty_mm = "foregrip_down_empty_drum",
	foregrip_safe = "foregrip_down",
	foregrip_safe_aim = "foregrip_iron_down",
	-- foregrip_safe_empty = "foregrip_down_empty",
	-- foregrip_safe_empty_aim = "foregrip_iron_down_empty",
	foregrip_safe_empty_mm = "foregrip_down_empty_drum",
	foregrip_safe_empty_mm_aim = "foregrip_iron_down_empty_drum",
	foregrip_crawl = "foregrip_crawl",
	foregrip_crawl_empty_mm = "foregrip_crawl_empty_drum",
	
	foregrip_melee = "foregrip_melee",
	foregrip_melee_empty_mm = "foregrip_melee_empty_drum",
}

SWEP.SpeedDec = 15

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_thompson.mdl"
SWEP.WorldModel		= "models/weapons/w_thompson.mdl"

SWEP.WMPos = Vector(4, 0.395, -2)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.ww2us
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.ww2us

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.doiContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.doiContentMounted()

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".45 ACP"

SWEP.FireDelay = 60/700
SWEP.FireSound = "CW_KK_INS2_DOI_THOMPSON_FIRE"
SWEP.Recoil = 0.7

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.7
SWEP.MaxSpreadInc = 0.035
SWEP.SpreadPerShot = 0.006
SWEP.SpreadCooldown = 0.15
SWEP.Shots = 1
SWEP.Damage = 33

SWEP.FirstDeployTime = 1.9
SWEP.DeployTime = 0.7
SWEP.HolsterTime = 0.5

SWEP.Chamberable = false
SWEP.KK_INS2_EmptyIdle = false

SWEP.SightBGs = {main = 0, foldsight = 0}

SWEP.WeaponLength = 16

SWEP.MuzzleVelocity = 285

SWEP.ReloadTimes = {
	base_reload = {2.55, 3.33},
	base_reloadempty = {3.88, 4.76},
	base_reload_drum = {4.3, 5.48},
	base_reloadempty_drum = {5.82, 6.92},
	foregrip_reload = {2.55, 3.33},
	foregrip_reloadempty = {3.88, 4.76},
	foregrip_reload_drum = {4.3, 5.48},
	foregrip_reloadempty_drum = {5.82, 6.92},
}

if CLIENT then 
	function SWEP:updateStandardParts()
		self:setElementActive("handguard", !self.ActiveAttachments.kk_ins2_vertgrip)
		self:setElementActive("kk_ins2_mag_thom_20", !(self.ActiveAttachments.kk_ins2_mag_thom_30 or self.ActiveAttachments.kk_ins2_mag_thom_50))
	end
end
