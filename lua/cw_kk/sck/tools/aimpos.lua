if not CustomizableWeaponry_KK.HOME then return end

local TOOL = {}

TOOL.Name = "aimpos"
TOOL.PrintName = "AimPos Builder 5"
TOOL.Version = "5.0"

function TOOL:Initialize()
	self._relevantAttsCache = false
	
	if not self._relevantAttsCache then
		local primary = {}
		local secondary = {}
		local grenade = {}
		
		for _,att in pairs(CustomizableWeaponry.registeredAttachments) do
			local attInfo = {}
			local subCache
			
			if att.isSight then
				subCache = primary
			elseif att.isSecondarySight then
				subCache = secondary
			elseif att.isGrenadeLauncher then
				attInfo.prefix = "M203"
				subCache = grenade
			else
				continue
			end
			
			attInfo.name = att.name
			attInfo.displayName = att.displayName
			attInfo.prefix = attInfo.prefix
				or att.aimPos and
					string.sub(att.aimPos[1], 1, string.len(att.aimPos[1]) - 3)
				or "Aim"
			
			table.insert(subCache, attInfo)
		end
		
		self._relevantAttsCache = {}
		self._relevantAttsCache.secondary = secondary
		self._relevantAttsCache.grenade = grenade
		self._relevantAttsCache.primary = primary
	end
	
	self._relevantAttsCache.fallback = {
		name = "nil",
		displayName = "Blank (iron sights)",
		prefix = "Ironsight"
	}
end

function TOOL:_addSectionCvars(panel)
	panel:AddControl("CheckBox", {Label = "Force GM crosshair", Command = "_cw_kk_gm_xhair"}):DockMargin(8, 0, 8, 0)
	panel:AddControl("CheckBox", {Label = "Freeze reticles (supported sights only)", Command = "cw_kk_freeze_reticles"}):DockMargin(8, 0, 8, 0)
	panel:AddControl("CheckBox", {Label = "Hold aim (+attack2 spam)", Command = "_cw_kk_sck_lock_ads"}):DockMargin(8, 0, 8, 0)
	panel:AddControl("CheckBox", {Label = "Free Aim: Enabled (shortcut)", Command = "cw_freeaim"}):DockMargin(8, 0, 8, 0)
end

function TOOL:_addSectionAttInfo(panel, wep)
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Sight setup:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:SizeToContents()
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("[LMB - COPY]")
		label:SetDark(true)
		label:Dock(RIGHT)
		label:SizeToContents()
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:SetTall(16)
	backgroundPanel:SetPaintBackground(false)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local value = self._att.displayName
		local function DoClick() SetClipboardText(value) end
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Print:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:DockMargin(8,0,4,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText(value)
		label:SetDark(true)
		label:Dock(RIGHT)
		label:DockMargin(4,0,8,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	backgroundPanel:SetMouseInputEnabled(true)
	backgroundPanel.DoClick = DoClick
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local value = self._att.name
		local function DoClick() SetClipboardText(value) end
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Code:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:DockMargin(8,0,4,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText(value)
		label:SetDark(true)
		label:Dock(RIGHT)
		label:DockMargin(4,0,8,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local value = 
			wep.AttachmentModelsVM and
			wep.AttachmentModelsVM[self._att.name] and 
			wep.AttachmentModelsVM[self._att.name].model or
			""
		local function DoClick() SetClipboardText(value) end
		local parts = string.Explode("/", value)
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Model:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:DockMargin(8,0,4,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText(parts[#parts])
		label:SetDark(true)
		label:Dock(RIGHT)
		label:DockMargin(4,0,8,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local value = self._att.prefix
		local function DoClick() SetClipboardText(value) end
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Prefix:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:DockMargin(8,0,4,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText(value)
		label:SetDark(true)
		label:Dock(RIGHT)
		label:DockMargin(4,0,8,0)
		label:SizeToContents()
		label:SetMouseInputEnabled(true)
		label.DoClick = DoClick
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Custom Suffix:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:DockMargin(8,0,4,0)
		label:SizeToContents()
		
		local entry = vgui.Create("DTextEntry", backgroundPanel)
		entry:Dock(FILL)
		entry:DockMargin(4,0,0,0)
		
		function entry:OnEnter()
		end
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
end

function TOOL:_addSectionWipeReload(panel, wep)
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local listView = vgui.Create("DListView", backgroundPanel)
		listView:SetHeaderHeight(20)
		listView:AddColumn("Wipe")
		listView:AddColumn("Reload")
		
		listView:Dock(FILL)
		listView:SizeToContents()
		listView:SetPaintBackground(false)
		listView:FixColumnsLayout()
		listView.OnRequestResize = function() end
		
		function listView:SortByColumn(i)
			// wipe
			if (i == 1) then
				for _,slider in pairs(TOOL._sightSliders) do
					slider:SetValue(0)
				end
				
				return
			end
			
			// reload
			local prefix = TOOL._att.prefix
			local suffix = ""
			
			local stored = weapons.GetStored(wep:GetClass())
			if stored then
				for _,part in pairs({"Pos", "Ang"}) do
					local key = prefix .. part .. suffix
					local vec = stored[key]
					wep[key] = Vector(vec)
					wep["Aim" .. part] = Vector(vec)
					wep["Blend" .. part] = Vector(vec)
				end
			end
			
			TOOL:_updatePanel()
		end
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
end

function TOOL:_addSectionSlidersSight(panel, wep)
	local prefix = self._att.prefix
	local suffix = ""
	
	for _,part in pairs({"Pos", "Ang"}) do
		local key = prefix .. part .. suffix
		wep[key] = 
			wep[key] and 
			Vector(wep[key]) or
			Vector()
	end
	
	self._sightSliders = {}
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
	
	for _,s in pairs({
		{"Pos", "x", -50, 50},
		{"Pos", "y", -50, 50},
		{"Pos", "z", -50, 50},
		{"Ang", "p", -90, 90},
		{"Ang", "y", -90, 90},
		{"Ang", "r", -90, 90},
	}) do
		local slider = vgui.Create("DNumSlider", backgroundPanel)
		slider:Dock(TOP)
		slider:DockMargin(8,0,8,0)
		slider:SetText(s[1] .. "." .. s[2])
		slider:SetDark(true)
		slider:SetMinMax(s[3], s[4])
		slider:SetDecimals(4)
		slider:SetValue(wep[prefix .. s[1] .. suffix][s[2]])
		
		self:LoadSliderZoom(slider)
		
		function slider:OnValueChanged(val)
			TOOL:SaveSliderZoom(self)
			
			RunConsoleCommand("_cw_kk_sck_lock_ads","1")
			RunConsoleCommand("cw_kk_freeze_reticles","1")
			RunConsoleCommand("cw_freeaim","0")
			
			local vec = wep[prefix .. s[1] .. suffix]
			vec[s[2]] = val
			wep["Aim" .. s[1]] = Vector(vec)
			wep["Blend" .. s[1]] = Vector(vec)
		end
		
		table.insert(self._sightSliders, slider)
	end
	
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,32*6)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
end

function TOOL:_addSectionExports(panel, wep)
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("Sight Code:")
		label:SetDark(true)
		label:Dock(LEFT)
		label:SizeToContents()
		
		local label = vgui.Create("DLabel", backgroundPanel)
		label:SetText("[LMB - COPY]")
		label:SetDark(true)
		label:Dock(RIGHT)
		label:SizeToContents()
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:SetTall(16)
	backgroundPanel:SetPaintBackground(false)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
	
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,40)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
	
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,40)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
	
	local backgroundPanel = vgui.Create("DPanel", panel)
	panel:AddItem(backgroundPanel)
		
		local listView = vgui.Create("DListView", backgroundPanel)
		listView:SetHeaderHeight(20)
		listView:AddColumn("Export all normal")
		listView:AddColumn("Export all as backup")
		
		listView:Dock(FILL)
		listView:SizeToContents()
		listView:SetPaintBackground(false)
		listView:FixColumnsLayout()
		listView.OnRequestResize = function() end
		
		function listView:SortByColumn(i)
			TOOL:ThrowNewNotImplemented()
			
			if (i == 1) then
				// wipe
				return
			end
			
			// reload
		end
		
	backgroundPanel:Dock(TOP)
	backgroundPanel:DockMargin(8,0,8,0)
	backgroundPanel:SetSize(200,20)
	backgroundPanel:SetPaintBackground(true)
	backgroundPanel:SizeToContents()
end

function TOOL:_addSectionMisc(panel, wep)
	panel:AddControl("Label", {Text = "Misc:"}):DockMargin(0,0,0,0)
	panel:AddControl("Label", {Text = "slider zoomamount"})
	panel:AddControl("Label", {Text = "slider aimvmfov"})
	panel:AddControl("Label", {Text = "slider aimswayintense"})
end

function TOOL:_prepareAttInfo(wep)
	if (wep.dt.INS2GLActive or wep.dt.M203Active) then
		for _,att in pairs(self._relevantAttsCache.grenade) do
			if wep.ActiveAttachments[att.name] then
				self._att = att
				return
			end
		end
	end
	
	for _,att in pairs(self._relevantAttsCache.secondary) do
		if wep.ActiveAttachments[att.name] then
			self._att = att
			return
		end
	end
	
	for _,att in pairs(self._relevantAttsCache.primary) do
		if wep.ActiveAttachments[att.name] then
			self._att = att
			return
		end
	end
	
	self._att = self._relevantAttsCache.fallback
end

function TOOL:_updatePanel()
	local panel = self._panel
	local wep = self._wep
	
	if !IsValid(panel) then return end
	
	panel:ClearControls()
	
	if !IsValid(wep) or !wep.CW20Weapon then
		panel:AddControl("Label", {Text = "Not a CW2 swep, move along."})
		return
	end
	
	self:_prepareAttInfo(wep)
	
	self:_addSectionCvars(panel)
	self:_addSectionAttInfo(panel, wep)
	self:_addSectionWipeReload(panel, wep)
	self:_addSectionSlidersSight(panel, wep)
	self:_addSectionExports(panel, wep)
	self:_addSectionMisc(panel, wep)
end

function TOOL:SetPanel(panel)
	self._panel = panel
	self:_updatePanel()
end

function TOOL:OnWeaponChanged(new, old)
	self._wep = new
	self:_updatePanel()
end

function TOOL:OnWeaponSetupChanged()
	self:_updatePanel()
end

CustomizableWeaponry_KK.sck:AddTool(TOOL)

TOOL:_updatePanel()
