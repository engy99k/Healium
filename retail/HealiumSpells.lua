local function AddSpell(spellID)
	local name = Healium_GetSpellName(spellID)
	table.insert(Healium_Spell.Name, name)
end

local function Count(tab)
	local cnt = 0
	
	for _, k in pairs(tab) do
		cnt = cnt + 1
	end
	
	return cnt
end

-- These spellIDs are from wowhead
function Healium_InitSpells(class, race)
	Healium_DebugPrint("Healium_InitSpells class = " .. class .. " race = " .. race)
	
	-- clear cures
	Healium_Spell.Name = {}
	Healium_Spell.Icon = {}
	Healium_Spell.ID = {}
	

	-- Init spell list
	if (class == "DRUID") then 
		AddSpell(774)		-- Rejuvenation
		AddSpell(8936)		-- Regrowth
		AddSpell(33763)		-- Lifebloom
		AddSpell(5185)		-- Healing Touch
		AddSpell(18562)		-- Swiftmend
		AddSpell(48438)		-- Wild Growth
		AddSpell(88423)		-- Nature's Cure
		AddSpell(102342)	-- Ironbark
		AddSpell(102351)	-- Cenarion Ward
		AddSpell(2782)		-- Remove Corruption
		AddSpell(20484)		-- Rebirth (battle rez)
		AddSpell(50769)		-- Revive (rez)
		AddSpell(50464)     -- Nourish
		AddSpell(203651)    -- Overgrowth
		AddSpell(29166)     -- Innervate			
	end

	if (class == "PRIEST") then 
		AddSpell(527)		-- Purify		
		AddSpell(213634)	-- Purify Disease (shadow spec)
		AddSpell(139)		-- Renew
		AddSpell(2061)		-- Flash Heal
		AddSpell(2060)		-- Heal
		AddSpell(32546)		-- Binding Heal
		AddSpell(596)		-- Prayer of Healing
		AddSpell(33076)		-- Prayer of Mending
		AddSpell(200829)	-- Plea
		AddSpell(186263)	-- Shadow Mend
		AddSpell(34861)		-- Circle of Healing
		AddSpell(17)		-- Power Word: Shield
		AddSpell(152118)	-- Clarity of Will
		AddSpell(47788)		-- Guardian Spirit
		AddSpell(47540)		-- Penance
		AddSpell(2050)     	-- Holy Word: Serenity		
		AddSpell(121135)	-- Cascade (not sure if correct Cascade)
		AddSpell(2006)		-- Resurrection (rez)
		AddSpell(194509)    -- Power Word: Radiance
		AddSpell(33206)     -- Pain Suppression
		AddSpell(47536)     -- Rapture			
	end

	if (class == "SHAMAN") then
		AddSpell(51886)		-- Cleanse Spirit	
		AddSpell(77130)		-- Purify Spirit
		AddSpell(8004)		-- Healing Surge
		AddSpell(77472)     -- Healing Wave		
		AddSpell(1064)		-- Chain Heal		
		AddSpell(61295)		-- Riptide		
		AddSpell(974)		-- Earth Shield
		AddSpell(16188)		-- Nature's Swiftness
		AddSpell(73685)		-- Unleash Life
		AddSpell(2008)		-- Ancestral Spirit (rez)
	end

	if (class == "PALADIN") then
		AddSpell(19750) -- Flash of Light
		AddSpell(20473) -- Holy Shock
		AddSpell(633) 	-- Lay on Hands
		AddSpell(4987) 	-- Cleanse
		AddSpell(213644) -- Cleanse Toxins
		AddSpell(1022)	-- Hand of Protection
		AddSpell(1038)	-- Hand of Salvation
		AddSpell(1044)	-- Hand of Freedom
		AddSpell(6940) -- Blessing of Sacrifice		
		AddSpell(53563)	-- Beacon of Light
		AddSpell(200025) -- Beacon of Virtue
		AddSpell(20925)	-- Sacred Shield
		AddSpell(85673)	-- Word of Glory
		AddSpell(82326) -- Holy Light
		AddSpell(85222)	-- Light of Dawn
		AddSpell(82327)	-- Holy Radiance
		AddSpell(114163) -- Eternal Flame
		AddSpell(114039) -- Hand of Purity
		AddSpell(114165) -- Holy Prism
		AddSpell(114916) -- Execution Sentence
		AddSpell(7328) -- Redemption (rez)
		AddSpell(183998) -- Light of the Martyr
		AddSpell(391054) -- Intercession
	end
	
	if (class == "MAGE") then
		AddSpell(475) -- Remove Curse
	end
	
	if (class == "EVOKER") then
		AddSpell(364343) -- Echo
		AddSpell(360995) -- Verdant Embrace
		AddSpell(355913) -- Emerald Blossom
		AddSpell(361469) -- Living Flame
		AddSpell(355936) -- Dream Breath
		AddSpell(360823) -- Naturalize
		AddSpell(361227) -- Return 
		AddSpell(365585) -- Expunge
		AddSpell(374251) -- Cauterizing Flame
		AddSpell(367226) -- Spiritbloom
		AddSpell(367364) -- Reversion
		AddSpell(357170) -- Time Dilation
		AddSpell(370665) -- Rescue

	end	

	if (class == "MONK") then
		AddSpell(116694) 	-- Surging Mist
		AddSpell(115175)	-- Soothing Mist
		AddSpell(115151)	-- Renewing Mist
		AddSpell(116849)	-- Life Cocoon
		AddSpell(124682) 	-- Enveloping Mist
--		AddSpell(115310)	-- Revival (has cures, but is AOE)
		AddSpell(116670)	-- Vivify
		AddSpell(115450)	-- Detox 		
		AddSpell(115178)	-- Resuscitate (rez)
--		AddSpell(124081)	-- zen pulse now a passive
		AddSpell(197945)	-- mistwalk	
	end

	if (class == "DEATHKNIGHT") then
		AddSpell(61999) 		-- Raise Ally (battle rez)
	end
	
	if (race == "Draenei") then -- race isn't in all uppercase like class
		AddSpell(59547)		-- Gift of the Naaru
	end
end
