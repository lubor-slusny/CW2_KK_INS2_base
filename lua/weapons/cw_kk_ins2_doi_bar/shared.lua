if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1918A2 BAR"
	
	SWEP.IconLetter = "n"
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.Shell = "KK_INS2_762x54"
	SWEP.ShellDelay = 0.12
	
	SWEP.AttachmentModelsVM = {}
	SWEP.AttachmentModelsWM = {}
	
	SWEP.IronsightPos = Vector(-2.1192, -2, 1.4437)
	SWEP.IronsightAng = Vector(-0.3029, 0, 0)
end

SWEP.Attachments = {
	{header = "Stock", offset = {1000, 0}, atts = {"kk_ins2_ww2_sling"}},
	["+reload"] = {header = "Ammo", offset = {700, 300}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",
	
	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "base_draw_empty",
	base_fire = {"base_fire_1", "base_fire_2"},
	base_fire_aim = {"iron_fire_1","iron_fire_2"},
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reloadfull",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "base_holster_empty",
	base_firemode = "base_fireselect",
	base_firemode_empty = "base_fireselect",
	base_firemode_aim = "iron_fireselect",
	base_firemode_empty_aim = "iron_fireselect",
	base_sprint = "base_sprint",
	base_sprint_empty = "base_sprint_empty",
	base_safe = "base_down",
	base_safe_empty = "base_down_empty",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "iron_down_empty",
	
	bipod_in = "deployed_in",
	bipod_in_empty = "deployed_in_empty",
	bipod_fire = {"deployed_fire_1", "deployed_fire_2"},
	bipod_fire_aim = {"deployed_iron_fire_1","deployed_iron_fire_2","deployed_iron_fire_3"},
	bipod_fire_empty = "deployed_dryfire",
	bipod_fire_empty_aim = "deployed_iron_dryfire",
	bipod_reload = "deployed_reload",
	bipod_reload_empty = "deployed_reload_empty",
	bipod_firemode = "deployed_fireselect",
	bipod_firemode_empty = "deployed_fireselect_empty",
	bipod_firemode_aim = "deployed_fireselect",
	bipod_firemode_empty_aim = "deployed_fireselect_empty",
	bipod_out = "deployed_out",
	bipod_out_empty = "deployed_out_empty",
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"barfast", "barslow"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_bar.mdl"
SWEP.WorldModel		= "models/weapons/w_bar.mdl"

SWEP.WMPos = Vector(18.197, 0, -2)
SWEP.WMAng = Vector(-10, 2.743, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenades.models.ww2us
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnives.models.ww2us

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.doiContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.doiContentMounted()

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".30-06"

SWEP.Secondary.Automatic	= false

SWEP.FireDelay = 60/650
SWEP.FireDelayFast = 60/650
SWEP.FireDelaySlow = 60/450
SWEP.FireSound = "CW_KK_INS2_DOI_BAR_FIRE"
SWEP.Recoil = 1.6

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 59

SWEP.BipodDeployTime = 0.91
SWEP.BipodUndeployTime = 1.16

SWEP.FirstDeployTime = 2.53
SWEP.DeployTime = 1.36

SWEP.ReloadTime = 3.54
SWEP.ReloadHalt = 4.42
SWEP.ReloadTime_Empty = 4.9
SWEP.ReloadHalt_Empty = 5.79

SWEP.WeaponLength = 28

SWEP.Chamberable = false
SWEP.BipodInstalled = true
SWEP.KK_INS2_EmptyIdle = true

SWEP.MuzzleVelocity = 860

function SWEP:IndividualThink_INS2()
	self.FireDelay = (self.FireMode == "barslow") and self.FireDelaySlow or self.FireDelayFast
end
