local CanCureMagic = false
local CanCureDisease = false
local CanCurePoison = false
local CanCureCurse = false

local Cures = { } 
local CuresCount = 0

local function AddSpell(spellID)
	local name = Healium_GetSpellName(spellID)
	if name then
		for _, existingName in ipairs(Healium_Spell.BaseName) do
			if existingName == name then
				return
			end
		end

		table.insert(Healium_Spell.BaseName, name)
	end
end

local function Count(tab)
	local cnt = 0
	
	for _, k in pairs(tab) do
		cnt = cnt + 1
	end
	
	return cnt
end

-- Forever spell families are based on the class spellbooks published for the
-- 1.60.1 client.  Only one base spell ID is needed for each family; Healium
-- discovers every learned rank from the player's spellbook at runtime.
function Healium_InitSpells(class, race)
	Healium_DebugPrint("Healium_InitSpells class = " .. class .. " race = " .. race)
	local CureName
	
	-- clear cures
	Healium_Spell.BaseName = {}
	Healium_Spell.Name = {}
	Healium_Spell.Rank = {}
	Healium_Spell.DisplayName = {}
	Healium_Spell.Icon = {}
	Healium_Spell.ID = {}
	
	Cures = {}
	

	-- Init spell list
	if (class == "DRUID") then 
		-- Heals
		AddSpell(5185)       -- Healing Touch
		AddSpell(774)        -- Rejuvenation
		AddSpell(8936)       -- Regrowth
		AddSpell(48438)      -- Wild Growth

		-- Cures
		AddSpell(8946)       -- Cure Poison
		AddSpell(2782)       -- Remove Curse
		AddSpell(2893)       -- Abolish Poison

		-- Buffs
		AddSpell(1126)       -- Mark of the Wild
		AddSpell(29166)      -- Innervate
		AddSpell(21849)      -- Gift of the Wild

		-- Other
		AddSpell(20484)      -- Rebirth
		AddSpell(50769)      -- Revive

		-- Druid Remove Curse
		CureName = Healium_GetSpellName(2782) 
		if CureName then 
			Cures[CureName] = { 
				CanCureCurse = true,
			}
		end
		
		-- Druid Abolish Poison
		CureName = Healium_GetSpellName(2893)
		if CureName then 
			Cures[CureName] = { 
				CanCurePoison = true, 
			}
		end

		-- Druid Cure Poison
		CureName = Healium_GetSpellName(8946)
		if CureName then
			Cures[CureName] = {
				CanCurePoison = true,
			}
		end
	end

	if (class == "PRIEST") then 
		-- Heals
		AddSpell(2050)       -- Lesser Heal
		AddSpell(139)        -- Renew
		AddSpell(2054)       -- Heal
		AddSpell(2061)       -- Flash Heal
		AddSpell(596)        -- Prayer of Healing
		AddSpell(2060)       -- Greater Heal
		AddSpell(32546)      -- Binding Heal
		AddSpell(33076)      -- Prayer of Mending
		AddSpell(47540)      -- Penance

		-- Cures
		AddSpell(528)        -- Cure Disease
		AddSpell(552)        -- Abolish Disease
		AddSpell(527)        -- Dispel Magic

		-- Buffs
		AddSpell(1243)       -- Power Word: Fortitude
		AddSpell(17)         -- Power Word: Shield
		AddSpell(14752)      -- Divine Spirit
		AddSpell(21562)      -- Prayer of Fortitude
		AddSpell(27681)      -- Prayer of Spirit

		-- Other
		AddSpell(2006)       -- Resurrection

		-- Priest Dispel Magic
		CureName = Healium_GetSpellName(527)
		if CureName then 
			Cures[CureName] = { 
				CanCureMagic = true 
			}
		end
		
		-- Priest Cure Disease
		CureName = Healium_GetSpellName(528)
		if CureName then 
			Cures[CureName] = { 
				CanCureDisease = true,
			}
		end

		-- Priest Abolish Disease
		CureName = Healium_GetSpellName(552)
		if CureName then
			Cures[CureName] = {
				CanCureDisease = true,
			}
		end
	end

	if (class == "SHAMAN") then
		-- Heals
		AddSpell(331)        -- Healing Wave
		AddSpell(8004)       -- Lesser Healing Wave
		AddSpell(1064)       -- Chain Heal
		AddSpell(61295)      -- Riptide

		-- Cures
		AddSpell(526)        -- Cure Poison
		AddSpell(2870)       -- Cure Disease

		-- Buffs

		-- Other
		AddSpell(2008)       -- Ancestral Spirit
		
		-- Shaman Cure Poison
		CureName = Healium_GetSpellName(526)
		if CureName then 
			Cures[CureName] = { 
				CanCurePoison = true,
			} 
		end
		
		-- Shaman Cure Disease
		CureName = Healium_GetSpellName(2870)
		if CureName then
			Cures[CureName] = {
				CanCureDisease = true,
			}
		end		
	end

	if (class == "PALADIN") then
		-- Heals
		AddSpell(635)        -- Holy Light
		AddSpell(633)        -- Lay on Hands
		AddSpell(19750)      -- Flash of Light
		AddSpell(20473)      -- Holy Shock

		-- Cures
		AddSpell(1152)       -- Purify
		AddSpell(4987)       -- Cleanse

		-- Buffs
		AddSpell(19740)      -- Blessing of Might
		AddSpell(19742)      -- Blessing of Wisdom
		AddSpell(19977)      -- Blessing of Light
		AddSpell(1022)       -- Blessing of Protection
		AddSpell(1044)       -- Blessing of Freedom
		AddSpell(1038)       -- Blessing of Salvation
		AddSpell(19752)      -- Divine Intervention
		AddSpell(6940)       -- Blessing of Sacrifice
		AddSpell(20217)      -- Blessing of Kings
		AddSpell(25782)      -- Greater Blessing of Might
		AddSpell(25894)      -- Greater Blessing of Wisdom
		AddSpell(25890)      -- Greater Blessing of Light
		AddSpell(25895)      -- Greater Blessing of Salvation
		AddSpell(25898)      -- Greater Blessing of Kings

		-- Other
		AddSpell(7328)       -- Redemption
		
		-- Paladin Purify
		CureName = Healium_GetSpellName(1152)
		if CureName then 
			Cures[CureName] = {
				CanCurePoison = true, 
				CanCureDisease = true,		
			}		
		end
		
		-- Paladin Cleanse -- classic and retail
		CureName = Healium_GetSpellName(4987)
		if CureName then 
			Cures[CureName] = {	
				CanCurePoison = true, 
				CanCureDisease = true,
				CanCureMagic = true
			}
		end
	end
	
	if (class == "MAGE") then
		-- Heals

		-- Cures
		AddSpell(475) -- Remove Curse

		-- Buffs

		-- Other

		CureName = Healium_GetSpellName(475)
		if CureName then 
			Cures[CureName] = {	
				CanCureCurse = true, 
			}
		end		
	end
	
	if (class == "EVOKER") then
		-- Heals
		AddSpell(364343) -- Echo
		AddSpell(360995) -- Verdant Embrace
		AddSpell(355913) -- Emerald Blossom
		AddSpell(361469) -- Living Flame
		AddSpell(355936) -- Dream Breath
		AddSpell(367226) -- Spiritbloom
		AddSpell(367364) -- Reversion

		-- Cures
		AddSpell(360823) -- Naturalize
		AddSpell(365585) -- Expunge
		AddSpell(374251) -- Cauterizing Flame

		-- Buffs
		AddSpell(357170) -- Time Dilation

		-- Other
		AddSpell(361227) -- Return
		AddSpell(370665) -- Rescue
	
		-- Naturalize
		CureName = Healium_GetSpellName(360823)
		if CureName then 
			Cures[CureName] = {	
				CanCureMagic = true, 
				CanCurePoison = true, 					
			}
		end
		
		-- Expunge
		CureName = Healium_GetSpellName(365585)
		if CureName then 
			Cures[CureName] = {	
				CanCurePoison = true, 					
			}
		end

		-- Cauterizing Flame			
		CureName = Healium_GetSpellName(374251)
		if CureName then 
			Cures[CureName] = {	
				CanCurePoison = true, 
				CanCureDisease = true,
				CanCureCurse = true, 					
			}
		end				

	end	

	if (class == "MONK") then
		-- Heals
		AddSpell(116694) 	-- Surging Mist
		AddSpell(115175)	-- Soothing Mist
		AddSpell(115151)	-- Renewing Mist
		AddSpell(124682) 	-- Enveloping Mist
--		AddSpell(115310)	-- Revival (has cures, but is AOE)
		AddSpell(116670)	-- Vivify

		-- Cures
		AddSpell(115450)	-- Detox 		

		-- Buffs
		AddSpell(116841)	-- Tiger's Lust
		AddSpell(116849)	-- Life Cocoon

		-- Other
		AddSpell(115178)	-- Resuscitate (rez)
--		AddSpell(124081)	-- zen pulse now a passive
		AddSpell(197945)	-- mistwalk	
	
		-- Monk Detox
		CureName = Healium_GetSpellName(115450)
		if CureName then 
			Cures[CureName] = {
				CanCurePoison = true, 
				CanCureDisease = true,
				CanCureMagicFunc = function() return (Healium_GetSpecialization() == 2) end	-- if monk is mistweaver then Detox cures magic
			}
		end		
	end

	if (class == "DEATHKNIGHT") then
		-- Heals

		-- Cures

		-- Buffs

		-- Other
		AddSpell(61999) 		-- Raise Ally (battle rez)
	end
	
	if (race == "Draenei") then -- race isn't in all uppercase like class
		-- Heals (racial)
		AddSpell(59547)		-- Gift of the Naaru
	end
	
	CuresCount = Count(Cures)
end


local function GetCanCureMagic(cure)
	local flag = nil
	
	if cure.CanCureMagic then 
		flag = true
	elseif cure.CanCureMagicFunc ~= nil then 	
		flag = cure.CanCureMagicFunc()
	end
	
	return flag
end

function Healium_UpdateCures()
	local Profile = Healium_GetProfile()
	
	-- Handle Cures
	CanCureMagic = false
	CanCureDisease = false
	CanCurePoison = false
	CanCureCurse = false	

	if CuresCount > 0 then
		for i=1, Profile.ButtonCount,1 do
			local spell = Profile.SpellNames[i]
			local cure = Cures[spell]
			if cure ~= nil then
				if GetCanCureMagic(cure) then CanCureMagic = true end
				if cure.CanCureDisease then CanCureDisease = true end
				if cure.CanCurePoison then CanCurePoison = true end
				if cure.CanCureCurse then CanCureCurse = true end
			end
		end
	end
	
end

--debuffType is expected to be a return value from the wow api UnitDebuff()
function Healium_CanCureDebuff(debuffType)
	if   ( (debuffType == "Curse") and CanCureCurse) or
	     ( (debuffType == "Disease") and CanCureDisease) or
		 ( (debuffType == "Magic") and CanCureMagic) or
		 ( (debuffType == "Poison") and CanCurePoison) then	
		 return true
	end
	
	return false
end

function Healium_ShowDebuffButtons(Profile, frame, debuffTypes)

	for i=1, Profile.ButtonCount,1 do
		local button = frame.buttons[i]	
		
		if button then 
			local spell = Profile.SpellNames[i]
			local cure = Cures[spell]
			local flag
			local debuffColor 
			
			if cure ~= nil then
				if debuffTypes["Curse"] and cure.CanCureCurse then
					flag = true
					debuffColor = Healium_DebuffTypeColor["Curse"] 
				elseif debuffTypes["Disease"] and cure.CanCureDisease then
					flag = true
					debuffColor = Healium_DebuffTypeColor["Disease"]
				elseif debuffTypes["Magic"] and GetCanCureMagic(cure) then
					flag = true
					debuffColor = Healium_DebuffTypeColor["Magic"]
				elseif debuffTypes["Poison"] and cure.CanCurePoison then
					flag = true
					debuffColor = Healium_DebuffTypeColor["Poison"]
				elseif debuffTypes["Secret"] then
					flag = true
					debuffColor = Healium_DebuffTypeColor["Secret"]
				else 
					flag = false
				end
			end
			
			local curseBar = button.CurseBar
			
			if flag then
				curseBar:SetBackdropBorderColor(debuffColor.r, debuffColor.g, debuffColor.b)
				curseBar:SetAlpha(1)
				curseBar.hasDebuf = true
			else
				if curseBar.hasDebuf then
					curseBar:SetAlpha(0)
					curseBar.hasDebuf = nil
				end
			end
		end
	end
end

function Healium_DebugCures()
	Healium_DebugPrint(Cures)
	Healium_Print("CanCureMagic = " .. tostring(CanCureMagic))
	Healium_Print("CanCureDisease = " .. tostring(CanCureDisease))
	Healium_Print("CanCurePoison = " .. tostring(CanCurePoison))
	Healium_Print("CanCureCurse = " .. tostring(CanCureCurse))
end

-- Returns the dispel types handled by a configured cure spell.  Retail 12.1
-- Aura Containers can consume this non-aura configuration safely, allowing
-- Blizzard to select the matching debuff without Healium reading aura data.
function Healium_GetCureDispelTypes(spellName)
	local cure = spellName and Cures[spellName]
	if not cure then return nil end

	local dispelTypes = {}
	if GetCanCureMagic(cure) then dispelTypes.Magic = true end
	if cure.CanCureDisease then dispelTypes.Disease = true end
	if cure.CanCurePoison then dispelTypes.Poison = true end
	if cure.CanCureCurse then dispelTypes.Curse = true end
	return dispelTypes
end
