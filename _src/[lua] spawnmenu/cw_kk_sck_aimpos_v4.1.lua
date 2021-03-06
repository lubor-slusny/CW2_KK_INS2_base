AddCSLuaFile()

local BUILD = "41"

// static
local IRONSIGHTSATT = {
	name = "nil",
	displayName = "None (iron sights)",
	_KK_SCK_prefix = "Ironsight",
	aimPos = {
		"IronsightPos", 
		"IronsightAng"
	},
	isSight = true
}

// menu items
local MENU = {
	SLIDERS = {},
	LABELS = {},
	BUTTS = {},
	PANELS = {},
	OTHER = {},
}

// weapon data
local WEAPON			// current weapon ENT
local SIGHT				// current weapon sight attachment table

local SUFFIX

local function vectorClone(v)
	return Vector(math.Round(v.x,4), math.Round(v.y,4), math.Round(v.z,4))
end

local function getWeaponAtt(wep)
	local att
	
	for attId,isActive in pairs(wep.ActiveAttachments) do
		local data = CustomizableWeaponry.registeredAttachmentsSKey[attId]
		if isActive and data and data.isSecondarySight then
			att = data
		end
	end
	
	if not att then
		for attId,isActive in pairs(wep.ActiveAttachments) do
			if isActive and CustomizableWeaponry.sights[attId] then
				att = CustomizableWeaponry.sights[attId]
			end
		end
	end
	
	if not att then
		att = IRONSIGHTSATT
	end
	
	if not att._KK_SCK_prefix then
		att._KK_SCK_prefix = string.sub(att.aimPos[1], 1, string.len(att.aimPos[1]) - 3)
	end
	
	return att
end

local _LOCK

local function updateSliders()
	_LOCK = true
	for _,slider in pairs(MENU.SLIDERS) do
		slider:_KK_SCK_update()
	end
	_LOCK = false
end

local function vec2fstring(v)
	return "Vector(" .. math.Round(v.x,4) .. ", " .. math.Round(v.y,4) .. ", " .. math.Round(v.z,4) .. ")"
end

local function controlsSetEnabled(b)
	for _,slider in pairs(MENU.SLIDERS) do
		slider:SetEnabled(b)
	end
	for _,button in pairs(MENU.BUTTS) do
		button:SetEnabled(b)
	end
end

local function getSightModel()
	if not WEAPON or not SIGHT then return "N/A" end
	
	if not WEAPON.AttachmentModelsVM then return "N/A" end
	if not WEAPON.AttachmentModelsVM[SIGHT.name] then return "N/A" end
	
	return WEAPON.AttachmentModelsVM[SIGHT.name].model
end

local function updateLabels()
	if WEAPON and SIGHT then
		MENU.LABELS.sightPrint:_KK_setText(SIGHT.displayName)
		MENU.LABELS.sightCode:_KK_setText(SIGHT.name)
		MENU.LABELS.sightModel:_KK_setText(getSightModel())
		MENU.LABELS.sightPrefix:_KK_setText(SIGHT._KK_SCK_prefix)
		
		SUFFIX = SUFFIX or ""
		
		MENU.LABELS.sumHeader:SetText("AimPos Code:")
		MENU.LABELS.sumPos:SetText("SWEP." .. SIGHT.aimPos[1] .. SUFFIX .. " = " .. vec2fstring(WEAPON[SIGHT.aimPos[1]]))
		MENU.LABELS.sumAng:SetText("SWEP." .. SIGHT.aimPos[2] .. SUFFIX .. " = " .. vec2fstring(WEAPON[SIGHT.aimPos[2]]))
		
		controlsSetEnabled(true)
		
		return
	end
	
	MENU.LABELS.sightPrint:SetText("Current weapon does not use CW2 Base.")
	MENU.LABELS.sightCode:SetText("")
	MENU.LABELS.sightModel:SetText("")
	MENU.LABELS.sightPrefix:SetText("")

	MENU.LABELS.sumHeader:SetText("")
	MENU.LABELS.sumPos:SetText("")
	MENU.LABELS.sumAng:SetText("")
	
	for _,slider in pairs(MENU.SLIDERS) do
		slider:SetValue(0)
	end
	
	controlsSetEnabled(false)
end

local _LAST_SETUP

local function menuThink()
	local ply = LocalPlayer()
	if !IsValid(ply) then return end
	
	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then return end
	
	if wep.CW20Weapon then
		local wepClass = wep:GetClass()
		
		local att = getWeaponAtt(wep)
		
		local setup = wepClass .. "|" .. att.name
		
		if setup != _LAST_SETUP then
			WEAPON = wep
			SIGHT = att
			
			if not WEAPON._KK_SCK_modifiedPositions then WEAPON._KK_SCK_modifiedPositions = {} end
			
			updateSliders()
		end
		_LAST_SETUP = setup
	else
		WEAPON = nil
		SIGHT = nil
		_LAST_SETUP = nil
	end
	
	updateLabels()
end

// menu element funcs

local function sliderChanged(slider, val)
	if WEAPON and SIGHT and not _LOCK then
		RunConsoleCommand("cw_kk_sck_lock_ads","1")
		RunConsoleCommand("cw_kk_freeze_reticles","1")
		RunConsoleCommand("cw_freeaim","0")
	
		WEAPON._KK_SCK_modifiedPositions[SIGHT.name] = true
		
		local new = math.Round(val,4)
	
		local vec = vectorClone(WEAPON[SIGHT._KK_SCK_prefix .. slider._KK_SCK_vec])
		vec[slider._KK_SCK_vec_pos] = new
		
		WEAPON["Aim" .. slider._KK_SCK_vec] = vectorClone(vec)
		WEAPON["Blend" .. slider._KK_SCK_vec] = vectorClone(vec)
		WEAPON[SIGHT._KK_SCK_prefix .. slider._KK_SCK_vec] = vectorClone(vec)  // does affect weapon.stored? // nope, does not, we re good
	end
end

local function sliderUpdate(slider)
	if not WEAPON or not SIGHT then return end
	
	if not WEAPON[SIGHT._KK_SCK_prefix .. slider._KK_SCK_vec] then
		WEAPON[SIGHT._KK_SCK_prefix .. slider._KK_SCK_vec] = Vector(0, 0, 0)
	end
	
	slider:SetValue(WEAPON[SIGHT._KK_SCK_prefix .. slider._KK_SCK_vec][slider._KK_SCK_vec_pos])
end

local function buttonReloadAimPos()
	if not WEAPON or not SIGHT then return end
	
	local stored = weapons.GetStored(WEAPON:GetClass())

	local posCopy = vectorClone(stored[SIGHT.aimPos[1]] or Vector(0,0,0))
	local angCopy = vectorClone(stored[SIGHT.aimPos[2]] or Vector(0,0,0))
	
	WEAPON[SIGHT.aimPos[1]] = posCopy
	WEAPON[SIGHT.aimPos[2]] = angCopy
	
	WEAPON["AimPos"] = posCopy
	WEAPON["AimAng"] = angCopy
	
	WEAPON._KK_SCK_modifiedPositions[SIGHT.name] = false
	
	updateSliders()
end

local function buttonResetSliders()
	if not WEAPON or not SIGHT then return end
	
	for _,slider in pairs(MENU.SLIDERS) do
		if slider._KK_SCK_vec then
			slider:SetValue(0)
		end
	end
	
	WEAPON._KK_SCK_modifiedPositions[SIGHT.name] = true
end

local function buttonExportCurrent()
	if not WEAPON or not SIGHT then return end
	
	SUFFIX = SUFFIX or ""
			
	local out = "\n	"
	out = out .. "SWEP." .. SIGHT.aimPos[1] .. SUFFIX .. " = "
	out = out .. vec2fstring(WEAPON[SIGHT.aimPos[1]]) .. "\n	"
	out = out .. "SWEP." .. SIGHT.aimPos[2] .. SUFFIX .. " = "
	out = out .. vec2fstring(WEAPON[SIGHT.aimPos[2]]) .. "\n"
	
	SetClipboardText(out)
end

local function buttonExportAll()
	if not WEAPON or not SIGHT or not WEAPON._KK_SCK_modifiedPositions then return end
	
	local out = ""
	
	for attId,wasModified in pairs(WEAPON._KK_SCK_modifiedPositions) do 
		if wasModified then 
			local sight = CustomizableWeaponry.registeredAttachmentsSKey[attId]
			
			if !sight and attId == IRONSIGHTSATT.name then
				sight = IRONSIGHTSATT
			end
			
			SUFFIX = SUFFIX or ""
			
			out = out .. "\n"
			-- out = out .. "	SWEP." .. sight.aimPos[1] .. " = " .. vec2fstring(WEAPON[sight.aimPos[1]]) .. "\n"
			-- out = out .. "	SWEP." .. sight.aimPos[2] .. " = " .. vec2fstring(WEAPON[sight.aimPos[2]]) .. "\n"
			out = out .. "	SWEP." .. sight.aimPos[1] .. SUFFIX .. " = " .. vec2fstring(WEAPON[sight.aimPos[1]]) .. "\n"
			out = out .. "	SWEP." .. sight.aimPos[2] .. SUFFIX .. " = " .. vec2fstring(WEAPON[sight.aimPos[2]]) .. "\n"
		end
	end
	
	SetClipboardText(out)
end

local function buildPanel(panel)
	panel:ClearControls()
	
	panel:AddControl("CheckBox", {Label = "[Override] Force GM crosshair", Command = "cw_kk_gm_xhair"}):DockMargin(8, 0, 8, 0)
	panel:AddControl("CheckBox", {Label = "Freeze reticles (RT and Stencils only)", Command = "cw_kk_freeze_reticles"}):DockMargin(8, 0, 8, 0)
	panel:AddControl("CheckBox", {Label = "Hold aim", Command = "cw_kk_sck_lock_ads"}):DockMargin(8, 0, 8, 0)
		
	MENU.LABELS.buildHeader = panel:AddControl("Label", {Text = "AimPos Building:"})
	MENU.LABELS.buildHeader:DockMargin(0, 0, 0, 0)
	
	MENU.BUTTS.apb_reload = vgui.Create("DButton", panel)
	MENU.BUTTS.apb_reload:SetText("Reload AimPos")
	MENU.BUTTS.apb_reload:SetTooltip("Reloads original AimPos.")
	MENU.BUTTS.apb_reload:DockMargin(8, 0, 8, 0)
	MENU.BUTTS.apb_reload.DoClick = buttonReloadAimPos
	panel:AddItem(MENU.BUTTS.apb_reload)
	
	MENU.BUTTS.apb_000000 = vgui.Create("DButton", panel)
	MENU.BUTTS.apb_000000:SetText("Wipe AimPos")
	MENU.BUTTS.apb_000000:SetTooltip("Sets all aimpos sliders to 0.")
	MENU.BUTTS.apb_000000:DockMargin(8, 0, 8, 0)
	MENU.BUTTS.apb_000000.DoClick = buttonResetSliders
	panel:AddItem(MENU.BUTTS.apb_000000)
	
	MENU.PANELS.sightPrint = vgui.Create("DPanel", panel)
	
		MENU.LABELS.sightPrint = vgui.Create("DLabel", MENU.PANELS.sightPrint)
		MENU.LABELS.sightPrint:SetDark(true)
		MENU.LABELS.sightPrint:Dock(FILL)
		MENU.LABELS.sightPrint:SizeToContents()
		MENU.LABELS.sightPrint:SetMouseInputEnabled(true)
		
		function MENU.LABELS.sightPrint:_KK_setText(t)
			self:SetText("Print: " .. t)
		end
		
		function MENU.LABELS.sightPrint:DoClick()
			if not WEAPON or not SIGHT then return end
			SetClipboardText(SIGHT.displayName)
		end
	
		MENU.PANELS.sightPrint:DockMargin(8, 0, 8, -4)
		MENU.PANELS.sightPrint:SetTall(16)
		
	panel:AddItem(MENU.PANELS.sightPrint)
	
	MENU.PANELS.sightCode = vgui.Create("DPanel", panel)
	
		MENU.LABELS.sightCode = vgui.Create("DLabel", MENU.PANELS.sightCode)
		MENU.LABELS.sightCode:SetDark(true)
		MENU.LABELS.sightCode:Dock(FILL)
		MENU.LABELS.sightCode:SizeToContents()
		MENU.LABELS.sightCode:SetMouseInputEnabled(true)
		
		function MENU.LABELS.sightCode:_KK_setText(t)
			self:SetText("Code: [\"" .. t .. "\"]")
		end
		
		function MENU.LABELS.sightCode:DoClick()
			if not WEAPON or not SIGHT then return end
			SetClipboardText(SIGHT.name)
		end
		
		MENU.PANELS.sightCode:DockMargin(8, -4, 8, -4)
		MENU.PANELS.sightCode:SetTall(16)
		
	panel:AddItem(MENU.PANELS.sightCode)
	
	MENU.PANELS.sightModel = vgui.Create("DPanel", panel)
	
		MENU.LABELS.sightModel = vgui.Create("DLabel", MENU.PANELS.sightModel)
		MENU.LABELS.sightModel:SetDark(true)
		MENU.LABELS.sightModel:Dock(FILL)
		MENU.LABELS.sightModel:SizeToContents()
		MENU.LABELS.sightModel:SetMouseInputEnabled(true)
		
		function MENU.LABELS.sightModel:_KK_setText(t)
			self:SetText("Model: " .. t)
		end
		
		function MENU.LABELS.sightModel:DoClick()
			if not WEAPON or not SIGHT then return end
			SetClipboardText(getSightModel())
		end
		
		MENU.PANELS.sightModel:DockMargin(8, -4, 8, -4)
		MENU.PANELS.sightModel:SetTall(16)
		
	panel:AddItem(MENU.PANELS.sightModel)
	
	MENU.PANELS.sightPrefix = vgui.Create("DPanel", panel)
			
		MENU.LABELS.sightPrefix = vgui.Create("DLabel", MENU.PANELS.sightPrefix)
		MENU.LABELS.sightPrefix:SetDark(true)
		MENU.LABELS.sightPrefix:Dock(FILL)
		MENU.LABELS.sightPrefix:SizeToContents()
		MENU.LABELS.sightPrefix:SetMouseInputEnabled(true)
		
		function MENU.LABELS.sightPrefix:_KK_setText(t)
			self:SetText("Prefix: " .. t)
		end
		
		function MENU.LABELS.sightPrefix:DoClick()
			if not WEAPON or not SIGHT then return end
			SetClipboardText(SIGHT._KK_SCK_prefix)
		end
		
		MENU.PANELS.sightPrefix:DockMargin(8, -4, 8, -4)
		MENU.PANELS.sightPrefix:SetTall(16)
	
	panel:AddItem(MENU.PANELS.sightPrefix)
	
	MENU.LABELS.suffixLabel = vgui.Create("DLabel", panel)
	MENU.LABELS.suffixLabel:SetText("Mod suffix:")
	MENU.LABELS.suffixLabel:SetDark(true)
	MENU.LABELS.suffixLabel:DockMargin(12, 0, 8, 0)
	
	MENU.OTHER.suffixEntry = vgui.Create("DTextEntry", panel)
	MENU.OTHER.suffixEntry:Dock(TOP)
	MENU.OTHER.suffixEntry:DockMargin(8, -4, 12, -4)
	
	function MENU.OTHER.suffixEntry:OnEnter()
		SUFFIX = self:GetValue()
	end
	
	panel:AddItem(MENU.LABELS.suffixLabel, MENU.OTHER.suffixEntry)
	
	local id
	
	id = "px"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-50, 50)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Pos.x")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Pos"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "x"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])

	id = "py"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-50, 50)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Pos.y")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Pos"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "y"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])

	id = "pz"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-50, 50)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Pos.z")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Pos"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "z"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])

	id = "ax"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-180, 180)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Pitch")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Ang"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "x"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])

	id = "ay"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-180, 180)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Yaw")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Ang"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "y"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])

	id = "az"
	MENU.SLIDERS[id] = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS[id]:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS[id]:SetDecimals(4)
	MENU.SLIDERS[id]:SetMinMax(-180, 180)
	MENU.SLIDERS[id]:SetValue(0)
	MENU.SLIDERS[id]:SetText("Roll")
	MENU.SLIDERS[id]:SetDark(true)
	MENU.SLIDERS[id].OnValueChanged = sliderChanged
	MENU.SLIDERS[id]._KK_SCK_vec = "Ang"
	MENU.SLIDERS[id]._KK_SCK_vec_pos = "z"
	MENU.SLIDERS[id]._KK_SCK_update = sliderUpdate
	panel:AddItem(MENU.SLIDERS[id])
	
	MENU.PANELS.sum = vgui.Create("DPanel", panel)
	
		MENU.LABELS.sumHeader = vgui.Create("DLabel", MENU.PANELS.sum)
		MENU.LABELS.sumHeader:SetText("AimPos Code:")
		MENU.LABELS.sumHeader:SetDark(true)
		MENU.LABELS.sumHeader:Dock(TOP)
		MENU.LABELS.sumHeader:DockMargin(0,0,0,-12)
		MENU.LABELS.sumHeader:SetMouseInputEnabled(true)
		MENU.LABELS.sumHeader.DoClick = buttonExportCurrent
		
		MENU.LABELS.sumPos = vgui.Create("DLabel", MENU.PANELS.sum)
		MENU.LABELS.sumPos:SetDark(true)
		MENU.LABELS.sumPos:Dock(FILL)
		MENU.LABELS.sumPos:DockMargin(0,-12,0,-12)
		MENU.LABELS.sumPos:SetMouseInputEnabled(true)
		MENU.LABELS.sumPos.DoClick = buttonExportCurrent
		
		MENU.LABELS.sumAng = vgui.Create("DLabel", MENU.PANELS.sum)
		MENU.LABELS.sumAng:SetDark(true)
		MENU.LABELS.sumAng:Dock(BOTTOM)
		MENU.LABELS.sumAng:DockMargin(0,-12,0,0)
		MENU.LABELS.sumAng:SetMouseInputEnabled(true)
		MENU.LABELS.sumAng.DoClick = buttonExportCurrent
		
		MENU.PANELS.sum:DockMargin(8, 0, 8, 0)
		MENU.PANELS.sum:SetTall(48)
		
	panel:AddItem(MENU.PANELS.sum)
	
	MENU.BUTTS.apb_export2 = vgui.Create("DButton", panel)
	MENU.BUTTS.apb_export2:SetText("Export all modified")
	MENU.BUTTS.apb_export2:SetTooltip("Copies all modified AimPositions of current weapon to clipboard.")
	MENU.BUTTS.apb_export2:DockMargin(8, 0, 8, 0)
	MENU.BUTTS.apb_export2.DoClick = buttonExportAll
	panel:AddItem(MENU.BUTTS.apb_export2)
	
	MENU.SLIDERS.fovAim = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS.fovAim:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS.fovAim:SetDecimals(0)
	MENU.SLIDERS.fovAim:SetMinMax(0, 85)
	MENU.SLIDERS.fovAim:SetValue(0)
	MENU.SLIDERS.fovAim:SetText("\"ZoomAmount\":")
	MENU.SLIDERS.fovAim:SetDark(true)
	
	function MENU.SLIDERS.fovAim:OnValueChanged(val)
		if not WEAPON or not SIGHT then return end
		
		WEAPON.ZoomAmount = val
	end
	
	function MENU.SLIDERS.fovAim:_KK_SCK_update()
		if not WEAPON or not SIGHT then return end
		
		self:SetValue(WEAPON.ZoomAmount)
	end
	
	panel:AddItem(MENU.SLIDERS.fovAim)

	MENU.SLIDERS.fovVM = vgui.Create("DNumSlider", panel)
	MENU.SLIDERS.fovVM:DockMargin(8, 0, 8, 0)
	MENU.SLIDERS.fovVM:SetDecimals(0)
	MENU.SLIDERS.fovVM:SetMinMax(1, 150)
	MENU.SLIDERS.fovVM:SetValue(0)
	MENU.SLIDERS.fovVM:SetText("ViewModelFOV:")
	MENU.SLIDERS.fovVM:SetDark(true)
	
	function MENU.SLIDERS.fovVM:OnValueChanged(val)
		if not WEAPON or not SIGHT then return end
		WEAPON.ViewModelFOV = val
	end
	
	function MENU.SLIDERS.fovVM:_KK_SCK_update()
		if not WEAPON or not SIGHT then return end
		self:SetValue(WEAPON.ViewModelFOV)
	end
	
	panel:AddItem(MENU.SLIDERS.fovVM)

	for _,dpanel in pairs(MENU.PANELS) do
		dpanel:DockPadding(4, 0, 4, 0)
		dpanel:SetTooltip("Copy to clipboard.")
	end
	
	hook.Add("Think", "CW_KK_DEV_MENU_" .. BUILD, menuThink)
end

CreateClientConVar("cw_kk_dev_menu", 0, true, false)

hook.Add( "PopulateToolMenu", "KK_SCK_AIMPOS_" .. BUILD, function()
	if GetConVarNumber("cw_kk_dev_menu") != 0 then 
		spawnmenu.AddToolMenuOption("Utilities", "Knife Kitty", "KK_SCK_AIMPOS_" .. BUILD, "Sight positions 4.1", "", "", buildPanel) 
	end
end)

hook.Add("PostReloadToolsMenu", "CW_KK_DEV_MENU_" .. BUILD .. "_REMOVER", function()
	hook.Remove("Think", "CW_KK_DEV_MENU_" .. BUILD)
end)

// DELETE BELOW // debug code
RunConsoleCommand("spawnmenu_reload")
