class 'Activator'

local SxcSActivatorVersion = 0.01
local M = MenuConfig("SxcSActivator", "SxcSActivator")
local Heal = (GetCastName(myHero,SUMMONER_1):lower():find("summonerheal") and SUMMONER_1 or (GetCastName(myHero,SUMMONER_2):lower():find("summonerheal") and SUMMONER_2 or nil))
local Barrier = (GetCastName(myHero,SUMMONER_1):lower():find("summonerbarrier") and SUMMONER_1 or (GetCastName(myHero,SUMMONER_2):lower():find("summonerbarrier") and SUMMONER_2 or nil))
local Ignite = (GetCastName(myHero,SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(myHero,SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))

local ToUpdate = {}
ToUpdate.Version = SxcSActivatorVersion
ToUpdate.UseHttps = true
ToUpdate.Host = "raw.githubusercontent.com"
ToUpdate.VersionPath = "/xSxcSx/Gaming-On-Steroids/master/SxcSActivator.version"
ToUpdate.ScriptPath =  "/xSxcSx/Gaming-On-Steroids/master/SxcSActivator.lua"
ToUpdate.SavePath = SCRIPT_PATH.."SxcSActivator.lua"
ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSActivatorUpdater} ::: Updated to ::: "..NewVersion..". Please Reload with 2x F6</b></font>") end
ToUpdate.CallbackNoUpdate = function(OldVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSActivatorUpdater} ::: No Updates Found</b></font>") end
ToUpdate.CallbackNewVersion = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSActivatorUpdater} ::: New Version found ::: "..NewVersion..". Please wait until its downloaded</b></font>") end
ToUpdate.CallbackError = function(NewVersion) PrintChat("<font color=\"#81F700\"><b>{SxcSActivatorUpdater} ::: Error while Downloading. Please try again.</b></font>") end

function Activator:__init()
self:Load()
end

function Activator:Load()
OnTick(function() self:Tick() end)
OnUpdateBuff(function(unit, buff) self:UpdateBuff(unit, buff) end)
OnRemoveBuff(function(unit, buff) self:RemoveBuff(unit, buff) end)
self:Menu()
end

function Activator:Menu()
	M:Info("scx", "") M:Info("lösa", "Press 2xf6 after ") M:Info("awdasx", "buying or upgrading an Item")
	
	M:Menu("OI", "Offensive Items -->")
	if GetItemSlot(myHero,3144) > 0 then M.OI:Boolean("Cutlass", "Use Cutlass", true) M.OI:Slider("myHeroHPCutlass", "myHeroHP to use Cutlass <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPCutlass", "EnemyHP to use Cutlass <= X ", 70, 1, 100, 5) M.OI:Boolean("CutlassCombo", "Use Cutlass in Combo", true) M.OI:Boolean("CutlassHarass", "Use Cutlass in Harras", true) M.OI:Info("132b", "") end
	if GetItemSlot(myHero,3153) > 0 then M.OI:Boolean("Botrk", "Use Botrk", true) M.OI:Slider("myHeroHPBotrk", "myHeroHP to use Botrk <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPBotrk", "EnemyHP to use Botrk <= X ", 70, 1, 100, 5) M.OI:Boolean("BotrkCombo", "Use Botrk in Combo", true) M.OI:Boolean("BotrkHarass", "Use Botrk in Harras", true) M.OI:Info("131b", "") end
	if GetItemSlot(myHero,3146) > 0 then M.OI:Boolean("GunBlade", "Use GunBlade", true) M.OI:Slider("myHeroHPGunBlade", "myHeroHP to use GunBlade <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPGunBlade", "EnemyHP to use GunBlade <= X ", 70, 1, 100, 5) M.OI:Boolean("GunBladeCombo", "Use GunBlade in Combo", true) M.OI:Boolean("GunBladeHarass", "Use GunBlade in Harras", true) M.OI:Info("130b", "") end
	if GetItemSlot(myHero,3077) > 0 then M.OI:Boolean("Tiamat", "Use Tiamat", true) M.OI:Slider("myHeroHPTiamat", "myHeroHP to use Tiamat <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPTiamat", "EnemyHP to use Tiamat <= X ", 70, 1, 100, 5) M.OI:Boolean("TiamatCombo", "Use Tiamat in Combo", true) M.OI:Boolean("TimatHarass", "Use Tiamat in Harass", true) M.OI:Boolean("TiamatJungleClear", "Use Tiamat in JungleCLear", true) M.OI:Boolean("TimatLaneClear", "Use Tiamat in LaneClear", true) M.OI:Info("130c", "") end
	if GetItemSlot(myHero,3074) > 0 then M.OI:Boolean("RavenousHydra", "Use RavenousHydra", true) M.OI:Slider("myHeroHPRavenousHydra", "myHeroHP to use RavenousHydra <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPRavenousHydra", "EnemyHP to use RavenousHydra <= X ", 70, 1, 100, 5) M.OI:Boolean("RavenousHydraCombo", "Use RavenousHydra in Combo", true) M.OI:Boolean("RavenousHydraHarass", "Use RavenousHydra in Harass", true) M.OI:Boolean("RavenousHydraJungleClear", "Use RavenousHydra in JungleCLear", true) M.OI:Boolean("RavenousHydraLaneClear", "Use RavenousHydra in LaneClear", true) M.OI:Info("130d", "") end
	if GetItemSlot(myHero,3748) > 0 then M.OI:Boolean("TitanicHydra", "Use TitanicHydra", true) M.OI:Slider("myHeroHPTitanicHydra", "myHeroHP to use TitanicHydra <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPTitanicHydra", "EnemyHP to use TitanicHydra <= X ", 70, 1, 100, 5) M.OI:Boolean("TitanicHydraCombo", "Use TitanicHydra in Combo", true) M.OI:Boolean("TitanicHydraHarass", "Use TitanicHydra in Harass", true) M.OI:Boolean("TitanicHydraJungleClear", "Use TitanicHydra in JungleCLear", true) M.OI:Boolean("TitanicHydraLaneClear", "Use TitanicHydra in LaneClear", true) M.OI:Info("130e", "") end
	if GetItemSlot(myHero,3142) > 0 then M.OI:Boolean("Youmus", "Use Youmus", true) M.OI:Slider("myHeroHPYoumus", "myHeroHP to use Youmus <= X ", 70, 1, 100, 5) M.OI:Slider("enemyHPYoumus", "EnemyHP to use Youmus <= X ", 70, 1, 100, 5) M.OI:Slider("YoumusRange", "Enemy Range", 1000, 500, 1500, 10) M.OI:Boolean("YoumusCombo", "Use Youmus in Combo", true) M.OI:Boolean("YoumusHarass", "Use Youmus in Harras", true) M.OI:Info("130f", "") end
	
	M:Menu("DI", "Defensive Items -->")
	if GetItemSlot(myHero,3140) > 0 then M.DI:Boolean("QSS", "Use QSS", true) M.DI:Info("scx50", "") end 
	if GetItemSlot(myHero,3139) > 0 then M.DI:Boolean("Scimital", "Use Scimital", true) M.DI:Info("scx5s0", "") end 
	if GetItemSlot(myHero,3222) > 0 then M.DI:Boolean("Mikaels", "Use Mikaels", true) M.DI:Boolean("OnMyself", "Use on Myself", true) M.DI:Boolean("OnAlly", "Use On Ally", true) M.DI:Info("scx2s0", "") end 
	
	M:Menu("S", "Summoners -->")
	if Heal then M.S:Boolean("H", "Use Heal", true) M.S:Slider("myHeroHPH", "myHeroHP to use Heal <= X ", 5, 1, 100, 5) M.S:Slider("ea", "Enemy Range", 750, 500, 1500, 10) M.S:Boolean("HealCombo", "Use Heal in Combo", true) M.S:Boolean("HealHarass", "Use Heal in Harras", true) M.S:Info("138b", "") end
	if Barrier then M.S:Boolean("B", "Use Barrier", true) M.S:Slider("myHeroHPB", "myHeroHP to use Barrier <= X ", 5, 1, 100, 5) M.S:Slider("ea2", "Enemy Range", 750, 500, 1500, 10) M.S:Boolean("BarrierCombo", "Use Barrier in Combo", true) M.S:Boolean("BarrierHarass", "Use Barrier in Harras", true) M.S:Info("136b", "") end
	if Ignite then M.S:Boolean("IG", "Use Ignite", true) M.S:Info("135b", "") end
	
end

function Activator:Tick()
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
		
	elseif _G.PW then
	
		if PW:Mode() == "Combo" then
			self:Combo(Target)
		end		
		if PW:Mode() == "Harass" then
			self:Harass(Target)
		end		
		if PW:Mode() == "LaneClear" then
			self:LaneClear()
			self:JungleClear()
		end		
	end
self:Ignite()
self:AntiCCx()
end		
			
function Activator:Ignite()		
  for _, unit in pairs(GetEnemyHeroes()) do
	if Ignite and IsReady(Ignite) and M.S.IG:Value() and GetCurrentHP(unit)+GetHPRegen(unit)*3 < getdmg("IGNITE",unit) and ValidTarget(unit, 600) then
		CastTargetSpell(unit, Ignite)
	end
  end
end

function Activator:AntiCCx()
	if CC and GetItemSlot(myHero,3140) > 0 and M.DI.QSS:Value() and IsReady(GetItemSlot(myHero,3140)) then
		CastSpell(GetItemSlot(myHero,3140))
	end
	if CC and GetItemSlot(myHero,3139) > 0 and M.DI.Scimital:Value() and IsReady(GetItemSlot(myHero,3139)) then
		CastSpell(GetItemSlot(myHero,3139))
	end
	if CC and GetItemSlot(myHero,3222) > 0 and M.DI.Mikaels:Value() and IsReady(GetItemSlot(myHero,3222)) and M.DI.OnMyself:Value() then
		CastTargetSpell(myHero, GetItemSlot(myHero,3222))
    end
  end
   for _, ally in pairs(GetAllyHeroes()) do
	if aCC and GetItemSlot(myHero,3222) > 0 and M.DI.Mikaels:Value() and IsReady(GetItemSlot(myHero,3222)) and M.DI.OnAlly:Value() and GetDistance(myHero,ally) <= 550 then
		CastTargetSpell(ally, GetItemSlot(myHero,3222))
	end
end

function Activator:Combo(unit)
	if GetItemSlot(myHero,3144) > 0 and IsReady(GetItemSlot(myHero,3144)) and GetPercentHP(myHero) <= M.OI.myHeroHPCutlass:Value() and M.OI.Cutlass:Value() and GetPercentHP(unit) <= M.OI.enemyHPCutlass:Value() and ValidTarget(unit, 600) and M.OI.CutlassCombo:Value() then
	CastTargetSpell(unit, GetItemSlot(myHero,3144))
	end
	if GetItemSlot(myHero,3153) > 0 and IsReady(GetItemSlot(myHero,3153)) and GetPercentHP(myHero) <= M.OI.myHeroHPBotrk:Value() and M.OI.Botrk:Value() and GetPercentHP(unit) <= M.OI.enemyHPBotrk:Value() and ValidTarget(unit, 600) and M.OI.BotrkCombo:Value() then
		CastTargetSpell(unit, GetItemSlot(myHero,3153))
	end
	if GetItemSlot(myHero,3146) > 0 and IsReady(GetItemSlot(myHero,3146)) and GetPercentHP(myHero) <= M.OI.myHeroHPGunBlade:Value() and M.OI.GunBlade:Value() and GetPercentHP(unit) <= M.OI.enemyHPGunBlade:Value() and ValidTarget(unit, 600) and M.OI.GunBladeCombo:Value() then
		CastTargetSpell(unit, GetItemSlot(myHero,3146))
	end
	if GetItemSlot(myHero,3077) > 0 and IsReady(GetItemSlot(myHero,3077)) and GetPercentHP(myHero) <= M.OI.myHeroHPTiamat:Value() and M.OI.Tiamat:Value() and GetPercentHP(unit) <= M.OI.enemyHPTiamat:Value() and ValidTarget(unit, 300) and M.OI.TiamatCombo:Value() then
		CastSpell(GetItemSlot(myHero,3077))
	end
	if GetItemSlot(myHero,3074) > 0 and IsReady(GetItemSlot(myHero,3074)) and GetPercentHP(myHero) <= M.OI.myHeroHPRavenousHydra:Value() and M.OI.RavenousHydra:Value() and GetPercentHP(unit) <= M.OI.enemyHPRavenousHydra:Value() and ValidTarget(unit, 300) and M.OI.RavenousHydraCombo:Value() then
		CastSpell(GetItemSlot(myHero,3074))
	end
	if GetItemSlot(myHero,3748) > 0 and IsReady(GetItemSlot(myHero,3748)) and GetPercentHP(myHero) <= M.OI.myHeroHPTitanicHydra:Value() and M.OI.TitanicHydra:Value() and GetPercentHP(unit) <= M.OI.enemyHPTitanicHydra:Value() and ValidTarget(unit, 300) and M.OI.TitanicHydraCombo:Value() then
		CastSpell(GetItemSlot(myHero,3748))
	end
	if GetItemSlot(myHero,3142) > 0 and IsReady(GetItemSlot(myHero,3142)) and GetPercentHP(myHero) <= M.OI.myHeroHPYoumus:Value() and M.OI.Youmus:Value() and GetPercentHP(unit) <= M.OI.enemyHPYoumus:Value() and GetDistance(unit) <= M.OI.YoumusRange:Value() and ValidTarget(unit, 1501) and M.OI.YoumusCombo:Value() then
		CastSpell(GetItemSlot(myHero,3142))
	end
	if Heal and IsReady(Heal) and GetPercentHP(myHero) <= M.S.myHeroHPH:Value() and M.S.H:Value() and EnemiesAround(GetOrigin(myHero), M.S.ea:Value()) >= 1 and M.S.HealCombo:Value() then
		CastSpell(Heal)
	end
	if Barrier and IsReady(Barrier) and GetPercentHP(myHero) <= M.S.myHeroHPB:Value() and M.S.B:Value() and EnemiesAround(GetOrigin(myHero), M.S.ea2:Value()) >= 1 and M.S.BarrierCombo:Value() then
		CastSpell(Barrier)
	end
end	

function Activator:Harass(unit)
	if GetItemSlot(myHero,3144) > 0 and IsReady(GetItemSlot(myHero,3144)) and GetPercentHP(myHero) <= M.OI.myHeroHPCutlass:Value() and M.OI.Cutlass:Value() and GetPercentHP(unit) <= M.OI.enemyHPCutlass:Value() and ValidTarget(unit, 600) and M.OI.CutlassHarass:Value() then
	CastTargetSpell(unit, GetItemSlot(myHero,3144))
	end
	if GetItemSlot(myHero,3153) > 0 and IsReady(GetItemSlot(myHero,3153)) and GetPercentHP(myHero) <= M.OI.myHeroHPBotrk:Value() and M.OI.Botrk:Value() and GetPercentHP(unit) <= M.OI.enemyHPBotrk:Value() and ValidTarget(unit, 600) and M.OI.BotrkHarass:Value() then
		CastTargetSpell(unit, GetItemSlot(myHero,3153))
	end
	if GetItemSlot(myHero,3146) > 0 and IsReady(GetItemSlot(myHero,3146)) and GetPercentHP(myHero) <= M.OI.myHeroHPGunBlade:Value() and M.OI.GunBlade:Value() and GetPercentHP(unit) <= M.OI.enemyHPGunBlade:Value() and ValidTarget(unit, 600) and M.OI.GunBladeHarassValue() then
		CastTargetSpell(unit, GetItemSlot(myHero,3146))
	end
	if GetItemSlot(myHero,3077) > 0 and IsReady(GetItemSlot(myHero,3077)) and GetPercentHP(myHero) <= M.OI.myHeroHPTiamat:Value() and M.OI.Tiamat:Value() and GetPercentHP(unit) <= M.OI.enemyHPTiamat:Value() and ValidTarget(unit, 300) and M.OI.TiamatHarass:Value() then
		CastSpell(GetItemSlot(myHero,3077))
	end
	if GetItemSlot(myHero,3074) > 0 and IsReady(GetItemSlot(myHero,3074)) and GetPercentHP(myHero) <= M.OI.myHeroHPRavenousHydra:Value() and M.OI.RavenousHydra:Value() and GetPercentHP(unit) <= M.OI.enemyHPRavenousHydra:Value() and ValidTarget(unit, 300) and M.OI.RavenousHydraHarass:Value() then
		CastSpell(GetItemSlot(myHero,3074))
	end
	if GetItemSlot(myHero,3748) > 0 and IsReady(GetItemSlot(myHero,3748)) and GetPercentHP(myHero) <= M.OI.myHeroHPTitanicHydra:Value() and M.OI.TitanicHydra:Value() and GetPercentHP(unit) <= M.OI.enemyHPTitanicHydra:Value() and ValidTarget(unit, 300) and M.OI.TitanicHydraHarass:Value() then
		CastSpell(GetItemSlot(myHero,3748))
	end
	if GetItemSlot(myHero,3142) > 0 and IsReady(GetItemSlot(myHero,3142)) and GetPercentHP(myHero) <= M.OI.myHeroHPYoumus:Value() and M.OI.Youmus:Value() and GetPercentHP(unit) <= M.OI.enemyHPYoumus:Value() and GetDistance(unit) <= M.OI.YoumusRange:Value() and ValidTarget(unit, 1501) and M.OI.YoumusHarass:Value() then
		CastSpell(GetItemSlot(myHero,3142))
	end
	if Heal and IsReady(Heal) and GetPercentHP(myHero) <= M.S.myHeroHPH:Value() and M.S.H:Value() and EnemiesAround(GetOrigin(myHero), M.S.ea:Value()) >= 1 and M.S.HealHarass:Value() then
		CastSpell(Heal)
	end
	if Barrier and IsReady(Barrier) and GetPercentHP(myHero) <= M.S.myHeroHPB:Value() and M.S.B:Value() and EnemiesAround(GetOrigin(myHero), M.S.ea2:Value()) >= 1 and M.S.BarrierHarass:Value() then
		CastSpell(Barrier)
	end
end	

function Activator:LaneClear()
  for _,minion in pairs(GetEnemyHeroes()) do
   if GetTeam(minion) == MINION_ENEMY then
	if GetItemSlot(myHero,3077) > 0 and IsReady(GetItemSlot(myHero,3077)) and GetPercentHP(myHero) <= M.OI.myHeroHPTiamat:Value() and M.OI.Tiamat:Value() and GetPercentHP(minion) <= M.OI.enemyHPTiamat:Value() and ValidTarget(minion, 300) and M.OI.TiamatLaneClear:Value() then
		CastSpell(GetItemSlot(myHero,3077))
	end
	if GetItemSlot(myHero,3074) > 0 and IsReady(GetItemSlot(myHero,3074)) and GetPercentHP(myHero) <= M.OI.myHeroHPRavenousHydra:Value() and M.OI.RavenousHydra:Value() and GetPercentHP(minion) <= M.OI.enemyHPRavenousHydra:Value() and ValidTarget(minion, 300) and M.OI.RavenousHydraLaneClear:Value() then
		CastSpell(GetItemSlot(myHero,3074))
	end
	if GetItemSlot(myHero,3748) > 0 and IsReady(GetItemSlot(myHero,3748)) and GetPercentHP(myHero) <= M.OI.myHeroHPTitanicHydra:Value() and M.OI.TitanicHydra:Value() and GetPercentHP(minion) <= M.OI.enemyHPTitanicHydra:Value() and ValidTarget(minion, 300) and M.OI.TitanicHydraLaneClear:Value() then
		CastSpell(GetItemSlot(myHero,3748))
	end
   end
  end
end

function Activator:JungleClear()
  for _,mob in pairs(GetEnemyHeroes()) do
   if GetTeam(mob) == MINION_JUNGLE then
	if GetItemSlot(myHero,3077) > 0 and IsReady(GetItemSlot(myHero,3077)) and GetPercentHP(myHero) <= M.OI.myHeroHPTiamat:Value() and M.OI.Tiamat:Value() and GetPercentHP(mob) <= M.OI.enemyHPTiamat:Value() and ValidTarget(mob, 300) and M.OI.TiamatJungleClear:Value() then
		CastSpell(GetItemSlot(myHero,3077))
	end
	if GetItemSlot(myHero,3074) > 0 and IsReady(GetItemSlot(myHero,3074)) and GetPercentHP(myHero) <= M.OI.myHeroHPRavenousHydra:Value() and M.OI.RavenousHydra:Value() and GetPercentHP(mob) <= M.OI.enemyHPRavenousHydra:Value() and ValidTarget(mob, 300) and M.OI.RavenousHydraJungleClear:Value() then
		CastSpell(GetItemSlot(myHero,3074))
	end
	if GetItemSlot(myHero,3748) > 0 and IsReady(GetItemSlot(myHero,3748)) and GetPercentHP(myHero) <= M.OI.myHeroHPTitanicHydra:Value() and M.OI.TitanicHydra:Value() and GetPercentHP(mob) <= M.OI.enemyHPTitanicHydra:Value() and ValidTarget(mob, 300) and M.OI.TitanicHydraJungleClear:Value() then
		CastSpell(GetItemSlot(myHero,3748))
	end
   end
  end
end
		
typ = { 5, 8, 11, 21, 22, 24 }

function Activator:UpdateBuff(unit, buff) --idea from deftlib (thanks deftsu!)
for i = 1, #typ do
	if unit == myHero and buff.Type == typ[i] then
		CC = true
	end
	if unit == myHero and buff.Name == "zedultexecute" then
		CC = true
    end
	if unit == myHero and buff.Name == "summonerexhaust" then
		CC = true
	end
end
 for _, ally in pairs(GetAllyHeroes()) do
	if unit == ally then
		for i = 1, #typ do
			if buff.Type == typ[i] then
				aCC = true
			end
			if buff.Name == "zedultexecute" then
				aCC = true
			end
			if buff.Name == "summonerexhaust" then
				aCC = true
			end
		end
	end
 end
end

function Activator:RemoveBuff(unit, buff)
for i = 1, #typ do
	if unit == myHero and buff.Type == typ[i] then
		CC = false
	end
	if unit == myHero and buff.Name == "zedultexecute" then
		CC = false
    end
	if unit == myHero and buff.Name == "summonerexhaust" then
		CC = false
	end
end
 for _, ally in pairs(GetAllyHeroes()) do
	if unit == ally then
		for i = 1, #typ do
			if buff.Type == typ[i] then
				aCC = false
			end
			if buff.Name == "zedultexecute" then
				aCC = false
			end
			if buff.Name == "summonerexhaust" then
				aCC = false
			end
		end
	end
 end
end

Activator()

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

class "SxcSActivatorUpdater" -- {

function SxcSActivatorUpdater:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError)
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

function SxcSActivatorUpdater:print(str)
  print('<font color="#FFFFFF">'..os.clock()..': '..str)
end
 
function SxcSActivatorUpdater:OnDraw()
local res = GetResolution()
  if self.DownloadStatus ~= 'Downloading Script (100%)' and self.DownloadStatus ~= 'Downloading VersionInfo (100%)'then
      local bP = {['x1'] = res.x - (res.x - 390),['x2'] = res.x - (res.x - 20),['y1'] = res.y / 2,['y2'] = (res.y / 2) + 20,}
    local content = '{SxcSActivatorUpdater} ::: Download Status ::: '..(self.DownloadStatus or 'Unknown')
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

function SxcSActivatorUpdater:CreateSocket(url)
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
    self.Socket:connect('GamingOnSteroids.com', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
end
 
function SxcSActivatorUpdater:Base64Encode(data)
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
  
function SxcSActivatorUpdater:Base64Decode(data)
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
  
function SxcSActivatorUpdater:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: GamingOnSteroids.com\r\n\r\n")
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
 
function SxcSActivatorUpdater:DownloadUpdate()
    if self.GotAutoUpdater then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: GamingOnSteroids.com\r\n\r\n")
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
  
  
  
  SxcSActivatorUpdater(SxcSActivatorVersion,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
