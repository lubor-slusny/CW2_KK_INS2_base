if not CustomizableWeaponry_KK.HOME then return end

local TOOL = {}

TOOL.Name = "elements"
TOOL.PrintName = "Element Browser 3"
TOOL.Version = "3.0"

TOOL.states = {}

TOOL.states.nowep = {}
TOOL.states.elementList = {}
TOOL.states.elementEdit = {}
TOOL.states.elementMake = {}

function TOOL:_updatePanel()
	local panel = self._panel
	local wep = self._wep
	
	if !IsValid(panel) then return end
	
	panel:ClearControls()
	
	if !IsValid(wep) then
		self:ThrowNewInvalidWeapon()
		return
	end
	
	if !wep.CW20Weapon then
		self:ThrowNewNotCW2Weapon()
		return
	end
	
	panel:AddControl("Label", {Text = "2doo"})
end

function TOOL:SetPanel(panel)
	self._panel = panel
	self:_updatePanel()
end

function TOOL:OnWeaponChanged(new, old)
	self._wep = new
	self:_updatePanel()
end

CustomizableWeaponry_KK.sck:AddTool(TOOL)

TOOL:_updatePanel()
