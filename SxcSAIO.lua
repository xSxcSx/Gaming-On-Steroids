local SxcSAIOVersion = 0.201

require 'Inspired'
LoadIOW()

local ToUpdate = {}
ToUpdate.Version = SxcSAIOVersion
ToUpdate.UseHttps = true
ToUpdate.Host = "raw.githubusercontent.com"
ToUpdate.VersionPath = "/xSxcSx/Gaming-On-Steroids/master/SxcSAIO.version"
ToUpdate.ScriptPath =  "/xSxcSx/Gaming-On-Steroids/master/SxcSAIO.lua"
ToUpdate.SavePath = SCRIPT_PATH.."SxcSAIO.lua"
ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Updated to ::: "..NewVersion..". Please Reload with 2x F6</b></font>") end
ToUpdate.CallbackNoUpdate = function(OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: No Updates Found</b></font>") end
ToUpdate.CallbackNewVersion = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: New Version found ::: "..NewVersion..". Please wait until its downloaded</b></font>") end
ToUpdate.CallbackError = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Error while Downloading. Please try again.</b></font>") end

	local Champs = {
	["Vayne"] = true,
	["Garen"] = true,
	["Soraka"] = true,
	["DrMundo"] = true,
	["Blitzcrank"] = true,
	["Leona"] = true,
	}
	
	function OnLoad()
	end
	
	local ChampName = myHero.charName
	
	if not Champs[ChampName] then 
	PrintChat("<font color=\"#81F700\"><b>{SxcSAIO}::: " .. ChampName .. " is not supported!</b></font>")
	return 
	end

  if not FileExist(COMMON_PATH .. "OpenPredict.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO}::: Missing Library ::: OpenPredict.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
  
  if not FileExist(COMMON_PATH .. "MapPositionGOS.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO}::: Missing Library ::: MapPositionGOS.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
 
  if not FileExist(COMMON_PATH .. "DamageLib.lua") then
   PrintChat("<font color=\"#81F700\"><b>{SxcSAIO}::: Missing Library ::: DamageLib.lua ::: Go download it and safe it to common folder!</b></font>")
  return 
  end
 
  if FileExist(COMMON_PATH .. "OpenPredict.lua") or FileExist(COMMON_PATH .. "MapPositionGOS") or FileExist(COMMON_PATH .. "DamageLib.lua") and Champs[ChampName] == true then
    PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: <font color=\"#FFFFFFF\">" .. ChampName .. " <font color=\"#81F700\">::: has been loaded! </b></font>")
  end
	
    
   local AntiGapCloser = {["Vayne"] = true,}
   local Last = {["DrMundo"] = true,}
   local Lane = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true,}
   local Harass = {["Soraka"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true,}
   local Jungle = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true,}
   local Kill = {["Vayne"] = true, ["Garen"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true,}
   local AutoQ = {}
   local AutoW = {["Soraka"] = true,} 
   local AutoE = {} 
   local AutoR = {["Soraka"] = true,}
   local Prediction = {["Soraka"] = true, ["DrMundo"] = true, ["Blitzcrank"] = true, ["Leona"] = true,}

    local BM = MenuConfig("{SxcSAIO} :::" ..ChampName, "{SxcSAIO} :::" ..ChampName)
	BM:Menu("C", "Combo")	
    if AntiGapCloser[ChampName] == true then BM:Menu("AGP", "AntiGapCloser") end
    if Harass[ChampName] == true then BM:Menu("H", "Harass") end
    if Last[ChampName] == true then BM:Menu("LH", "LastHit") end
    if Lane[ChampName] == true then BM:Menu("LC", "LaneClear") end
	if Jungle[ChampName] == true then BM:Menu("JC", "JungleClear")	end
	if Kill[ChampName] == true then BM:Menu("KS", "KillSteal") end
	if AutoQ[ChampName] == true then BM:Menu("AQ", "Auto Q") end
	if AutoW[ChampName] == true then BM:Menu("AW", "Auto W") end
	if AutoE[ChampName] == true then BM:Menu("AE", "Auto E") end
	if AutoR[ChampName] == true then BM:Menu("AR", "Auto R") end
	if Prediction[ChampName] == true then BM:Menu("P", "Prediction") BM.P:Slider("HC", "HitChance", 35, 1, 100, 10) end


	
-- Vayne
if FileExist(COMMON_PATH .. "OpenPredict.lua") and FileExist(COMMON_PATH .. "MapPositionGOS.lua") and FileExist(COMMON_PATH .. "DamageLib.lua") and ChampName == "Vayne" then
require 'OpenPredict'
require 'MapPositionGOS'
require 'DamageLib'
end

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
	BM.LC:Boolean("mManager", "LaneClear Mana", 25, 1, 100, 10) 
------------------------------------------
	BM.JC:Boolean("UseQ", "Use Q", true)
	BM.JC:Boolean("UseE", "Use E", true)
	BM.JC:Slider("mManager", "JungleClear Mana", 25, 1, 100, 10) 
------------------------------------------ 
	BM.KS:Boolean("UseE", "Use E", true)
	
	AddGapcloseEvent(_E, 550, true, BM.AGP)
  
  end

  
function Vayne:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
  
  if IOW:Mode() == "Combo" then
  self:Combo(Target)
  end

  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end

  self:KillSteal()
  
 end
  
function Vayne:QLogic(unit)
  if IsReady(_Q) and GetDistance(unit) <= 1000 then 
  CastSkillShot(_Q, GetMousePos())
  end
end

IOW:AddCallback(AFTER_ATTACK, function(target, mode)
if mode == "Combo" and BM.C.UseQ:Value() and IsReady(_Q) and GetDistance(target) <= 1000 then
CastSkillShot(_Q, GetMousePos())
end
end)

function Vayne:CastE(unit)
  if not unit or IsDead(unit) or not IsVisible(unit) or not IsReady(_E) then return end
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
  
function Vayne:Combo(unit)
if BM.C.UseE:Value() then self:CastE(unit)
end
end

function Vayne:LaneClear()
  if GetPercentHP(myHero) >= BM.LC.mManager:Value() then
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) == MINION_ENEMY then
			if BM.LC.UseQ:Value() then self:QLogic(minion) end
		end
	end
  end
end

function Vayne:JungleClear()
  if GetPercentHP(myHero) >= BM.JC.mManager:Value() then
	for i, mob in pairs(minionManager.objects) do
		if GetTeam(mob) == MINION_JUNGLE then
			if BM.JC.UseQ:Value() then self:QLogic(mob) end
			if BM.JC.UseE:Value() then self:CastE(mob) end 
		end
	end
  end
end

function Vayne:KillSteal()
   for _, unit in pairs(GetEnemyHeroes()) do
   local health = GetCurrentHP(unit)+GetDmgShield(unit)+GetMagicShield(unit)
		if BM.KS.UseE:Value() and GotBuff(unit, "vaynesilveredbolts") == 2 and GetHP2(unit) < CalcDamage(myHero, unit, 70*GetCastLevel(myHero,_E)+70+GetBaseDamage(myHero)+GetBonusDmg(myHero),0)  then 
			self:CastE(unit)
		elseif BM.KS.UseE:Value() and GotBuff(unit, "vaynesilveredbolts") == 2 and GetHP2(unit) < CalcDamage(myHero, unit, 70*GetCastLevel(myHero,_E)+70+GetBaseDamage(myHero)+GetBonusDmg(myHero),0)  then 
			CastTargetSpell(unit, _E)
		elseif BM.KS.UseE:Value() and (GotBuff(unit, "vaynesilveredbolts") == 1) or (GotBuff(unit, "vaynesilveredbolts") == 0) and GetHP2(unit) < CalcDamage(myHero, unit, 35*GetCastLevel(myHero,_E)+35+GetBaseDamage(myHero)+GetBonusDmg(myHero),0)  then 
			CastTargetSpell(unit,_E)
		end
	end
end



--Garen
if FileExist(COMMON_PATH .. "DamageLib.lua") and ChampName == "Garen" then
require 'DamageLib'
end

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
  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "LaneClear" then
  self:LaneClear()
  self:JungleClear()
  end

  self:KillSteal()    
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
		if BM.KS.UseQ:Value() and IsReady(_Q) and GetHP2(unit) < getdmg("Q", unit)  then 
			CastSpell(_Q)
		elseif BM.KS.UseR:Value() and IsReady(_R) and GetHP2(unit) < getdmg("R", unit) then 
			CastTargetSpell(unit,_R)
		end
	end
end



--Soraka
if FileExist(COMMON_PATH .. "OpenPredict.lua") and ChampName == "Soraka" then
require 'OpenPredict'
end

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
	
end

function Soraka:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end

self:AutoW()
self:AutoR()  
end

function Soraka:UseQ(unit)
local QpI = GetCircularAOEPrediction(unit, Q)
if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.P.HC:Value()/100) then
CastSkillShot(_Q, QpI.castPos)
end
end

function Soraka:UseE(unit)
local EpI = GetCircularAOEPrediction(unit, E)
if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero, _E)) and EpI and EpI.hitChance >= (BM.P.HC:Value()/100) then
CastSkillShot(_E, EpI.castPos)
end
end

function Soraka:Combo(unit)
    if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
end

function Soraka:Harass(unit)
    if BM.C.Q:Value() then self:UseQ(unit) end
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
	    if IsReady(_R) and GetPercentHP(ally) <= BM.AR.allyHP:Value() and BM.AR.Enabled:Value() and EnemiesAround(GetOrigin(ally), 1000) >= 1 then
		    CastSpell(_R)
	    elseif IsReady(_R) and GetPercentHP(myHero) <= BM.AR.myHeroHP:Value() and BM.AR.Enabled:Value() and EnemiesAround(GetOrigin(myHero), 1000) >= 1 then
		    CastSpell(_R)
		end
	end
end



--DrMundo
if FileExist(COMMON_PATH .. "OpenPredict.lua") and FileExist(COMMON_PATH .. "DamageLib.lua") and ChampName == "DrMundo" then
require 'OpenPredict'
require 'DamageLib'
end

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
	BM.LH:Boolean("UseQ", "Use Q", true)
-----------------------------------------
	BM.KS:Boolean("UseQ", "Use Q", true)
	
end

function DrMundo:Tick()
  if IsDead(myHero) then return end
  local Target = GetCurrentTarget()
  
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
  
  if IOW:Mode() == "LastHit" then
  self:LastHit()
  end
  
self:Killsteal()
end

function DrMundo:UseQ(unit)
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.P.HC:Value()/100) and not QpI:mCollision(1) then
		CastSkillShot(_Q, QpI.castPos)
end
end

function DrMundo:UseQLastHit(unit)
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.P.HC:Value()/100) then
		CastSkillShot(_Q, QpI.castPos)
	end
end


function DrMundo:UseW(unit)
	if IsReady(_W) and GotBuff(myHero, "BurningAgony") ~= 1 and ValidTarget(unit, 500) and GetDistance(unit) <= 500 then
		CastSpell(_W)
	elseif IsReady(_W) and GotBuff(myHero, "BurningAgony") == 1 and ValidTarget(unit, 600) and GetDistance(unit) >= 500 then
		CastSpell(_W)
	end
end

function DrMundo:UseE(unit)
	if IsReady(_E) and ValidTarget(unit, 300) then
		CastSpell(_E)
	end
end

function DrMundo:UseR(unit)
	if IsReady(_R) and ValidTarget(unit, 500) and EnemiesAround(GetOrigin(myHero), 675) >= BM.C.R.enemies:Value() and AlliesAround(GetOrigin(myHero), 675) >= BM.C.R.allies:Value() and GetPercentHP(myHero) <= BM.C.R.Enabled:Value() then
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
			if BM.LC.UseQ:Value() then self:UseQ(minion) end
			if BM.LC.W.Enabled:Value() and GetPercentHP(myHero) >= BM.LC.W.myHeroHP:Value() then self:UseW(minion) end
            if BM.LC.UseE:Value() then self:UseE(minion) end
		end
	end
end

function DrMundo:JungleClear()
	for _, mob in pairs(minionManager.objects) do
		if GetTeam(mob) == MINION_JUNGLE then
			if BM.LC.UseQ:Value() then self:UseQ(mob) end
			if BM.LC.W.Enabled:Value() and GetPercentHP(myHero) >= BM.LC.W.myHeroHP:Value() then self:UseW(mob) end
            if BM.LC.UseE:Value() then self:UseE(mob) end
		end
	end
end

function DrMundo:LastHit()
	for _, minion in pairs(minionManager.objects) do
		if GetTeam(minion) == MINION_ENEMY then
			if BM.LH.UseQ:Value() and GetHP(minion) < getdmg("Q", minion) then self:UseQLastHit(minion) end
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



--Blitzcrank
if FileExist(COMMON_PATH .. "OpenPredict.lua") and FileExist(COMMON_PATH .. "DamageLib.lua") and ChampName == "Blitzcrank" then
require 'OpenPredict'
require 'DamageLib'
end

class 'Blitzcrank'

local Q = { delay = 0.250, speed = 1800, width = 70, range = 900 }

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
  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end
  
self:Killsteal()
end

function Blitzcrank:UseQ(unit)
local QpI = GetPrediction(unit, Q)
	if IsReady(_Q) and ValidTarget(unit, GetCastRange(myHero, _Q)) and QpI and QpI.hitChance >= (BM.P.HC:Value()/100) and not QpI:mCollision(1) then
		CastSkillShot(_Q, QpI.castPos)
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
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.UseW:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
end

function Blitzcrank:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
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


--Leona
if FileExist(COMMON_PATH .. "OpenPredict.lua") and FileExist(COMMON_PATH .. "DamageLib.lua") and ChampName == "Leona" then
require 'OpenPredict'
require 'DamageLib'
end

class 'Leona'

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
  
  if IOW:Mode() == "Combo" then 
  self:Combo(Target)
  end

  if IOW:Mode() == "Harass" then
  self:Harass(Target)
  end
  
self:Killsteal()
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

function Leona:UseE(unit)
local EpI = GetPrediction(unit, E)
	if IsReady(_E) and ValidTarget(unit, GetCastRange(myHero, _E)) and EpI and EpI.hitChance >= (BM.P.HC:Value()/100) then
		CastSkillShot(_E, EpI.castPos)
	end
end

function Leona:UseR(unit)
local RpI = GetCircularAOEPrediction(unit, R)
	if IsReady(_R) and ValidTarget(unit, GetCastRange(myHero, _R)) and RpI and RpI.hitChance >= (BM.P.HC:Value()/100) then
		CastSkillShot(_R, RpI.castPos)
	end
end

function Leona:Combo(unit)
	if BM.C.UseQ:Value() then self:UseQ(unit) end
	if BM.C.W.Enabled:Value() and GetPercentHP(myHero) <= BM.C.W.myHeroHP:Value() then self:UseW(unit) end
	if BM.C.UseE:Value() then self:UseE(unit) end
	if BM.C.UseR:Value() then self:UseR(unit) end
end

function Leona:Harass(unit)
	if BM.H.UseQ:Value() then self:UseQ(unit) end
	if BM.H.UseW.Enabled:Value() and GetPercentHP(myHero) <= BM.H.W.myHeroHP:Value() then self:UseW(unit) end
	if BM.H.UseE:Value() then self:UseE(unit) end
end

function Leona:Killsteal()
   for _, unit in pairs(GetEnemyHeroes()) do
		if BM.KS.UseQ:Value() and GetHP2(unit) < getdmg("Q", unit) then 
			self:UseQ(unit)
		elseif BM.KS.UseE:Value() and GetHP2(unit) < getdmg("E", unit) then 
			self:UseE(unit)
		elseif BM.KS.UseR:Value() and GetHP2(unit) < getdmg("R", unit) then
		    self:UseR(unit)
		end
	end
end






if Champs[ChampName] == true then
	 if _G[ChampName] then
  	 _G[ChampName]()
	end 
end

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

class "AutoUpdater" -- {
  function AutoUpdater:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError)
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

  function AutoUpdater:print(str)
    print('<font color="#FFFFFF">'..os.clock()..': '..str)
  end

  function AutoUpdater:OnDraw()
  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
    DrawText('Download Status: '..(self.DownloadStatus or 'Unknown'),25,10,250,ARGB(0xFF,0xFF,0xFF,0xFF))
  end
  end

  function AutoUpdater:CreateSocket(url)
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

  function AutoUpdater:Base64Encode(data)
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

  function AutoUpdater:Base64Decode(data)
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

  function AutoUpdater:GetOnlineVersion()
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

  function AutoUpdater:DownloadUpdate()
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
  
  AutoUpdater(SxcSAIOVersion,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
