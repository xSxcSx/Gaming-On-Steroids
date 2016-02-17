local SxcSAIOVersion = 0.2514
local SxcSAIOChangelog1 = 'Menu is more clearly than before'
local SxcSAIOChangelog2 = 'Changed Updater Drawings'
local SxcSAIOChangelog3 = 'Added AutoLevel'

require 'Inspired'
require 'DamageLib'

local ToUpdate = {}
ToUpdate.Version = SxcSAIOVersion
ToUpdate.UseHttps = true
ToUpdate.Host = "raw.githubusercontent.com"
ToUpdate.VersionPath = "/xSxcSx/Gaming-On-Steroids/master/SxcSAIO.version"
ToUpdate.ScriptPath =  "/xSxcSx/Gaming-On-Steroids/master/SxcSAIO.lua"
ToUpdate.SavePath = SCRIPT_PATH.."SxcSAIO.lua"
ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIOUpdater} ::: Updated to ::: "..NewVersion..". Please Reload with 2x F6</b></font>") end
ToUpdate.CallbackNoUpdate = function(OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIOUpdater} ::: No Updates Found</b></font>") end
ToUpdate.CallbackNewVersion = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIOUpdater} ::: New Version found ::: "..NewVersion..". Please wait until its downloaded</b></font>") end
ToUpdate.CallbackError = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIOUpdater} ::: Error while Downloading. Please try again.</b></font>") end
	
	local SxcSAIOChamps = {
	["Vayne"] = true,
	["Garen"] = true,
	["Soraka"] = true,
	["DrMundo"] = true,
	["Blitzcrank"] = true,
	["Leona"] = true,
	["Ezreal"] = true,
	["Lux"] = true,
	["Rumble"] = true,
	["Swain"] = true,
	["Thresh"] = true,
	["Kalista"] = true,
	["Poppy"] = true,
	}
	
	local SxcSAIOSkin = { --Credits to Icesythe7
	["Vayne"] = {"Normal", "Vindicator", "Aristocrat", "Dragonslayer", "Heartseeker", "Skt T1", "Arclight", "Chroma Pack: Green", "Chroma Pack: Red", "Chroma Pack: Silver"},	
	["Garen"] = {"Normal", "Sanguine", "Desert Trooper", "Commando", "Dreadknight", "Rugged", "Steel Legion", "Chroma Pack: Garnet", "Chroma Pack: Plum", "Chroma Pack: Ivory", "Rogue Admiral"},
	["Soraka"] = {"Normal", "Dryad", "Divine", "Celestine", "Reaper", "Order of the Banana"},
	["DrMundo"] = {"Normal", "Toxic", "Mr. Mundoverse", "Corporate Mundo", "Mundo Mundo", "Executioner Mundo", "Rageborn Mundo", "TPA Mundo", "Pool Party"},
	["Blitzcrank"] = {"Normal", "Rusty", "Goalkeeper", "Boom Boom", "Piltover Customs", "Definitely Not", "iBlitzcrank", "Riot", "Chroma Pack: Molten", "Chroma Pack: Cobalt", "Chroma Pack: Gunmetal", "Battle Boss"},
	["Leona"] = {"Normal", "Valkyrie", "Defender", "Iron Solari", "Pool Party", "Chroma Pack: Pink", "Chroma Pack: Azure", "Chroma Pack: Lemon", "PROJECT"},
	["Ezreal"] = {"Normal", "Nottingham", "Striker", "Frosted", "Explorer", "Pulsefire", "TPA", "Debonair", "Ace of Spades"},
	["Lux"] = {"Normal", "Sorceress", "Spellthief", "Commando", "Imperial", "Steel Legion", "Star Guardian"},
	["Rumble"] = {"Normal", "Rumble in the Jungle", "Bilgerat", "Super Galaxy"},
	["Swain"] = {"Normal", "Northern Front", "Bilgewater", "Tyrant"},
	["Thresh"] = {"Normal", "Deep Terror", "Championship", "Blood Moon", "SSW"},
	["Kalista"] = {"Normal", "Blood Moon", "Championship"},
	["Poppy"] = {"Normal", "Noxus", "Lollipoppy", "Blacksmith", "Ragdoll", "Battle Regalia", "Scarlet Hammer"},
	}
	
	function OnLoad()
	end
	
	local Name = GetMyHero()
	local ChampName = myHero.charName
	
	if not SxcSAIOChamps[ChampName] then 
	PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: " .. ChampName .. " is not supported!</b></font>")
	return 
	end

  if not FileExist(COMMON_PATH .. "OpenPredict.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Missing Library ::: OpenPredict.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
  
  if not FileExist(COMMON_PATH .. "MapPositionGOS.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Missing Library ::: MapPositionGOS.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
 
  if not FileExist(COMMON_PATH .. "DamageLib.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Missing Library ::: DamageLib.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
 
  if FileExist(COMMON_PATH .. "OpenPredict.lua") or FileExist(COMMON_PATH .. "MapPositionGOS") or FileExist(COMMON_PATH .. "DamageLib.lua") and SxcSAIOChamps[ChampName] == true then
    PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: <font color=\"#FFFFFFF\">" .. ChampName .. " <font color=\"#81F700\">::: has been loaded! </b></font>")
  end
	
    
   local AntiGapCloser = {["Vayne"] = true, ["Lux"] = true, ["Thresh"] = true, ["Poppy"] = true,}
   local Last = {}
   local Lane = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true, ["Ezreal"] = true, ["Lux"] = true, ["Rumble"] = true, ["Swain"] = true, ["Poppy"] = true,}
   local Harass = {["Soraka"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true, ["Ezreal"] = true, ["Rumble"] = true, ["Swain"] = true, ["Thresh"] = true, ["Kalista"] = true, ["Poppy"] = true,}
   local Jungle = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true, ["Ezreal"] = true, ["Lux"] = true, ["Rumble"] = true, ["Swain"] = true, ["Poppy"] = true,}
   local Kill = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true, ["Ezreal"] = true, ["Lux"] = true, ["Rumble"] = true, ["Swain"] = true, ["Thresh"] = true, ["Kalista"] = true, ["Poppy"] = true,}
   local AutoQ = {}
   local AutoW = {["Soraka"] = true,} 
   local AutoE = {["Kalista"] = true,} 
   local AutoR = {["Soraka"] = true, ["Kalista"] = true,}
   local Prediction = {["Soraka"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true, ["Ezreal"] = true, ["Lux"] = true, ["Rumble"] = true, ["Swain"] = true, ["Thresh"] = true, ["Kalista"] = true, ["Poppy"] = true,}
   local ManaManager = {["Vayne"] = true, ["Ezreal"] = true, ["Lux"] = true, ["Swain"] = true, ["Thresh"] = true, ["Kalista"] = true, ["Poppy"] = true,}
   local GapCloser = {}
   local MapPositionGOS = {["Vayne"] = true, ["Poppy"] = true,}

    local BM = MenuConfig("{SxcSAIO} ::: " ..ChampName, "{SxcSAIO} ::: " ..ChampName)
	BM:Menu("C", "Combo")	
	BM:Menu("M", "Misc")
	BM.M:Menu("SC", "SkinChanger") BM.M.SC:DropDown('Skins', "Skins for "..ChampName.." -->", 1, SxcSAIOSkin[ChampName])
	BM.M:Menu("D", "Draw") BM.M.D:Boolean("LastHitMarker", "LastHitMarker", true) BM.M.D:Boolean("DrawQ", "Draw Q", true) BM.M.D:Boolean("DrawW", "Draw W", true) BM.M.D:Boolean("DrawE", "Draw E", true) BM.M.D:Boolean("DrawR", "Draw R", true) BM.M.D:ColorPick("ColorPick", "Circle color", {255,102,102,102})
	BM.M:Menu("CL", "Changelogs") BM.M.CL:KeyBinding("Clk", "Print Changelog", string.byte("G"))
	BM.M:Menu("AL", "Auto Level") BM.M.AL:DropDown("AL", "Auto Level -->", 1, {"Disabled", "Q-W-E", "Q-E-W", "W-Q-E", "W-E-Q", "E-Q-W", "E-W-Q"}) BM.M.AL:Slider("ALH", "Auto Level Humanizer", 500, 0, 1000, 5)
	if AntiGapCloser[ChampName] == true then BM.M:Menu("AGP", "AntiGapCloser") end
	if Harass[ChampName] == true then BM:Menu("H", "Harass") end
	if Last[ChampName] == true then BM:Menu("LH", "LastHit") end
	if Lane[ChampName] == true then BM:Menu("LC", "LaneClear") end
	if Jungle[ChampName] == true then BM:Menu("JC", "JungleClear")	end
	if Kill[ChampName] == true then BM:Menu("KS", "KillSteal") end
	if AutoQ[ChampName] == true then BM:Menu("AQ", "Auto Q") end
	if AutoW[ChampName] == true then BM:Menu("AW", "Auto W") end
	if AutoE[ChampName] == true then BM:Menu("AE", "Auto E") end
	if AutoR[ChampName] == true then BM:Menu("AR", "Auto R") end
	if Prediction[ChampName] == true then BM.M:Menu("P", "Prediction") BM.M.P:Slider("QHC", "Q HitChance", 40, 1, 100, 10) BM.M.P:Slider("WHC", "W HitChance", 40, 1, 100, 10) BM.M.P:Slider("EHC", "E HitChance", 40, 1, 100, 10) BM.M.P:Slider("RHC", "R HitChance", 65, 1, 100, 10) end
	if ManaManager[ChampName] == true then BM.M:Menu("MM", "ManaManager") BM.M.MM:Slider("MQ", "Mana to use Q >= x ", 10, 1, 100, 10) BM.M.MM:Slider("MW", "Mana to use W >= x ", 10, 1, 100, 10) BM.M.MM:Slider("ME", "Mana to use E >= x ", 10, 1, 100, 10) BM.M.MM:Slider("MR", "Mana to use R >= x ", 10, 1, 100, 10) end
	if GapCloser[ChampName] == true then BM.M:Menu("GC", "GapCloser")  end
	
if MapPositionGOS[ChampName] == true and FileExist(COMMON_PATH .. "MapPositionGOS.lua") then
require 'MapPositionGOS'
end
 
if Prediction[ChampName] == true and FileExist(COMMON_PATH .. "OpenPredict.lua") then
require 'OpenPredict'
elseif ChampName == "Vayne" and FileExist(COMMON_PATH .. "OpenPredict.lua") then
require 'OpenPredict'
end
 
-- Vayne
class 'Vayne'

local E = { delay = 0.250, speed = 3000, width = 1, range = 590 }

function Vayne:__init()
  self:Load()
end
  
function Vayne:Load()
  OnTick(function() self:Tick() end)
  self:Menu()
  end 
  
function Vayne:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Slider("a", "accuracy", 15, 1, 50, 10)
	BM.C:Slider("pd", "Push distance", 590, 1, 590, 10)
------------------------------------------
	BM.LC:Boolean("UseQ", "Use Q", true)
------------------------------------------
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseE", "Use E", true)
------------------------------------------ 
	BM.KS:Boolean("UseE", "Use E", true)
	
	AddGapcloseEvent(_E, 550, true, BM.M.AGP)
  
  end

  
function Vayne:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
if _G.IOW then 
  if IOW:Mode() == "Combo" then
  self:Combo(Target)
  end
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then
  self:Combo1(Target)
  end
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end
  
 self:KillSteal()
 self:AutoLevel()
 end

function Vayne:UseQ(unit)
  if IsReady(_Q) and GetDistance(unit) <= 1000 and ValidTarget(unit, 1000) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then 
  CastSkillShot(_Q, GetMousePos())
  end
end


function Vayne:UseE(unit)
  if not unit or IsDead(unit) or not IsVisible(unit) or not IsReady(_E) then return end
  if GetPercentMP(myHero) >= BM.M.MM.MQ:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) then
    local e = GetPrediction(unit, E)
	local ePos = Vector(e.castPos)
	local c = math.ceil(BM.C.a:Value())
	local cd = math.ceil(BM.C.pd:Value()/c)
	for rekt = 1, c, 1 do
		local PP = Vector(ePos) + Vector(Vector(ePos) - Vector(myHero)):normalized()*(cd*rekt)
			
		if MapPosition:inWall(PP) == true and GotBuff(unit,"BlackShield") ~= 1 then
                CastTargetSpell(unit, _E)
	    end	
    end	
  end
  end

function Vayne:Combo(unit)
if BM.C.UseQ:Value() then self:UseQ(unit) end
if BM.C.UseE:Value() then self:UseE(unit) end
end

function Vayne:LaneClear()
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) == MINION_ENEMY then
			if BM.LC.UseQ:Value() then self:UseQ(minion) end
		end
	end
end

function Vayne:JungleClear()
	for i, mob in pairs(minionManager.objects) do
		if GetTeam(mob) == MINION_JUNGLE then
			if BM.JC.UseQ:Value() then self:UseQ(mob) end
			if BM.JC.UseE:Value() then self:UseE(mob) end 
		end
  end
end

function Vayne:KillSteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseE:Value() and GotBuff(unit, "vaynesilveredbolts") >= 2 and GetHP(unit) < CalcDamage(myHero, unit, 70*GetCastLevel(myHero,_E)+70+GetBaseDamage(myHero)+GetBonusDmg(myHero),0)  then 
			CastTargetSpell(unit, _E)
	    end
		if BM.KS.UseE:Value() and GotBuff(unit, "vaynesilveredbolts") >= 0 and GetHP(unit) < CalcDamage(myHero, unit, 35*GetCastLevel(myHero,_E)+35+GetBaseDamage(myHero)+GetBonusDmg(myHero),0)  then 
			CastTargetSpell(unit,_E)
		end
	end
end

function Vayne:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Garen

class 'Garen'

function Garen:__init()
self:Load()
end

function Garen:Load()
self:Menu()
OnTick(function() self:Tick() end)
end

function Garen:Menu()
   
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("UseW", "Use W", true)
	BM.C.W:Slider("myHeroHP", "myHeroHP <= x ", 95, 1, 100, 10)
	BM.C:Boolean("UseE", "Use E", true) 
-----------------------------------------
	BM.LC:Boolean("UseQ", "Use Q", true)
	BM.LC:Boolean("UseE", "Use E", true) 
-----------------------------------------
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseE", "Use E", true) 
-----------------------------------------
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseR", "Use R", true)
	
end

function Garen:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
  
if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end
  self:KillSteal()    
  self:AutoLevel()
end

function Garen:UseQ(unit)
    if IsReady(_Q) and ValidTarget(unit, 500) then
	    CastSpell(_Q)
	end
end

function Garen:UseW(unit)
    if IsReady(_W) and ValidTarget(unit, 500) and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() then
	    CastSpell(_W)
	end
end

function Garen:UseE(unit)
    if IsReady(_E) and ValidTarget(unit, 450) and GetCastName(myHero, _E) == "GarenE" then
	    CastSpell(_E)
	end
end

function Garen:Combo(unit)
    if BM.C.UseQ:Value() then self:UseQ(unit) end
    if BM.C.W.UseW:Value() then self:UseW(unit) end
    if BM.C.UseE:Value() then self:UseE(unit) end
end

function Garen:LaneClear()
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) == MINION_ENEMY then
			if BM.LC.UseQ:Value() then self:UseQ(minion) end
			if BM.LC.UseE:Value() then self:UseE(minion) end
		end
	end
end

function Garen:JungleClear()
	for i, mob in pairs(minionManager.objects) do
		if GetTeam(mob) == MINION_JUNGLE then
			if BM.JC.UseQ:Value() then self:UseQ(mob) end
			if BM.JC.UseE:Value() then self:UseE(mob) end 
		end
	end
end

function Garen:KillSteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseQ:Value() and IsReady(_Q) and ValidTarget(unit, 500) and GetHP(unit) < getdmg("Q", unit)  then 
			CastSpell(_Q)
		elseif BM.KS.UseR:Value() and IsReady(_R) and ValidTarget(unit, GetCastRange(myHero,_R)) and GetHP(unit) < getdmg("R", unit) then 
			CastTargetSpell(unit,_R)
		end
	end
end

function Garen:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Soraka

class 'Soraka'

local Q = { delay = 0.250, speed = 1000, width = 260, range = 900 }

local E = { delay = 1.75, speed = math.huge, width = 310, range = 900 }

function Soraka:__init()
self:Load()
end

function Soraka:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

function Soraka:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseE", "Use E", true)
-----------------------------------------
	BM.H:Boolean("UseQ", "Use Q", true)
-----------------------------------------
	BM.AW:Boolean("Enabled", "Enabled", true)
	BM.AW:Info("1", "myHeroHP ::: To Heal ally")
	BM.AW:Slider("myHeroHP", "myHeroHP >= X", 5, 1, 100, 10)
	BM.AW:Slider("allyHP", "AllyHP <= X", 85, 1, 100, 10)
-----------------------------------------
	BM.AR:Boolean("Enabled", "Enabled", true)
	BM.AR:Info("2", "myHeroHP ::: to Heal me with ult")
	BM.AR:Slider("myHeroHP", "myHeroHP <= X", 8, 1, 100, 10)
	BM.AR:Slider("allyHP", "AllyHP <= X", 8, 1, 100, 10)
    BM.AR:Slider("ATRR", "Ally To Enemy Range", 1500, 500, 3000, 10)	
end

function Soraka:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
  
if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
end

self:AutoW()
self:AutoR()  
self:AutoLevel()
end

function Soraka:UseQ(unit)
if unit ~= nil then
local QpI = GetCircularAOEPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Soraka:UseE(unit)
if unit ~= nil then
local EpI = GetCircularAOEPrediction(unit, E)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero, _E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) then
CastSkillShot(_E, EpI.castPos)
end
end
end

function Soraka:Combo(unit)
    if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
end

function Soraka:Harass(unit)
    if BM.C.UseQ:Value() then self:UseQ(unit) end
end

function Soraka:AutoW()
    for _,ally in pairs(GetAllyHeroes()) do
	    if GetDistance(myHero,ally)<GetCastRange(myHero,_W) and IsReady(_W) and GetPercentHP(myHero) >= BM.AW.myHeroHP:Value() and GetPercentHP(ally) <= BM.AW.allyHP:Value() and BM.AW.Enabled:Value() and EnemiesAround(GetOrigin(ally), 1000) >= 1 then
		    CastTargetSpell(ally, _W)
		end
	end
end

function Soraka:AutoR()
    for _,ally in pairs(GetAllyHeroes()) do
	    if IsReady(_R) and GetPercentHP(ally) <= BM.AR.allyHP:Value() and BM.AR.Enabled:Value() and EnemiesAround(GetOrigin(ally), BM.AR.ATRR:Value()) >= 1 then
		    CastSpell(_R)
	    elseif IsReady(_R) and GetPercentHP(myHero) <= BM.AR.myHeroHP:Value() and BM.AR.Enabled:Value() and EnemiesAround(GetOrigin(myHero), BM.AR.ATRR:Value()) >= 1 then
		    CastSpell(_R)
		end
	end
end

function Soraka:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--DrMundo

class 'DrMundo'

function DrMundo:__init()
self:Load()
end

function DrMundo:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

local Q = { delay = 0.250, speed = 2000, width = 75, range = 1050 }

function DrMundo:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("Enabled", "Enabled", true)
	BM.C.W:Slider("myHeroHP", "myHeroHP >= x ", 10, 1, 100, 10)
    BM.C:Boolean("UseE", "Use E", true)
	BM.C:Menu("R", "R")
	BM.C.R:Boolean("Enabled", "Enabled", true)
	BM.C.R:Slider("enemies", "Enemies Around", 2, 1, 5, 1)
	BM.C.R:Slider("allies", "Allies Around", 1, 0, 5, 1)
	BM.C.R:Slider("myHeroHP", "myHeroHP <= x ", 30, 1, 100, 10)
-----------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
-----------------------------------------
    BM.LC:Boolean("UseQ", "Use Q", true)
	BM.LC:Menu("W", "W")
	BM.LC.W:Boolean("Enabled", "Enabled", true)
	BM.LC.W:Slider("myHeroHP", "myHeroHP >= x ", 10, 1, 100, 10)
    BM.LC:Boolean("UseE", "Use E", true) 
-----------------------------------------	
    BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Menu("W", "W")
	BM.JC.W:Boolean("Enabled", "Enabled", true)
	BM.JC.W:Slider("myHeroHP", "myHeroHP >= x ", 10, 1, 100, 10)
    BM.JC:Boolean("UseE", "Use E", true) 
-----------------------------------------
	BM.KS:Boolean("UseQ", "Use Q", true)
	
end

function DrMundo:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end  

self:Killsteal()
self:AutoLevel()
end

function DrMundo:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and not QpI:mCollision(1) then
		CastSkillShot(_Q, QpI.castPos)
end
end
end

function DrMundo:UseQminion(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) then
		CastSkillShot(_Q, QpI.castPos)
	end
end
end


function DrMundo:UseW(unit)
	if IsReady(_W) and GotBuff(myHero, "BurningAgony") ~= 1 and ValidTarget(unit, 700) and GetDistance(unit) <= 700 then
		CastSpell(_W)
	elseif IsReady(_W) and GotBuff(myHero, "BurningAgony") == 1 and ValidTarget(unit, 800) and GetDistance(unit) >= 700 then
		CastSpell(_W)
	end
end

function DrMundo:UseE(unit)
	if IsReady(_E) and ValidTarget(unit, 300) then
		CastSpell(_E)
	end
end

function DrMundo:UseR(unit)
	if IsReady(_R) and ValidTarget(unit, 500) and EnemiesAround(GetOrigin(myHero), 675) >= BM.C.R.enemies:Value() and AlliesAround(GetOrigin(myHero), 675) >= BM.C.R.allies:Value() and GetPercentHP(myHero) <= BM.C.R.myHeroHP:Value() and BM.C.R.Enabled:Value() then
		CastSpell(_R)
	end
end

function DrMundo:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.W.Enabled:Value() and GetPercentHP(myHero) >= BM.C.W.myHeroHP:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.R.Enabled:Value() then self:UseR(unit) end
end

function DrMundo:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
end

function DrMundo:LaneClear()
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) == MINION_ENEMY then
			if BM.LC.UseQ:Value() then self:UseQminion(minion) end
			if BM.LC.W.Enabled:Value() and GetPercentHP(myHero) >= BM.LC.W.myHeroHP:Value() then self:UseW(minion) end
            if BM.LC.UseE:Value() then self:UseE(minion) end
		end
	end
end

function DrMundo:JungleClear()
	for _, mob in pairs(minionManager.objects) do
		if GetTeam(mob) == MINION_JUNGLE then
			if BM.LC.UseQ:Value() then self:UseQminion(mob) end
			if BM.LC.W.Enabled:Value() and GetPercentHP(myHero) >= BM.LC.W.myHeroHP:Value() then self:UseW(mob) end
            if BM.LC.UseE:Value() then self:UseE(mob) end
		end
	end
end

function DrMundo:Killsteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit)  then 
			self:UseQ(unit)
		end
	end
end

function DrMundo:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Blitzcrank

class 'Blitzcrank'

local Q = { delay = 0.250, speed = 1800, width = 70, range = 900 }

local QT = TargetSelector(900,TARGET_PRIORITY,DAMAGE_PHYSICAL,true,false)

function Blitzcrank:__init()
self:Load()
end

function Blitzcrank:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

function Blitzcrank:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseW", "Use W", true)
	BM.C:Boolean("UseE", "Use E", true)
-----------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
	BM.H:Boolean("UseE", "Use E", true)
-----------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseR", "Use R", true)

end

function Blitzcrank:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastQ()
  end
  
  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  self:CastQ1()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastQ()
  end
  
  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  self:CastQ1()
  end
end  

self:Killsteal()
self:AutoLevel()
end

function Blitzcrank:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.M.P.HC:Value()/100) and not QpI:mCollision(1) then
		CastSkillShot(_Q, QpI.castPos)
	end
end
end

function Blitzcrank:UseQ1()
local QT = QT:GetTarget()
if QT ~= nil then
local QpI = GetPrediction(QT, Q)
	if IsReady(_Q) and ValidTarget(QT, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and not QpI:mCollision(1) then
		CastSkillShot(_Q, QpI.castPos)
	end
end
end

function Blitzcrank:UseW(unit)
	if IsReady(_W) and IsReady(_Q) and ValidTarget(unit, 701) and GetDistance(unit) <= 700 then
		CastSpell(_W)
	end
end

function Blitzcrank:UseE(unit)
	if IsReady(_E) and ValidTarget(unit, 300) then
		CastSpell(_E)
	end
end

function Blitzcrank:UseR(unit)
	if IsReady(_R) and ValidTarget(unit, GetCastRange(myHero,_R)) then
		CastSpell(_R)
	end
end

function Blitzcrank:Combo(unit)
	if BM.C.UseW:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
end

function Blitzcrank:CastQ()
	if BM.C.UseQ:Value() then self:UseQ1(unit) end
end

function Blitzcrank:CastQ1()
	if BM.H.UseQ:Value() then self:UseQ1(unit) end
end

function Blitzcrank:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ1(unit) end
	if BM.H.UseE:Value() then self:UseE(unit) end
end

function Blitzcrank:Killsteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then 
			self:UseQ(unit)
		elseif BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R", unit) then
		    self:UseR(unit)
		end
	end
end

function Blitzcrank:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Leona

class 'Leona'

local ET = TargetSelector(875,TARGET_PRIORITY,DAMAGE_PHYSICAL,true,false)
local RT = TargetSelector(1200,TARGET_PRIORITY,DAMAGE_PHYSICAL,true,false)

local E = { delay = 0.250, speed = 2000, width = 80, range = 875}

local R = { delay = 0.250, speed = math.huge, width = 300, range = 1200}

function Leona:__init()
self:Load()
end

function Leona:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

function Leona:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("Enabled", "Enabled", true)
	BM.C.W:Slider("myHeroHP", "myHeroHP <= x ", 95, 1, 100, 10)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Boolean("UseR", "Use R", true)
-----------------------------------------
	BM.H:Boolean("UseQ", "Use Q", true)
	BM.H:Menu("W", "W")
	BM.H.W:Boolean("Enabled", "Enabled", true)
	BM.H.W:Slider("myHeroHP", "myHeroHP <= x ", 95, 1, 100, 10)
	BM.H:Boolean("UseE", "Use E", true)
-----------------------------------------
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseE", "Use E", true)
	BM.KS:Boolean("UseR", "Use R", false)
	
end

function Leona:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastER()
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  self:CastE()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastER()
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  self:CastE()
  end
end

self:Killsteal()
self:AutoLevel()
end

function Leona:UseQ(unit)
	if IsReady(_Q) and ValidTarget(unit, 300) then
		CastSpell(_Q)
	end
end

function Leona:UseW(unit)
	if IsReady(_W) and ValidTarget(unit, 500) then
		CastSpell(_W)
	end
end

function Leona:UseE()
local ET = ET:GetTarget()
if ET ~= nil then
local EpI = GetPrediction(ET, E)
	if IsReady(_E) and ValidTarget(ET, GetCastRange(myHero, _E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) then
		CastSkillShot(_E, EpI.castPos)
	end
end
end

function Leona:UseE1(unit)
if unit ~= nil then
local EpI = GetPrediction(unit, E)
	if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero, _E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) then
		CastSkillShot(_E, EpI.castPos)
	end
end
end

function Leona:UseR()
local RT = RT:GetTarget()
if RT ~= nil then
local RpI = GetCircularAOEPrediction(RT, R)
	if IsReady(_R) and ValidTarget(RT, GetCastRange(myHero, _R)) and RpI and RpI.hitChance >= (BM.M.P.RHC:Value()/100) then
		CastSkillShot(_R, RpI.castPos)
	end
end
end

function Leona:UseR1(unit)
if unit ~= nil then
local RpI = GetCircularAOEPrediction(unit, R)
	if IsReady(_R) and ValidTarget(unit, GetCastRange(myHero, _R)) and RpI and RpI.hitChance >= (BM.M.P.RHC:Value()/100) then
		CastSkillShot(_R, RpI.castPos)
	end
end
end

function Leona:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.W.Enabled:Value() and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() then self:UseW(unit) end
end

function Leona:CastER()
	if BM.C.UseE:Value() then self:UseE() end
	if BM.C.UseR:Value() then self:UseR() end
end

function Leona:CastE()
	if BM.H.UseE:Value() then self:UseE() end
end

function Leona:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
	if BM.H.W.Enabled:Value() and GetPercentHP(myHero) <= BM.H.W.myHeroHP:Value() then self:UseW(unit) end
end

function Leona:Killsteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then 
			self:UseQ(unit)
		elseif BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E", unit) then 
			self:UseE1(unit)
		elseif BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R", unit) then
		    self:UseR1(unit)
		end
	end
end

function Leona:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Ezreal

class 'Ezreal'

function Ezreal:__init()
self:Load()
end

function Ezreal:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

local Q = { delay = 0.250, speed = 2000, width = 65, range = 1200 }
local W = { delay = 0.250, speed = 1200, width = 90, range = 900 }
local R = { delay = 1, speed = 2000, width = 160, range = 20000 }

function Ezreal:Menu()
	
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseW", "Use W", true)
-----------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
	BM.H:Boolean("UseW", "Use W", true)
-----------------------------------------	
	BM.LC:Boolean("UseQ", "Use Q", true)
-----------------------------------------	
	BM.JC:Boolean("UseQ", "Use Q", true)
-----------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseW", "Use W", true)
	BM.KS:Menu("R", "R")
	BM.KS.R:Boolean("Enabled", "Enabled", true)
	BM.KS.R:Slider("mDTT", "max Distance to target", 3000, 675, 20000, 10)
	BM.KS.R:Slider("DTT", "min Distance to target", 1000, 675, 20000, 10)
	
end

function Ezreal:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end
  
self:Killsteal()
self:AutoLevel()
end

function Ezreal:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and QpI and not QpI:mCollision(1) and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Ezreal:UseQminion(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Ezreal:UseW(unit)
if unit ~= nil then
local WpI = GetPrediction(unit, W)
if IsReady(_W) and ValidTarget(unit, GetCastRange(myHero,_W)) and WpI and WpI.hitChance >= (BM.M.P.WHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, WpI.castPos)
end
end
end

function Ezreal:UseR(unit)
if unit ~= nil then
local RpI = GetPrediction(unit, R)
if IsReady(_R) and ValidTarget(unit, BM.KS.R.mDTT:Value()) and RpI and RpI.hitChance >= (BM.M.P.RHC:Value()/100) and GetDistance(unit) >= BM.KS.R.DTT:Value() and GetPercentMP(myHero) >= BM.M.MM.MR:Value() then
CastSkillShot(_R, RpI.castPos)
end
end
end

function Ezreal:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseW:Value() then self:UseW(unit) end
end

function Ezreal:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
	if BM.H.UseW:Value() then self:UseW(unit) end
end

function Ezreal:LaneClear()
for _, minion in pairs(minionManager.objects) do
    if GetTeam(minion) == MINION_ENEMY then
        if BM.LC.UseQ:Value() then self:UseQminion(unit) end
	end
end
end

function Ezreal:JungleClear()
for _, mob in pairs(minionManager.objects) do
    if GetTeam(mob) == MINION_JUNGLE then
        if BM.LC.UseQ:Value() then self:UseQminion(unit) end
	end
end
end

function Ezreal:Killsteal()
 for _, unit in pairs(GetEnemyHeroes()) do
    if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then self:UseQ(unit) end 
	if BM.KS.UseW:Value() and GetHP2(unit) < getdmg("W", unit) then self:UseW(unit) end
	if BM.KS.R.Enabled:Value() and GetHP2(unit) < getdmg("R", unit) then self:UseR(unit) end
 end 
end

function Ezreal:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Lux

class 'Lux'

function Lux:__init()
self:Load()
end

function Lux:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

local Q = { delay = 0.250, speed = 1200, width = 70 , range = 1300 }

local W = { delay = 0.250, speed = 1630, width = 210, range = 1250 }

local E = { delay = 0.250, speed = 1300, width = 345, range = 1100 }

local R = { delay = 0.250, speed = math.huge, width = 200, range = 3340}

local ally = TargetSelector(1250,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,true)

function Lux:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("Enabled", "Enabled", true)
	BM.C.W:DropDown("M", "Mode", 1 , {"on ally", "Only on myHero"})
	BM.C.W:Slider("myHeroHP", "myHeroHP <= x ", 60, 1, 100, 10)
	BM.C.W:Slider("allyHP", "allyHP <= x ", 60, 1, 100, 10)
	BM.C.W:Slider("Enemies", "Enemies Around", 1, 0, 5, 1)
	BM.C:Boolean("UseE", "Use E", true)
-----------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseE", "Use E", true)
	BM.KS:Boolean("UseR", "Use R", true)
	BM.KS:Slider("DTT", "min Distance to target", 300, 200, 3340, 10)	
-----------------------------------------		
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseW", "Use W", true)
	BM.JC:Boolean("UseE", "Use E", true)
-----------------------------------------		
	BM.LC:Boolean("UseQ", "Use Q", true)
	BM.LC:Boolean("UseE", "Use E", true)
-----------------------------------------		
	AddGapcloseEvent(_Q, 1200, false, BM.M.AGP)
	
end

function Lux:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastW()
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastW()
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end

self:Killsteal()
self:AutoLevel()
end

function Lux:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and not QpI:mCollision(2) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Lux:UseQminion(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Lux:UseW()
local WT = ally:GetTarget()
if IsReady(_W) and WT ~= nil and GetDistance(WT)<GetCastRange(myHero,_W) and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() and EnemiesAround(GetOrigin(myHero), 1000) >= BM.C.W.Enemies:Value() and GetPercentHP(WT) <= BM.C.W.allyHP:Value() and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, GetOrigin(WT))
end
end

function Lux:UseW2()
if IsReady(_W) and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() and EnemiesAround(GetOrigin(myHero), 1000) >= BM.C.W.Enemies:Value() and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, GetMousePos())
end
end

function Lux:UseWminion(unit)
if IsReady(_W) and ValidTarget(unit, GetCastRange(myHero,_W)) and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, GetMousePos())
end
end

function Lux:UseE(unit)
if unit ~= nil then
local EpI = GetCircularAOEPrediction(unit, E)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero,_E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.ME:Value() then
CastSkillShot(_E, EpI.castPos)
end
end
end

function Lux:UseR(unit)
if unit ~= nil then
local RpI = GetPrediction(unit, R)
if IsReady(_R) and ValidTarget(unit, GetCastRange(myHero,_R)) and RpI and RpI.hitChance >= (BM.M.P.RHC:Value()/100) and GetDistance(unit) >= BM.KS.DTT:Value() and GetPercentMP(myHero) >= BM.M.MM.MR:Value() then
CastSkillShot(_R, RpI.castPos)
end
end
end

function Lux:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
end

function Lux:CastW()
	if BM.C.W.Enabled:Value() and BM.C.W.M:Value() == 1 then self:UseW() end
	if BM.C.W.Enabled:Value() and BM.C.W.M:Value() == 2 then self:UseW2() end
end

function Lux:JungleClear()
for _, mob in pairs(minionManager.objects) do
    if GetTeam(mob) == MINION_JUNGLE then
	    if BM.JC.UseQ:Value() then self:UseQminion(mob) end
		if BM.JC.UseW:Value() then self:UseWminion(mob) end
		if BM.JC.UseE:Value() then self:UseE(mob) end
	end
end
end

function Lux:LaneClear()
for _, minion in pairs(minionManager.objects) do
    if GetTeam(minion) == MINION_ENEMY then
	    if BM.JC.UseQ:Value() then self:UseQminion(minion) end
		if BM.JC.UseE:Value() then self:UseE(minion) end
	end
end
end

function Lux:Killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then self:UseQ(unit) end
	if BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E", unit) then self:UseE(unit) end
	if BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R", unit) then self:UseR(unit) end
end
end

function Lux:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Rumble

class 'Rumble'

function Rumble:__init()
self:Load()
end

local E = { delay = 0.250, speed = 1200, width = 90, range = 850 }

function Rumble:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

function Rumble:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("Enabled", "Enabled", true)
	BM.C.W:Slider("myHeroHP", "myHeroHP <= x ", 95, 1, 100, 10)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Menu("R", "R")
	BM.C.R:Boolean("Enabled", "Enabled", true)
	BM.C.R:Slider("myHeroHP", "myHeroHP >= x ", 20, 1, 100, 10)
	BM.C.R:Slider("enemyHP", "EnemyHP <= x ", 95, 1, 100, 10)
-----------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
	BM.H:Menu("W", "W")
	BM.H.W:Boolean("Enabled", "Enabled", true)
	BM.H.W:Slider("myHeroHP", "myHeroHP <= x ", 95, 1, 100, 10)
	BM.H:Boolean("UseE", "Use E", true)
-----------------------------------------		
	BM.LC:Boolean("UseQ", "Use Q", true)
	BM.LC:Boolean("UseE", "Use E", true)
-----------------------------------------		
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Menu("W", "W")
	BM.JC.W:Boolean("Enabled", "Enabled", true)
	BM.JC.W:Slider("myHeroHP", "myHeroHP <= x ", 100, 1, 100, 10)
	BM.JC:Boolean("UseE", "Use E", true)
-----------------------------------------		
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseE", "Use E", true)
	BM.KS:Boolean("UseR", "Use R", true)
	
end

function Rumble:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end
  
self:Killsteal()
self:AutoLevel()
end

function Rumble:UseQ(unit)
if IsReady(_Q) and ValidTarget(unit, 350) then
CastSkillShot(_Q, GetMousePos())
end
end

function Rumble:UseW(unit)
if IsReady(_W) and ValidTarget(unit, 500) then
CastSpell(_W)
end
end		

function Rumble:UseE(unit)
if unit ~= nil then
local EpI = GetPrediction(unit, E)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero,_E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) and not EpI:mCollision(1) then
CastSkillShot(_E, EpI.castPos)
end
end
end

function Rumble:UseEminion(unit)
if unit ~= nil then
local EpI = GetPrediction(unit, E)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero,_E)) and EpI and EpI.hitChance >= (BM.M.P.EHC:Value()/100) then
CastSkillShot(_E, EpI.castPos)
end
end
end

function Rumble:UseR(unit)
if unit ~= nil then
local SP = Vector(myHero) - 525 * (Vector(myHero) - Vector(unit)):normalized() -- copy from deftsu(viktor code)
local R = GetPredictionForPlayer(SP,unit,GetMoveSpeed(unit),1200,250,1700,100,false,true)
if IsReady(_R) and ValidTarget(unit, 1700) and R.HitChance == 1 then
CastSkillShot3(_E,SP,R.PredPos)
end
end
end

function Rumble:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.W.Enabled:Value() and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.R.Enabled:Value() and GetPercentHP(myHero) >= BM.C.R.myHeroHP:Value() and GetPercentHP(unit) <= BM.C.R.enemyHP:Value() then self:UseR(unit) end
end

function Rumble:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
	if BM.H.W.Enabled and GetPercentHP(myHero) <= BM.H.W.myHeroHP:Value() then self:UseW(unit) end
	if BM.H.UseE:Value() then self:UseE(unit) end
end

function Rumble:LaneClear()
for _,minion in pairs(minionManager.objects) do
    if GetTeam(minion) == MINION_ENEMY then
		if BM.LC.UseQ:Value() then self:UseQ(minion) end
	    if BM.LC.UseE:Value() then self:UseEminion(minion) end
	end
end
end

function Rumble:JungleClear()
for _,mob in pairs(minionManager.objects) do
    if GetTeam(mob) == MINION_JUNGLE then
		if BM.JC.UseQ:Value() then self:UseQ(mob) end
		if BM.JC.W.Enabled and GetPercentHP(myHero) <= BM.JC.W.myHeroHP:Value() then self:UseW(mob) end
	    if BM.JC.UseE:Value() then self:UseEminion(mob) end
	end
end
end

function Rumble:Killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then self:UseQ(unit) end
	if BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E", unit) then self:UseE(unit) end
	if BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R", unit) then self:UseR(unit) end
end
end

function Rumble:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Swain

class 'Swain'

function Swain:__init()
self:Load()
end

function Swain:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

local W = { delay = 0.850, speed = math.huge, width = 125, range = 900 }

function Swain:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseW", "Use W", true)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Menu("R", "R")
	BM.C.R:Boolean("Enabled", "Enabled", true)
	BM.C.R:Slider("myHeroHP", "myHeroHP <= x ", 85, 1, 100, 10)
	BM.C.R:Slider("enemyHP", "EnemyHP <= x ", 100, 1, 100, 10)
	BM.C.R:Slider("aa", "Allies Around", 0, 0, 5, 1)
	BM.C.R:Slider("ea", "Enemyies Around", 1, 1, 5, 1)
	BM.C.R:Slider("dt", "target distance to use R", 700, 500, 1200, 10)
-----------------------------------------		
	BM.H:Boolean("UseQ", "Use Q", true)
	BM.H:Boolean("UseW", "Use W", true)
	BM.H:Boolean("UseE", "Use E", true)
	
	BM.LC:Boolean("UseQ", "Use Q", false)
	BM.LC:Boolean("UseW", "Use W", true)
	BM.LC:Boolean("UseE", "Use E", false)
	BM.LC:Menu("R", "R")
	BM.LC.R:Boolean("Enabled", "Enabled", true)
	BM.LC.R:Slider("myHeroHP", "myHeroHP <= x ", 85, 1, 100, 10)
-----------------------------------------		
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseW", "Use W", true)
	BM.JC:Boolean("UseE", "Use E", true)
	BM.JC:Menu("R", "R")
	BM.JC.R:Boolean("Enabled", "Enabled", true)
	BM.JC.R:Slider("myHeroHP", "myHeroHP <= x ", 85, 1, 100, 10)
-----------------------------------------		
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseW", "Use W", true)
	BM.KS:Boolean("UseE", "Use E", true)
	
end

function Swain:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end
end
  
self:Killsteal()
self:AutoLevel()
end

function Swain:UseQ(unit)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastTargetSpell(unit, _Q)
end
end

function Swain:UseW(unit)
if unit ~= nil then
local WpI = GetCircularAOEPrediction(unit, W)
if IsReady(_W) and ValidTarget(unit, GetCastRange(myHero,_W)) and WpI and WpI.hitChance >= (BM.M.P.WHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, WpI.castPos)
end
end
end

function Swain:UseE(unit)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero,_E)) and GetPercentMP(myHero) >= BM.M.MM.ME:Value() then
CastTargetSpell(unit, _E)
end
end

function Swain:UseR(unit)
if IsReady(_R) and ValidTarget(unit, 1200) and GetDistance(unit) <= BM.C.R.dt:Value() and GotBuff(myHero, "SwainMetamorphism") ~= 1 and GetPercentMP(myHero) >= BM.M.MM.MR:Value() and GetPercentHP(myHero) >= BM.C.R.myHeroHP:Value() and GetPercentHP(unit) <= BM.C.R.enemyHP:Value() and AlliesAround(GetOrigin(myHero), BM.C.R.dt:Value()) >= BM.C.R.aa:Value() and EnemiesAround(GetOrigin(myHero), BM.C.R.dt:Value()) >= BM.C.R.ea:Value() then
CastSpell(_R)
elseif IsReady(_R) and ValidTarget(unit, 1300) and GetDistance(unit) >= BM.C.R.dt:Value() and GotBuff(myHero, "SwainMetamorphism") == 1 then
CastSpell(_R)
elseif IsReady(_R) and GotBuff(myHero, "SwainMetamorphism") == 1 and GetPercentMP(myHero) <= BM.M.MM.MR:Value() then
CastSpell(_R)
end
end

function Swain:UseRm(unit)
if IsReady(_R) and ValidTarget(unit, 700) and GetDistance(unit) <= 700 and GotBuff(myHero, "SwainMetamorphism") ~= 1 and GetPercentMP(myHero) >= BM.M.MM.MR:Value() then
CastSpell(_R)
elseif IsReady(_R) and ValidTarget(unit, 800) and GetDistance(unit) >= 700 and GotBuff(myHero, "SwainMetamorphism") == 1 then
CastSpell(_R)
elseif IsReady(_R) and GotBuff(myHero, "SwainMetamorphism") == 1 and GetPercentMP(myHero) <= BM.M.MM.MR:Value() then
CastSpell(_R)
end
end

function Swain:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseW:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.R.Enabled:Value() then self:UseR(unit) end
end

function Swain:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
	if BM.H.UseW:Value() then self:UseW(unit) end
	if BM.H.UseE:Value() then self:UseE(unit) end
end

function Swain:LaneClear()
for _,minion in pairs(minionManager.objects) do
    if GetTeam(minion) == MINION_ENEMY then
		if BM.LC.UseQ:Value() then self:UseQ(minion) end
		if BM.LC.UseW:Value() then self:UseW(minion) end
	    if BM.LC.UseE:Value() then self:UseE(minion) end
		if BM.LC.R.Enabled:Value() and GetPercentHP(myHero) >= BM.LC.R.myHeroHP:Value() then self:UseRm(minion) end
	end
end
end

function Swain:JungleClear()
for _,mob in pairs(minionManager.objects) do
    if GetTeam(mob) == MINION_JUNGLE then
		if BM.JC.UseQ:Value() then self:UseQ(mob) end
		if BM.JC.UseW:Value() then self:UseW(mob) end
	    if BM.JC.UseE:Value() then self:UseE(mob) end
		if BM.JC.R.Enabled:Value() and GetPercentHP(myHero) >= BM.JC.R.myHeroHP:Value() then self:UseRm(mob) end
	end
end
end

function Swain:Killsteal()
for _, unit in pairs(GetEnemyHeroes()) do
    if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then self:UseQ(unit) end
	if BM.KS.UseW:Value() and GetHP2(unit) < getdmg("W", unit) then self:UseW(unit) end
	if BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E", unit) then self:UseE(unit) end
end
end

function Swain:AutoLevel()
	if BM.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.AL.ALH:Value()/100)
        
end

--Thresh

class 'Thresh'

function Thresh:__init()
self:Load()
end

local pulltime = 0
local flytime = 0
local flylength = 0
local ally = TargetSelector(950,TARGET_LESS_CAST_PRIORITY,DAMAGE_PHYSICAL,true,true)
local Q = { delay = 0.25, speed = 1150, width = 70, range = 1075 }

function Thresh:Load()
OnTick(function() self:Tick() end)
self:Menu()
end

function Thresh:Menu()
	BM.C:Boolean("UseQH", "Use Q Hook", true)
	BM.C:Boolean("UseQD", "Use Q Dash", true)
	BM.C:Menu("W", "W")
	BM.C.W:Boolean("Enabled", "Enabled", true)
	BM.C.W:Slider("myHeroHP", "myHeroHP <= x ", 60, 1, 100, 10)
	BM.C.W:Slider("allyHP", "allyHP <= x ", 60, 1, 100, 10)
	BM.C.W:Slider("Enemies", "Enemies Around", 1, 0, 5, 1)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Menu("R", "R")
	BM.C.R:Boolean("Enabled", "Enabled", true)
	BM.C.R:Slider("myHeroHP", "myHeroHP <= x", 100, 1, 100, 10)
	BM.C.R:Slider("enemyHP", "EnemyHP <= x", 80, 1, 100, 10)
	BM.C.R:Slider("ea", "Enemies can hit >= x", 1, 1, 5, 1)
	BM.C.R:Slider("aa", "Allies Around >= x", 1, 0, 5, 1)
-----------------------------------------	
	BM.H:Boolean("UseQ", "Use Q Hook", true)
	BM.H:Boolean("UseE", "Use E", true)
-----------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseE", "Use E", true)
	BM.KS:Boolean("UseR", "Use R", true)

	AddGapcloseEvent(_E, 500, false, BM.M.AGP)

end

function Thresh:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastW()
  end
  
  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  self:CastW()
  end
  
  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end
end  

self:Killsteal()
self:AutoLevel()
end

function Thresh:UseQH(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and GotBuff(unit, "ThreshQ") ~= 1 and ValidTarget(unit, 1075) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and not QpI:mCollision(1) and GetCastName(myHero,_Q) ~= "threshqleap" and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Thresh:UseQD(unit)
if IsReady(_Q) and GotBuff(unit, "ThreshQ") == 1 and GetCastName(myHero,_Q) ~= "threshqleap" then
CastSpell(_Q)
end
end

function Thresh:UseW()
local WT = ally:GetTarget()
if IsReady(_W) and WT ~= nil and GetDistance(WT)<GetCastRange(myHero,_W) and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() and EnemiesAround(GetOrigin(myHero), 1000) >= BM.C.W.Enemies:Value() and GetPercentHP(WT) <= BM.C.W.allyHP:Value() and GetPercentMP(myHero) >= BM.M.MM.MW:Value() then
CastSkillShot(_W, GetOrigin(WT))
end
end

function Thresh:UseE(unit) -- ported from Tones of Misery
if (GetGameTimer() > pulltime + 2) and (GetGameTimer() > flytime + flylength) then
local xz = Vector(myHero) + (Vector(myHero) - Vector(unit))
    if ValidTarget(unit, 475) and IsReady(_E) and GetPercentMP(myHero) >= BM.M.MM.ME:Value() then
			CastSkillShot(_E, xz)
    end
end
end

function Thresh:UseR(unit)
if IsReady(_R) and ValidTarget(unit, 425) and EnemiesAround(GetOrigin(myHero), 425) >= BM.C.R.ea:Value() and AlliesAround(GetOrigin(myHero), 850) >= BM.C.R.aa:Value() and GetPercentHP(myHero) <= BM.C.R.myHeroHP:Value() and GetPercentHP(unit) <= BM.C.R.enemyHP:Value() and GetPercentMP(myHero) >= BM.M.MM.MR:Value() then
CastSpell(_R)
end
end

function Thresh:CastW()
	if BM.C.W.Enabled:Value() then self:UseW() end
end

function Thresh:Combo(unit)
	if BM.C.UseQH:Value() then self:UseQH(unit) end
	if BM.C.UseQD:Value() then self:UseQD(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.R.Enabled:Value() then self:UseR(unit) end
end

function Thresh:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQH(unit) end
	if BM.H.UseE:Value() then self:UseE(unit) end
end

function Thresh:Killsteal()
  for _,unit in pairs(GetEnemyHeroes()) do
	if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q",unit) then self:UseQH(unit) end
	if BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E",unit) then self:UseE(unit) end
	if BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R",unit) and ValidTarget(unit, 425) then CastSpell(_R) end
  end
end

function Thresh:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
    elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Kalista

class 'Kalista'

function Kalista:__init()
self:Load()
end

local Q = { delay = 0.25, speed = 2000, width = 50, range = GetCastRange(myHero,_Q) }

function Kalista:Load()
OnTick(function() self:Tick() end)
OnDraw(function() self:Draw() end)
self:Menu()
end

function Kalista:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
------------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
------------------------------------------	
	BM.AE:Boolean("UseJ", "Use on Jungle mobs", true)
	BM.AE:Boolean("UseM", "Use on Minions", true)
	BM.AE:Boolean("UseC", "Use on Champs", true)
	BM.AE:Slider("OK", "Over kill", 50, 0, 250, 10)
	BM.AE:Slider("D", "Delay to use E", 10, 0, 50, 5)
------------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
------------------------------------------	
	BM.AR:Boolean("Enabled", "Enabled", true)
	BM.AR:Slider("myHeroHP", "myHeroHP", 100, 1, 100, 10)
	BM.AR:Slider("allyHP", "myHeroHP", 5, 1, 100, 5)
------------------------------------------	
	BM:Boolean("DD", "Draw E Damage", true)
	
end

function Kalista:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end 
end
self:AutoEM()
self:AutoEJM()
self:AutoEC()
self:Killsteal()
self:UseR()
self:AutoLevel()
end

function Kalista:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, 1075) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and not QpI:mCollision(1) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Kalista:Combo(unit)     
if BM.C.UseQ:Value() then self:UseQ(unit) end  
end

function Kalista:Harass(unit)
if BM.H.UseQ:Value() then self:UseQ(unit) end  
end

function Kalista:AutoEC()
  for _, unit in pairs(GetEnemyHeroes()) do                               --*(GotBuff(unit,"kalistaexpungemarker")-1) copied from noddy ( kalista code )
		if GetCastLevel(myHero,_E) == 1 and not IsDead(unit) and GetHP(unit) + BM.AE.OK:Value() < CalcDamage(myHero, unit, (24*GetCastLevel(myHero,_E)+24+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and BM.AE.UseC:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 2 and not IsDead(unit) and GetHP(unit) + BM.AE.OK:Value() < CalcDamage(myHero, unit, (29*GetCastLevel(myHero,_E)+29+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and BM.AE.UseC:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 3 and not IsDead(unit) and GetHP(unit) + BM.AE.OK:Value() < CalcDamage(myHero, unit, (34*GetCastLevel(myHero,_E)+34+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and BM.AE.UseC:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 4 and not IsDead(unit) and GetHP(unit) + BM.AE.OK:Value() < CalcDamage(myHero, unit, (39*GetCastLevel(myHero,_E)+39+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and BM.AE.UseC:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 5 and not IsDead(unit) and GetHP(unit) + BM.AE.OK:Value() < CalcDamage(myHero, unit, (46*GetCastLevel(myHero,_E)+46+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and BM.AE.UseC:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
	    end
	end
end

function Kalista:AutoEM()
	for _, minion in pairs(minionManager.objects) do
	  if GetTeam(minion) == MINION_ENEMY then
		if GetCastLevel(myHero,_E) == 1 and not IsDead(minion) and GetHP(minion) + BM.AE.OK:Value() < CalcDamage(myHero, minion, (24*GetCastLevel(myHero,_E)+24+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(minion, GetCastRange(myHero,_E)) and BM.AE.UseM:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 2 and not IsDead(minion) and GetHP(minion) + BM.AE.OK:Value() < CalcDamage(myHero, minion, (29*GetCastLevel(myHero,_E)+29+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(minion, GetCastRange(myHero,_E)) and BM.AE.UseM:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 3 and not IsDead(minion) and GetHP(minion) + BM.AE.OK:Value() < CalcDamage(myHero, minion, (34*GetCastLevel(myHero,_E)+34+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(minion, GetCastRange(myHero,_E)) and BM.AE.UseM:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 4 and not IsDead(minion) and GetHP(minion) + BM.AE.OK:Value() < CalcDamage(myHero, minion, (39*GetCastLevel(myHero,_E)+39+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(minion, GetCastRange(myHero,_E)) and BM.AE.UseM:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 5 and not IsDead(minion) and GetHP(minion) + BM.AE.OK:Value() < CalcDamage(myHero, minion, (46*GetCastLevel(myHero,_E)+46+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(minion, GetCastRange(myHero,_E)) and BM.AE.UseM:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
	    end
	  end
	end
end

function Kalista:AutoEJM()
	for _, mob in pairs(minionManager.objects) do
	  if GetTeam(mob) == MINION_JUNGLE then
		if GetCastLevel(myHero,_E) == 1 and not IsDead(mob) and GetHP(mob) + BM.AE.OK:Value() < CalcDamage(myHero, mob, (24*GetCastLevel(myHero,_E)+24+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(mob,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(mob, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(mob, GetCastRange(myHero,_E)) and BM.AE.UseJ:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 2 and not IsDead(mob) and GetHP(mob) + BM.AE.OK:Value() < CalcDamage(myHero, mob, (29*GetCastLevel(myHero,_E)+29+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(mob,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(mob, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(mob, GetCastRange(myHero,_E)) and BM.AE.UseJ:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 3 and not IsDead(mob) and GetHP(mob) + BM.AE.OK:Value() < CalcDamage(myHero, mob, (34*GetCastLevel(myHero,_E)+34+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(mob,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(mob, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(mob, GetCastRange(myHero,_E)) and BM.AE.UseJ:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 4 and not IsDead(mob) and GetHP(mob) + BM.AE.OK:Value() < CalcDamage(myHero, mob, (39*GetCastLevel(myHero,_E)+39+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(mob,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(mob, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(mob, GetCastRange(myHero,_E)) and BM.AE.UseJ:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
		elseif GetCastLevel(myHero,_E) == 5 and not IsDead(mob) and GetHP(mob) + BM.AE.OK:Value() < CalcDamage(myHero, mob, (46*GetCastLevel(myHero,_E)+46+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(mob,"kalistaexpungemarker")-1),0) and IsReady(_E) and GotBuff(mob, "kalistaexpungemarker") >= 1 and GetPercentMP(myHero) >= BM.M.MM.ME:Value() and ValidTarget(mob, GetCastRange(myHero,_E)) and BM.AE.UseJ:Value() then
		DelayAction(function()
			CastSpell(_E)
		end,BM.AE.D:Value()/100)
	    end
	  end
	end
end

function Kalista:Draw()
  for _, unit in pairs(GetEnemyHeroes()) do
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(unit) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 1 then DrawDmgOverHpBar(unit,GetHP(unit) + BM.AE.OK:Value(),CalcDamage(myHero, unit, (24*GetCastLevel(myHero,_E)+24+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(unit) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 2 then DrawDmgOverHpBar(unit,GetHP(unit) + BM.AE.OK:Value(),CalcDamage(myHero, unit, (29*GetCastLevel(myHero,_E)+29+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(unit) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 3 then DrawDmgOverHpBar(unit,GetHP(unit) + BM.AE.OK:Value(),CalcDamage(myHero, unit, (34*GetCastLevel(myHero,_E)+34+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(unit) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 4 then DrawDmgOverHpBar(unit,GetHP(unit) + BM.AE.OK:Value(),CalcDamage(myHero, unit, (39*GetCastLevel(myHero,_E)+39+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(unit) and GotBuff(unit, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 5 then DrawDmgOverHpBar(unit,GetHP(unit) + BM.AE.OK:Value(),CalcDamage(myHero, unit, (46*GetCastLevel(myHero,_E)+46+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(unit,"kalistaexpungemarker")-1),0),0,GoS.Red) end
  end
  for _, minion in pairs(minionManager.objects) do
  	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(minion) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 1 then DrawDmgOverHpBar(minion,GetHP(minion) + BM.AE.OK:Value(),CalcDamage(myHero, minion, (24*GetCastLevel(myHero,_E)+24+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(minion) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 2 then DrawDmgOverHpBar(minion,GetHP(minion) + BM.AE.OK:Value(),CalcDamage(myHero, minion, (29*GetCastLevel(myHero,_E)+29+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(minion) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 3 then DrawDmgOverHpBar(minion,GetHP(minion) + BM.AE.OK:Value(),CalcDamage(myHero, minion, (34*GetCastLevel(myHero,_E)+34+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(minion) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 4 then DrawDmgOverHpBar(minion,GetHP(minion) + BM.AE.OK:Value(),CalcDamage(myHero, minion, (39*GetCastLevel(myHero,_E)+39+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0),0,GoS.Red) end
	if BM.DD:Value() and IsReady(_E) and IsObjectAlive(minion) and GotBuff(minion, "kalistaexpungemarker") >= 1 and GetCastLevel(myHero,_E) == 5 then DrawDmgOverHpBar(minion,GetHP(minion) + BM.AE.OK:Value(),CalcDamage(myHero, minion, (46*GetCastLevel(myHero,_E)+46+((GetBaseDamage(myHero)+GetBonusDmg(myHero))*0.6)) + ((((0.175+GetCastLevel(myHero,_E))*0.025)*(GetBaseDamage(myHero)+GetBonusDmg(myHero))))*(GotBuff(minion,"kalistaexpungemarker")-1),0),0,GoS.Red) end
  end
end


function Kalista:Killsteal()
	for _, unit in pairs(GetEnemyHeroes()) do
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero,_Q)) and GetHP(unit) < getdmg("Q",unit) then self:UseQ(unit) end
	end
end

function Kalista:UseR()
 for _, ally in pairs(GetAllyHeroes()) do
    if GotBuff(ally,"kalistacoopstrikeally") == 1 and BM.AR.Enabled:Value() and GetDistance(ally,myHero)<GetCastRange(myHero,_R) and GetPercentHP(myHero) <= BM.AR.myHeroHP:Value() and GetPercentHP(ally) <= BM.AR.allyHP:Value() and GetPercentMP(myHero) >= BM.M.MM.MR:Value() and EnemiesAround(GetOrigin(ally), 800) >= 1 then
	CastSpell(_R)
	end
end
end

function Kalista:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

--Poppy

class 'Poppy'

function Poppy:__init()
self:Load()
end

local Q = { delay = 0.25, speed = 2000, width = 50, range = 430 }
local E = { delay = 0.25, speed = 1700, width = 1, range = 525 }
local RTime = 0
if RCharge and (1000 + (GetTickCount() - RTime) * 0.4) < 1900 then
RRange = 1000 + (GetTickCount() - RTime) * 0.4
elseif not RCharge then
RRange = 500
end
local R = { delay = 0.25, speed = 1300, width = 120, range = RRange}

function Poppy:Load()
OnTick(function() self:Tick() end)
OnUpdateBuff(function(unit, buff) self:UpdateBuff(unit, buff) end)
OnRemoveBuff(function(unit, buff) self:RemoveBuff(unit, buff) end)
self:Menu()
end

function Poppy:Menu()
	BM.C:Boolean("UseQ", "Use Q", true)
	BM.C:Boolean("UseE", "Use E", true)
	BM.C:Slider("a", "accuracy", 15, 1, 50, 10)
	BM.C:Slider("pd", "Push distance", 450, 1, 475, 10)
	BM.C:Menu("R", "R")
	BM.C.R:DropDown("RM", "R Mode", 1, {"If Killable", "Always"})
	BM.C.R:Boolean("Enabled", "Enabled", true)
	BM.C.R:Slider("myHeroHP", "myHeroHP <= x ", 75, 1, 100, 10)
	BM.C.R:Slider("ea", "Enemies Around", 2, 1, 5, 1)
	BM.C.R:Slider("aa", "Allies Around", 1, 0, 5, 1)
	BM.C.R:Slider("enemyHP", "EnemyHP <= x ", 50, 1, 100, 10)
------------------------------------------	
	BM.H:Boolean("UseQ", "Use Q", true)
------------------------------------------	
	BM.LC:Boolean("UseQ", "Use Q", true)
------------------------------------------	
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseE", "Use E", true)
------------------------------------------	
	BM.KS:Boolean("UseQ", "Use Q", true)
	BM.KS:Boolean("UseE", "Use E", true)		 
	
	AddGapcloseEvent(_W, 400, true, BM.M.AGP)
end

function Poppy:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()

if _G.IOW then
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
elseif _G.DAC_Loaded then
  if DAC:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
  if DAC:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end

  if DAC:Mode() == "Harass" then
  self:Harass(Target)
  end 
end
self:Killsteal()
self:AutoLevel()
end

function Poppy:UseQ(unit)
if unit ~= nil then
local QpI = GetPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, 430) and QpI and QpI.hitChance >= (BM.M.P.QHC:Value()/100) and GetPercentMP(myHero) >= BM.M.MM.MQ:Value() then
CastSkillShot(_Q, QpI.castPos)
end
end
end

function Poppy:UseE(unit)
  if not unit or IsDead(unit) or not IsVisible(unit) or not IsReady(_E) then return end
  if ValidTarget(unit, GetCastRange(myHero,_E)) and GetPercentMP(myHero) >= BM.M.MM.ME:Value() then
    local e = GetPrediction(unit, E)
	local ePos = Vector(e.castPos)
	local c = math.ceil(BM.C.a:Value())
	local cd = math.ceil(BM.C.pd:Value()/c)
	for rekt = 1, c, 1 do
		local PP = Vector(ePos) + Vector(Vector(ePos) - Vector(myHero)):normalized()*(cd*rekt)
			
		if MapPosition:inWall(PP) == true and GotBuff(unit,"BlackShield") ~= 1 then
                CastTargetSpell(unit, _E)
	    end	
    end	
  end
  end

function Poppy:UseR(unit)
if unit ~= nil then
local RpI = GetPrediction(unit, R)
if IsReady(_R) and ValidTarget(unit, RRange) and GetPercentMP(myHero) >= BM.M.MM.MR:Value() and GetPercentHP(myHero) <= BM.C.R.myHeroHP:Value() and GetPercentHP(unit) <= BM.C.R.enemyHP:Value() and not RCharge and AlliesAround(GetOrigin(myHero), RRange) >= BM.C.R.aa:Value() and EnemiesAround(GetOrigin(myHero), RRange) >= BM.C.R.ea:Value() then
CastSkillShot(_R,GetOrigin(myHero))
end
if RCharge and RpI and RpI.hitChance >= (BM.M.P.RHC:Value()/100) and IsReady(_R) and ValidTarget(unit, 1900) then
CastSkillShot2(_R, RpI.castPos) 
end
end
end

function Poppy:UseR2(unit)
if unit ~= nil then
local RpI = GetPrediction(unit, R)
if IsReady(_R) and ValidTarget(unit, RRange) and GetPercentMP(myHero) >= BM.M.MM.MR:Value() and not RCharge then
CastSkillShot(_R,GetOrigin(myHero))
end
if RCharge and RpI and RpI.hitChance >= (BM.P.RHC:Value()/100) and IsReady(_R) and ValidTarget(unit, 1900) then
CastSkillShot2(_R, RpI.castPos) 
end
end
end

function Poppy:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.R.Enabled:Value() and BM.C.R.RM:Value() == 2 then self:UseR(unit) end
end

function Poppy:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
end

function Poppy:LaneClear()
	for _, minion in pairs(minionManager.objects) do
	  if GetTeam(minion) == MINION_ENEMY then
		if BM.LC.UseQ:Value() then self:UseQ(minion) end
	  end
	end
end

function Poppy:JungleClear()
	for _, mob in pairs(minionManager.objects) do
	  if GetTeam(mob) == MINION_JUNGLE then
		if BM.JC.UseQ:Value() then self:UseQ(mob) end
		if BM.JC.UseE:Value() then self:UseE(mob) end
	  end
	end
end

function Poppy:Killsteal()
	for _, unit in pairs(GetEnemyHeroes()) do
	    if BM.KS.UseQ:Value() and GetHP(unit) < CalcDamage(myHero, unit, 30*GetCastLevel(myHero,_Q)+30+GetBaseDamage(myHero)+GetBonusDmg(myHero),0) then self:UseQ(unit) end
		if BM.KS.UseE:Value() and GetHP2(unit) < CalcDamage(myHero, unit, 20*GetCastLevel(myHero,_E)+20+GetBaseDamage(myHero)+GetBonusDmg(myHero),0) then self:UseE(unit) end
		if BM.C.R.Enabled:Value() and BM.C.R.RM:Value() == 1 and GetHP(unit) < CalcDamage(myHero, unit, 100*GetCastLevel(myHero,_R)+100+GetBaseDamage(myHero)+GetBonusDmg(myHero),0) then self:UseR2(unit) end

	end
end

function Poppy:AutoLevel()
	if BM.M.AL.AL:Value() == 2 then SxcSAIOLevel = {_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 3 then SxcSAIOLevel = {_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 4 then SxcSAIOLevel = {_W,_Q,_E,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
	elseif BM.M.AL.AL:Value() == 5 then SxcSAIOLevel = {_W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
	elseif BM.M.AL.AL:Value() == 6 then SxcSAIOLevel = {_E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
	elseif BM.M.AL.AL:Value() == 7 then SxcSAIOLevel = {_E,_W,_Q,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
	end
  DelayAction(function() 
		if BM.M.AL.AL:Value() ~= 1 then LevelSpell(SxcSAIOLevel[GetLevel(myHero)]) end
		end, BM.M.AL.ALH:Value()/100)
        
end

function Poppy:UpdateBuff(unit,buff)
	if unit == myHero and buff.Name == "PoppyR" then 
		RCharge = true
		RTime = GetTickCount()
	end
end

function Poppy:RemoveBuff(unit,buff)
	if unit == myHero and buff.Name == "PoppyR" then 
		RCharge = false
	end
end

if SxcSAIOChamps[ChampName] == true then
  	 _G[ChampName]() 
end



if ChampName == "Thresh" then BM:Boolean("DS", "Draw Souls", true) end


OnCreateObj(function(Object)
	if GetObjectBaseName(Object) == "Thresh_Base_soul.troy" and ChampName == "Thresh" then
		table.insert(souls, Object)	
	end
end)


OnDeleteObj(function(Object)
  myHer0 = GetOrigin(myHero)
	if GetObjectBaseName(Object) == "Thresh_Base_soul.troy" and ChampName == "Thresh" then
		table.remove(souls, 1)
	end
end)

souls = {}
OnDraw(function(myHero) 
if BM.M.SC.Skins:Value() ~= 1 then HeroSkinChanger(Name, BM.M.SC.Skins:Value() - 1)
elseif BM.M.SC.Skins:Value() == 1 then HeroSkinChanger(Name, 0) end
for _, minion in pairs(minionManager.objects) do
if GetTeam(minion) == (MINION_ENEMY) or (MINION_JUNGLE) then
if _G.IOW and IOW:Mode() ~= "Harass" and IOW:Mode() ~= "Combo" and ValidTarget(minion, GetRange(myHero)) and not IsDead(minion) and BM.M.D.LastHitMarker:Value() and GetCurrentHP(minion) < CalcDamage(myHero, minion, GetBaseDamage(myHero), GetBonusDmg(myHero), 0) then DrawCircle(GetOrigin(minion), GetHitBox(minion), 2, 40, ARGB(255, 255, 255, 255)) end
end
if _G.DAC_Loaded and DAC:Mode() ~= "Harass" and DAC:Mode() ~= "Combo" and ValidTarget(minion, GetRange(myHero)) and not IsDead(minion) and BM.M.D.LastHitMarker:Value() and GetCurrentHP(minion) < CalcDamage(myHero, minion, GetBaseDamage(myHero), GetBonusDmg(myHero), 0) then DrawCircle(GetOrigin(minion), GetHitBox(minion), 2, 40, ARGB(255, 255, 255, 255)) end
end
for _, s in pairs(souls) do
if s ~= nil then
if ChampName == "Thresh" and BM.DS:Value() and IsObjectAlive(s) then DrawCircle(GetOrigin(s), GetHitBox(s), 2, 40, ARGB(255, 255, 255, 255)) end
end
end
if IsReady(_Q) and BM.M.D.DrawQ:Value() then DrawCircle(GetOrigin(myHero), GetCastRange(myHero,_Q), 1, 40, BM.M.D.ColorPick:Value()) end
if IsReady(_W) and BM.M.D.DrawW:Value() then DrawCircle(GetOrigin(myHero), GetCastRange(myHero,_W), 1, 40, BM.M.D.ColorPick:Value()) end
if IsReady(_E) and BM.M.D.DrawE:Value() then DrawCircle(GetOrigin(myHero), GetCastRange(myHero,_E), 1, 40, BM.M.D.ColorPick:Value()) end
if IsReady(_R) and BM.M.D.DrawR:Value() then DrawCircle(GetOrigin(myHero), GetCastRange(myHero,_R), 1, 40, BM.M.D.ColorPick:Value()) end
if BM.M.CL.Clk:Value() then
DrawText('{SxcSAIOUpdater} ::: Changelog from Version (' ..SxcSAIOVersion.. ') :::',23,10,330,GoS.Green)
DrawText('{SxcSAIOUpdater} ::: - '..SxcSAIOChangelog1,17,10,360,ARGB(255, 56, 205, 178))
DrawText('{SxcSAIOUpdater} ::: - '..SxcSAIOChangelog2,17,10,380,ARGB(255, 56, 205, 178))
DrawText('{SxcSAIOUpdater} ::: - '..SxcSAIOChangelog3,17,10,400,ARGB(255, 56, 205, 178))
end
end)


function math.round(num, idp)
  assert(type(num) == "number", "math.round: wrong argument types (<number> expected for num)")
  assert(type(idp) == "number" or idp == nil, "math.round: wrong argument types (<integer> expected for idp)")
  local mult = 10 ^ (idp or 0)
  if num >= 0 then return math.floor(num * mult + 0.5) / mult
  else return math.ceil(num * mult - 0.5) / mult
  end
end



function string.split(str, delim, maxNb)
  if not delim or delim == "" or string.find(str, delim) == nil then
    return { str }
  end
  maxNb = (maxNb and maxNb >= 1) and maxNb or 0
  local result = {}
  local pat = "(.-)" .. delim .. "()"
  local nb = 0
  local lastPos
  for part, pos in string.gmatch(str, pat) do
    nb = nb + 1
    if nb == maxNb then
      result[nb] = lastPos and string.sub(str, lastPos, #str) or str
      break
    end
    result[nb] = part
    lastPos = pos
  end
  if nb ~= maxNb then
    result[nb + 1] = string.sub(str, lastPos)
  end
  return result
end

class "SxcSAIOUpdater" -- {

function SxcSAIOUpdater:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError)
    self.LocalVersion = LocalVersion
    self.Host = Host
    self.VersionPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
    self.ScriptPath = '/GOS/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
    self.SavePath = SavePath
    self.CallbackUpdate = CallbackUpdate
    self.CallbackNoUpdate = CallbackNoUpdate
    self.CallbackNewVersion = CallbackNewVersion
    self.CallbackError = CallbackError
    self:CreateSocket(self.VersionPath)
    self.DownloadStatus = 'Connect to Server for VersionInfo'
    OnTick(function() self:GetOnlineVersion() end)
    OnDraw(function() self:OnDraw() end)
    return self
end

function SxcSAIOUpdater:print(str)
  print('<font color="#FFFFFF">'..os.clock()..': '..str)
end
 
function SxcSAIOUpdater:OnDraw()
local res = GetResolution()
  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
      local bP = {['x1'] = res.x - (res.x - 390),['x2'] = res.x - (res.x - 20),['y1'] = res.y / 2,['y2'] = (res.y / 2) + 20,}
    local content = '{SxcSAIOUpdater} ::: Download Status ::: '..(self.DownloadStatus or 'Unknown')
    DrawLine(bP.x1, bP.y1 + 20, bP.x2,  bP.y1 + 20, 20, ARGB(125, 255, 255, 255))
    local op
      if self.File and self.Size then
      op = math.round(100/self.Size*self.File:len(),2)/100 < 1 and math.ceil(370 * math.round(100/self.Size*self.File:len(),2)/100) or 370
    else
      op = 1
    end
    DrawLine(bP.x2 + op, bP.y1 + 20, bP.x2, bP.y1 + 20, 20, GoS.Yellow)
    DrawLines2({{x=bP.x1, y=bP.y1}, {x=bP.x2, y=bP.y1}, {x=bP.x2, y=bP.y2}, {x=bP.x1, y=bP.y2}, {x=bP.x1, y=bP.y1}, }, 3, GoS.White)
    DrawText(content, 12, res.x - (res.x - 250) - (GetTextArea(content, 17).x / 2 + 75), bP.y1 + 1, ARGB(255,0,0,0))
  end
end

function SxcSAIOUpdater:CreateSocket(url)
    if not self.LuaSocket then
      self.LuaSocket = require("socket")
    else
      self.Socket:close()
      self.Socket = nil
      self.Size = nil
      self.RecvStarted = false
    end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.tcp()
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.Socket:connect('plebleaks.com', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
end
 
function SxcSAIOUpdater:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
      local r,b='',x:byte()
      for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
      return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
      if (#x < 6) then return '' end
      local c=0
      for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
      return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end 
  
function SxcSAIOUpdater:Base64Decode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end 
  
function SxcSAIOUpdater:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
      self.RecvStarted = true
      self.DownloadStatus = 'Downloading VersionInfo (0%)'
    end
    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</s'..'ize>') then
      if not self.Size then
        self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
      end
      if self.File:find('<scr'..'ipt>') then
        local _,ScriptFind = self.File:find('<scr'..'ipt>')
        local ScriptEnd = self.File:find('</scr'..'ipt>')
        if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
        local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
        self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
      end
    end
    if self.File:find('</scr'..'ipt>') then
      self.DownloadStatus = 'Downloading VersionInfo (100%)'
      local a,b = self.File:find('\r\n\r\n')
      self.File = self.File:sub(a,-1)
      self.NewFile = ''
      for line,content in ipairs(self.File:split('\n')) do
        if content:len() > 5 then
          self.NewFile = self.NewFile .. content
        end
      end
      local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
      local ContentEnd, _ = self.File:find('</sc'..'ript>')
      if not ContentStart or not ContentEnd then
        if self.CallbackError and type(self.CallbackError) == 'function' then
          self.CallbackError()
        end
      else
        self.OnlineVersion = (self:Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
        self.OnlineVersion = tonumber(self.OnlineVersion)
        if self.OnlineVersion > self.LocalVersion then
          if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
            self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
          end
          self:CreateSocket(self.ScriptPath)
          self.DownloadStatus = 'Connect to Server for ScriptDownload'
          OnTick(function() self:DownloadUpdate() end)
        else
          if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
            self.CallbackNoUpdate(self.LocalVersion)
          end
        end
      end
      self.GotScriptVersion = true
    end
end
 
function SxcSAIOUpdater:DownloadUpdate()
    if self.GotAutoUpdater then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: plebleaks.com\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
      self.RecvStarted = true
      self.DownloadStatus = 'Downloading Script (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</si'..'ze>') then
      if not self.Size then
        self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
      end
      if self.File:find('<scr'..'ipt>') then
        local _,ScriptFind = self.File:find('<scr'..'ipt>')
        local ScriptEnd = self.File:find('</scr'..'ipt>')
        if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
        local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
        self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
      end
    end
    if self.File:find('</scr'..'ipt>') then
      self.DownloadStatus = 'Downloading Script (100%)'
      local a,b = self.File:find('\r\n\r\n')
      self.File = self.File:sub(a,-1)
      self.NewFile = ''
      for line,content in ipairs(self.File:split('\n')) do
        if content:len() > 5 then
          self.NewFile = self.NewFile .. content
        end
      end
      local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
      local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
      if not ContentStart or not ContentEnd then
        if self.CallbackError and type(self.CallbackError) == 'function' then
          self.CallbackError()
        end
      else
        local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
        local newf = newf:gsub('\r','')
        if newf:len() ~= self.Size then
          if self.CallbackError and type(self.CallbackError) == 'function' then
            self.CallbackError()
          end
          return
        end
    local f = io.open(self.SavePath,"w+b")
    f:write(self:Base64Decode(newf))
    f:close()
    if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
    self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
    end
      end
      self.GotAutoUpdater = true
    end
end
  
  
  
  SxcSAIOUpdater(SxcSAIOVersion,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
