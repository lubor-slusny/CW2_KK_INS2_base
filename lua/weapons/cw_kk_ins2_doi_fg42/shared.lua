if not CustomizableWeaponry then return end

AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_soundscript.lua")
include("sh_sounds.lua")
include("sh_soundscript.lua")

SWEP.magType = "brMag"

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "FG-42"
	
	SWEP.SelectIcon = surface.GetTextureID("vgui/inventory/weapon_fg42")
	
	SWEP.Shell = "KK_INS2_762x54"
	SWEP.ShellDelay = 0.12
	SWEP.ShellViewAngleAlign = {Forward = 0, Right = 0, Up = -20}
	
	SWEP.AttachmentModelsVM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/a_iron_fg42_default.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_iron_fg42_down.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_zf4"] = {model = "models/weapons/upgrades/a_optic_fg42.mdl", rLight = true, pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["knife_fold"] = {model = "models/weapons/upgrades/a_fg42_bayonet_default.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/a_fg42_bayonet.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		-- ["ani_body"] = {model = "models/weapons/v_fg42.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, hideVM = true, active = true},
		-- ["kk_ins2_ww2_sling"] = {model = "models/weapons/upgrades/a_sling_fg42.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, rel = "ani_body"},
		["kk_ins2_ww2_sling"] = {model = "models/weapons/upgrades/a_sling_fg42.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.AttachmentModelsWM = {
		["kk_ins2_optic_iron"] = {model = "models/weapons/upgrades/w_fg42_irons.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		-- ["kk_ins2_optic_rail"] = {model = "models/weapons/upgrades/a_iron_fg42_down.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["kk_ins2_scope_zf4"] = {model = "models/weapons/upgrades/w_fg42_scope.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
		
		["knife_fold"] = {model = "models/weapons/upgrades/w_fg42_bayonet_default.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true, active = true},
		["kk_ins2_ww2_knife"] = {model = "models/weapons/upgrades/w_fg42_bayonet_deployed.mdl", pos = Vector(), angle = Angle(), size = Vector(1, 1, 1), merge = true},
	}
	
	SWEP.IronsightPos = Vector(-2.5787, -4, 0.4627)
	SWEP.IronsightAng = Vector(0.6831, 0.0034, 9)
	
	SWEP.IronsightPos = Vector(-2.5787, -4, 0.4627)
	SWEP.IronsightAng = Vector(0.6845, 0.0387, 9)

	SWEP.KKINS2ScopeZF4Pos = Vector(-2.5892, -3.5, 0.4942)
	SWEP.KKINS2ScopeZF4Ang = Vector(0, 0, 9)

	SWEP.CustomizationMenuScale = 0.019
end

SWEP.MuzzleEffect = "muzzleflash_stg44_1p"
SWEP.MuzzleEffectWorld = "muzzleflash_stg44_3p"

SWEP.Attachments = {
	{header = "Sight", offset = {700, -200}, atts = {"kk_ins2_scope_zf4"}},
	{header = "Barrel", offset = {-200, -200}, atts = {"kk_ins2_ww2_knife"}},
	-- {header = "Under", offset = {-500, 0}, atts = {"kk_ins2_bipod"}},
	{header = "Stock", offset = {700, 300}, atts = {"kk_ins2_ww2_sling"}},
	["+reload"] = {header = "Ammo", offset = {-200, 300}, atts = {"am_magnum", "am_matchgrade"}}
}

SWEP.Animations = {
	base_pickup = "base_draw",
	base_draw = "base_draw",
	base_draw_empty = "base_draw_empty",
	base_fire = {"base_fire","base_fire2"},
	base_fire_aim = {"iron_fire_1","iron_fire_2","iron_fire_3"},
	base_fire_last = "base_firelast",
	base_fire_last_aim = "iron_firelast",
	base_fire_empty = "base_dryfire",
	base_fire_empty_aim = "iron_dryfire",
	base_reload = "base_reload",
	base_reload_empty = "base_reloadempty",
	base_idle = "base_idle",
	base_idle_empty = "empty_idle",
	base_holster = "base_holster",
	base_holster_empty = "base_holster_empty",
	base_firemode = "base_fireselect",
	base_firemode_empty = "base_fireselect_empty",
	base_firemode_aim = "iron_fireselect",
	base_firemode_empty_aim = "iron_fireselect_empty",
	base_sprint = "base_sprint",
	base_sprint_empty = "base_sprint_empty",
	base_sprint_knife = "base_sprint_bayonet",
	base_sprint_knife_empty = "base_sprint_bayonet_empty",
	base_safe = "base_down",
	base_safe_empty = "base_down_empty",
	base_safe_aim = "iron_down",
	base_safe_empty_aim = "iron_down_empty",
	base_crawl = "base_crawl",
	base_crawl_empty = "base_crawl_empty",
	base_melee = "base_melee_bash",
	base_melee_empty = "base_melee_bash_empty",
	base_stab = "base_melee_end",
	base_stab_empty = "base_melee_end_empty",
	
	bipod_in = "deployed_in",
	bipod_in_empty = "deployed_in_empty",
	bipod_fire = {"deployed_fire_1","deployed_fire_2"},
	bipod_fire_aim = {"deployed_iron_fire_1","deployed_iron_fire_2"},
	bipod_fire_last = "deployed_fire_last",
	bipod_fire_last_aim = "deployed_iron_fire_last",
	bipod_fire_empty = "deployed_dryfire",
	bipod_fire_empty_aim = "deployed_iron_dryfire",
	bipod_reload = "deployed_reload",
	bipod_reload_empty = "deployed_reload_empty",
	bipod_idle = "deployed_idle",
	bipod_idle_empty = "deployed_idle_empty",
	bipod_idle_aim = "deployed_iron_idle",
	bipod_idle_empty_aim = "deployed_iron_idle_empty",
	bipod_firemode = "deployed_fireselect",
	bipod_firemode_aim = "deployed_iron_fireselect",
	bipod_firemode_empty = "deployed_iron_fireselect_empty",
	bipod_firemode_empty_aim = "deployed_iron_fireselect_empty",
	bipod_out = "deployed_out",
	bipod_out_empty = "deployed_out_empty",
}

SWEP.SpeedDec = 40

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi", "auto"}
SWEP.Base = "cw_kk_ins2_base"
SWEP.Category = "CW 2.0 KK INS2 DOI"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/cw_kk_doi/v_fg42.mdl"
SWEP.WorldModel		= "models/weapons/w_fg42.mdl"

SWEP.WMPos = Vector(11, 1.5, -1.5)
SWEP.WMAng = Vector(-10, 2.743, 180)

SWEP.CW_GREN_TWEAK = CustomizableWeaponry_KK.ins2.quickGrenade.models.ww2de
SWEP.CW_KK_KNIFE_TWEAK = CustomizableWeaponry_KK.ins2.quickKnife.models.ww2de

SWEP.Spawnable			= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP)
SWEP.AdminSpawnable		= CustomizableWeaponry_KK.ins2.isContentMounted4(SWEP)

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.92x57MM"

SWEP.FireDelay = 60/900
SWEP.FireSound = "CW_KK_INS2_DOI_FG42_FIRE"
SWEP.Recoil = 1.5

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.002
SWEP.VelocitySensitivity = 2
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.17
SWEP.Shots = 1
SWEP.Damage = 60

SWEP.BipodDeployTime = 1.7
SWEP.BipodUndeployTime = 2

SWEP.FirstDeployTime = 0.7
SWEP.DeployTime = 0.7
SWEP.HolsterTime = 0.6

SWEP.WeaponLength = 22

SWEP.Chamberable = false
SWEP.BipodInstalled = true
SWEP.KK_INS2_EmptyIdle = true

SWEP.MuzzleVelocity = 740

SWEP.ReloadTimes = {
	base_reload = {118/31.8, 5.3},
	base_reloadempty = {174/31.8, 7},
	
	deployed_reload = {112/30, 5.7},
	deployed_reload_empty = {168/30, 7.5},
	
	base_melee_bash = {0.3, 1},
	base_melee_bash_empty = {0.3, 1},
}

if CLIENT then
	function SWEP:updateStandardParts()
		-- self.AttachmentModelsVM.slingpin.ent:SetBodygroup(1,self.ActiveAttachments.kk_ins2_ww2_sling and 1 or 0)
	
		self:setElementActive("knife_fold", !self.ActiveAttachments.kk_ins2_ww2_knife)
	end
	
	CustomizableWeaponry_KK.ins2.welementThink:add("cw_kk_ins2_doi_fg42", "bipod")
	
	local pos = Vector(0,0,-0.5)
	local ang = Vector(1,0,0)
	
	CustomizableWeaponry.callbacks:addNew("adjustViewmodelPosition", "KK_DOI_FG42", function(wep, TargetPos, TargetAng)
		if wep:GetClass() != "cw_kk_ins2_doi_fg42" then return end
		if wep.dt.BipodDeployed then
			if wep:isAiming() then return end
			
			return TargetPos + pos, TargetAng + ang
		end
	end)
end
