if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_soundscript.lua")
include("sh_soundscript.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "HL2 M18"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "P"
	
	SWEP.AttachmentModelsVM = {}
	
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.grenadeEnt = "npc_grenade_frag"

SWEP.Animations = {
	pullpin = "pullbackhigh",
	throw = "throw",
	
	pull_cook = "pullbackhighbake",
	throw_cook = "bakethrow",
	
	base_pickup = "base_draw",
	base_draw = "base_draw",
	base_idle = "base_idle",
	base_holster = "base_holster",
	base_sprint = "base_sprint",
	base_safe = "base_down",
	base_crawl = "base_crawl",
}

SWEP.SpeedDec = 5

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base_nade"
SWEP.Category = "CW 2.0 KK INS2"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_m18.mdl"
SWEP.WorldModel		= "models/weapons/w_m18.mdl"

SWEP.WMPos = Vector(3.891, 2.295, -1.765)
SWEP.WMAng = Angle(-28.962, 155.365, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.baseContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.baseContentMounted()

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Frag Grenades"

SWEP.fuseTime = 4

SWEP.timeToThrow = 0.9

SWEP.timeToThrowCook = 1.3

local v = Vector(0, 0, 150)

function SWEP:applyThrowVelocity(grenade)
	local forward, up = self:getThrowVelocityMods()
	
	CustomizableWeaponry.quickGrenade:applyThrowVelocity(self.Owner, grenade, 800 * forward, v * up)
end

function SWEP:fuseProjectile(grenade)
	local time
	
	if self.cookTime then
		time = math.Clamp((self.cookTime + self.fuseTime) - CurTime(), 0, self.fuseTime)
	else
		time = self.fuseTime
	end
	
	grenade:Fire("sETtIMER", time)
end