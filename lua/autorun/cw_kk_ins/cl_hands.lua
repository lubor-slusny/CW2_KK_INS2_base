
if CLIENT then
	CustomizableWeaponry_KK.ins2.hands = {}
	
	function CustomizableWeaponry_KK.ins2.hands:_get(i)
		i = i or 1
		return self.cache[math.Round(math.Clamp(i, 1, self.cacheSize), 0)]
	end
	
	CustomizableWeaponry_KK.ins2.hands.cache = {
		{"models/gmod4phun/c_ins_to_gmod_hands.mdl", "[GM] PM hands (by GM4Ph)", mergeGMHands = true},
		{"models/weapons/v_cw_kk_ins2_hands_css.mdl", "[CSS] shared"},
		
		{"models/weapons/v_hands_vip.mdl", "[INS] Very Individual Player"},
		{"models/weapons/v_hands_ins_h.mdl", "[INS] T Heavy"},
		{"models/weapons/v_hands_ins_m.mdl", "[INS] T Medium"},
		{"models/weapons/v_hands_ins_l.mdl", "[INS] T Light"},
		{"models/weapons/v_hands_sec_h.mdl", "[INS] CT Heavy"},
		{"models/weapons/v_hands_sec_m.mdl", "[INS] CT Medium"},
		{"models/weapons/v_hands_sec_l.mdl", "[INS] CT Light"},
	}
	
	function CustomizableWeaponry_KK.ins2.hands:addModel(tab)
		table.insert(self.cache, tab)
		self.cacheSize = table.Count(self.cache)
	end
	
	if CustomizableWeaponry_KK.ins2.isContentMounted4({Folder = "weapons/doigameContentOK"}) then
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_brit.mdl", "[DOI] GB Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_brit.mdl", "[DOI] GB Sleeve"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_brit_gloves.mdl", "[DOI] GB Gloved"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_brit_indian.mdl", "[DOI] GB India Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_brit_indian.mdl", "[DOI] GB India Sleeve"})
		
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_us.mdl", "[DOI] US Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_us.mdl", "[DOI] US Sleeve"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_us_glove.mdl", "[DOI] US Gloved"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_us_glove_airborne.mdl", "[DOI] US Para"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_us_buffalo.mdl", "[DOI] US Buff Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_us_buffalo.mdl", "[DOI] US Buff Sleeve"})
		
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_ger.mdl", "[DOI] DE Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_ger.mdl", "[DOI] DE Sleeve"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_ger_gloves.mdl", "[DOI] DE Gloved"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_ger_wehrmacht.mdl", "[DOI] DE Wehr Sleeve"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_ger_gloves_wehrmacht.mdl", "[DOI] DE Wehr Gloved"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_ger_gloves_paratrooper.mdl", "[DOI] DE Para"})
	end
	
	if CustomizableWeaponry_KK.ins2.isContentMounted4({Folder = "weapons/cw_kk_ins2_nam_"}) then
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_us_nam.mdl", "[B2K] US Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_nam_hands_us.mdl", "[B2K] US Sleeve"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_short_us_black.mdl", "[B2K] US2 Short"})
		CustomizableWeaponry_KK.ins2.hands:addModel({"models/weapons/v_hands_nva.mdl", "[B2K] NVA Short"})
	end
end
