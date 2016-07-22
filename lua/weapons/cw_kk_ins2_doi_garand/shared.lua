if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "m1Clip"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "M1 Garand"
	
	SWEP.IconLetter = "n"
	
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.NoShells = true
	
	SWEP.Shell = "KK_INS2_762x54"
	SWEP.ShellEjectVelocity = 150
	
	SWEP.Shell2 = "KK_INS2_GARAND"
	SWEP.Shell2EjectVelocity = 150
	SWEP.Shell2ViewAngleAlign = {Forward = 0, Right = 30, Up = -90}
	SWEP.Shell2WorldAngleAlign = {Forward = 0, Right = 0, Up = 90}
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/a_iron_garand_l.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_iron_garand_s.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/a_garand_bayonet.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/W_garand_bayonet.mdl", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.4643, -2, 1.1174)
	SWEP.IronsightAng = Vector(-0.4782, 0.006, 0)

	SWEP.FoldSightPos = Vector(-2.4643, -2, 1.1174)
	SWEP.FoldSightAng = Vector(-0.4782, 0.006, 0)

	SWEP.CustomizationMenuScale = 0.02
end

SWEP.Attachments = {
	{header = "Sight", offset = {400, -500}, atts = {"bg_foldsight"}},
	{header = "Barrel", offset = {-200, -500}, atts = {"kk_ins2_ww2_knife"}},
	{header = "Stock", offset = {1000, 0}, atts = {"kk_ins2_ww2_sling"}},
	["+reload"] = {header = "Ammo", offset = {900, 500}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	draw = "base_ready",

	base_pickup = "base_ready",
	base_draw = "base_draw",
	base_draw_empty = "base_draw_empty",
	base_fire = {"base_fire_1","base_fire_2"},
	base_fire_aim = {"iron_fire_1", "iron_fire_2", "iron_fire_3"},
	base_fire_last = "base_fire_last",
	base_fire_last_aim = "iron_fire_last",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reloadfull",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_idle_empty = "base_idle_empty",
	base_holster = "base_holster",
	base_holster_empty = "base_holster_empty",
	base_sprint = "base_sprint",
	base_sprint_empty = "base_sprint_empty",
	base_safe = "base_down",
	base_safe_empty = "base_down_empty",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "iron_down_empty",
	
	base_melee = "base_melee",
	base_melee_empty = "base_melee_empty",
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 75
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_garand.mdl"
SWEP.WorldModel		= "models/weapons/w_garand.mdl"

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenades.ww2us

SWEP.WMPos = Vector(14.986, 0.921, -3.038)
SWEP.WMAng = Vector(-10, 0, 180)

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.doiContentMounted()
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.doiContentMounted()

SWEP.Primary.ClipSize		= 8
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= ".30-06"

SWEP.FireDelay = 0.17
SWEP.FireSound = "CW_KK_INS2_WW2_GARAND_FIRE"
SWEP.FireSoundSuppressed = "CW_KK_INS2_M14_FIRE_SUPPRESSED"
SWEP.Recoil = 1.6

SWEP.HipSpread = 0.055
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2.1
SWEP.MaxSpreadInc = 0.07
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.12
SWEP.Shots = 1
SWEP.Damage = 59

SWEP.FirstDeployTime = 2
SWEP.DeployTime = 0.94

SWEP.RecoilToSpread = 0.8 

SWEP.ReloadTime = 4
SWEP.ReloadHalt = 5.13
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadHalt_Empty = 3.33

SWEP.Chamberable = false
SWEP.KK_INS2_EmptyIdle = true

SWEP.SightBGs = {main = 0, foldsight = 0}

SWEP.WeaponLength = 22

SWEP.MuzzleVelocity = 853

if CLIENT then 
	function SWEP:updateOtherParts()
		if self.Sequence:find("reload") and self.CW_VM:GetCycle() > 0.3 then
			if self.getFullestMag then
				self:setBodygroup(1, self:getFullestMag())
			else
				self:setBodygroup(1, math.Clamp(self.Owner:GetAmmoCount(self.Primary.Ammo) + self:Clip1(), 0, 9))
			end
		else
			self:setBodygroup(1, self:Clip1())
		end
	end
	
	local bone = 66
	local dir = Vector(0,0,-1)

	local makeShell = CustomizableWeaponry_KK.ins2.makeShell
	local vm, att, pos, ang, velocity, align, shellEnt

	function SWEP:shellEvent2()
		if self.Owner:ShouldDrawLocalPlayer() then
			vm = self:getMuzzleModel()
			
			att = vm:GetAttachment(self.ShellWorldAttachmentID)
			
			pos = att.Pos
			ang = att.Ang
			velocity = self.Owner:GetVelocity() + ang:Forward() * (50)
			
			align = self.Shell2WorldAngleAlign
			ang:RotateAroundAxis(ang:Right(), align.Right)
			ang:RotateAroundAxis(ang:Forward(), align.Forward)
			ang:RotateAroundAxis(ang:Up(), align.Up)
			
			makeShell(
				pos,
				ang,
				velocity,
				self._shellTable2,
				self.Shell2Scale
			)
		else
			vm = self.CW_VM
			
			att = vm:GetBoneMatrix(bone)
			
			pos = att:GetTranslation()
			ang = att:GetAngles()
			velocity = self.Owner:GetVelocity() + dir * (self.Shell2EjectVelocity or 200)
			
			align = self.Shell2ViewAngleAlign
			ang:RotateAroundAxis(ang:Right(), align.Right)
			ang:RotateAroundAxis(ang:Forward(), align.Forward)
			ang:RotateAroundAxis(ang:Up(), align.Up)
			
			shellEnt = makeShell(
				pos,
				ang,
				velocity,
				self._shellTable2,
				self.Shell2Scale
			)
		end
	end
end