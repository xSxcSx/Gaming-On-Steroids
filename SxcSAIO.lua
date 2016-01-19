local SxcSAIOVersion = 0.1

PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Supported Hero´s ::: Vayne, Draven</b></font>")

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


if myHero.charName == "Draven" then

if FileExist(COMMON_PATH  .. "OpenPredict.lua") then
require 'OpenPredict'
require 'IPrediction'
PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: [Draven] has been loaded!</b></font>")

local EPred = { name = "DravenDoubleShot", speed = 1400, delay = 0.250, range = 1100, width = 130, collision = false, aoe = false, type = "linear"}
EPrediction = IPrediction.Prediction(EPred)

local RPred = { name = "DravenRCast", speed = 2000, delay = 0.4, range = 20000, width = 140, collision = false, aoe = false, type = "linear"}
RPrediction = IPrediction.Prediction(RPred)

local E = { delay = 0.250, speed = 1400, width = 130, range = 1100 }

local R = { delay = 0.400, speed = 2000, width = 140, range = 20000 }

local D = Menu("{SxcSAIO} ::: Draven", "{SxcSAIO} ::: Draven")

D:SubMenu("C", "Combo")
D:SubMenu("H", "Harass")
D:SubMenu("CA", "CatchAxe")
D:SubMenu("KS", "KillSteal")
D:SubMenu("P", "Prediction")
D:SubMenu("D", "Draw")
D:SubMenu("AGP", "AntiGapCloser")

D.C:SubMenu("Q", "Q")
D.C.Q:Boolean("e", "Enabled", true)
D.C.Q:Slider("m", "Mana", 20, 1, 100, 10)
D.C:SubMenu("W", "W")
D.C.W:Boolean("e", "Enabled", true)
D.C.W:Slider("m", "Mana", 20, 1, 100, 10)
D.C:SubMenu("E", "E")
D.C.E:Boolean("e", "Enabled", true)
D.C.E:Slider("m", "Mana", 20, 1, 100, 10)

D.H:SubMenu("Q", "Q")
D.H.Q:Boolean("e", "Enabled", true)
D.H.Q:Slider("m", "Mana", 20, 1, 100, 10)
D.H:SubMenu("W", "W")
D.H.W:Boolean("e", "Enabled", true)
D.H.W:Slider("m", "Mana", 20, 1, 100, 10)
D.H:SubMenu("E", "E")
D.H.E:Boolean("e", "Enabled", true)
D.H.E:Slider("m", "Mana", 20, 1, 100, 10)

D.CA:Boolean("c", "CatchAxe in Combo", true)
D.CA:Boolean("h", "CatchAxe in Harass", true)
D.CA:Boolean("lc", "CatchAxe in LaneClear", true)
D.CA:Boolean("lh", "CatchAxe in LastHit", true)
D.CA:Slider("crc", "Catch range in Combo", 600, 1, 1000, 10)
D.CA:Slider("crh", "Catch range in harass", 600, 1, 1000, 10)
D.CA:Slider("crlc", "Catch range in LaneClear", 600, 1, 1000, 10)
D.CA:Slider("crlh", "Catch range in LastHit", 600, 1, 1000, 10)

D.KS:Boolean("E", "E", true)
D.KS:Boolean("R", "R(cast ult)", true)
D.KS:Boolean("R2", "R2(comeback of ult)", false)

D.P:DropDown("P", "Prediction", 1, {"OpenPredict", "GoS", "IPrediction"})
D.P:Slider("OPHC", "OpenPredict Hitchance", 40, 1, 100, 10)
D.P:Slider("GHC", "GoSPrediction Hitchance", 1, 0, 1, 1)
D.P:Slider("IHC", "IPrediction Hitchance", 2, 1, 2, 1)

D.D:DropDown("Draw", "Draw", 1, {"Draw If Is Ready", "Draw Always"})
D.D:Slider("QQ", "Quality", 35, 1, 100, 10)
D.D:Slider("WQ", "Circle Width", 1, 1, 5, 1)
D.D:Boolean("A", "Draw Axe Pos", true)
D.D:Boolean("E", "Draw E", true)

AddGapcloseEvent(_E, 1100, false, D.AGP)

function GoSE(unit)
local EP = GetPredictionForPlayer(GetOrigin(myHero), unit, GetMoveSpeed(unit), 1400, 250, 1100, 130, false, true)
if EP.HitChance == D.P.GHC:Value() and D.P.P:Value() == 2 then
   CastSkillShot(_E, EP.PredPos.x,EP.PredPos.y,EP.PredPos.z)
end
end

function GoSR(unit)
local RP = GetPredictionForPlayer(GetOrigin(myHero), unit, GetMoveSpeed(unit), 2000, 400, 1100, 140, false, true)
if RP.HitChance == D.P.GHC:Value() and D.P.P:Value() == 2 then
   CastSkillShot(_R, RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
end
end

function OpE(unit)
local EpI = GetPrediction(unit, E)
if EpI and EpI.hitChance >= (D.P.OPHC:Value()/100) and D.P.P:Value() == 1 then
   CastSkillShot(_E, EpI.castPos)
end
end

function OpR(unit)
local RpI = GetPrediction(unit, R)
if RpI and RpI.hitChance >= (D.P.OPHC:Value()/100) and D.P.P:Value() == 1 then
   CastSkillShot(_R, RpI.castPos)
end
end

function IpE(unit)
local hitchance, pos = EPrediction:Predict(unit)
if hitchance >= D.P.IHC:Value() and D.P.P:Value() == 3 then
CastSkillShot(_E, pos)
end
end

function IpR(unit)
local hitchance, pos = RPrediction:Predict(unit)
if hitchance >= D.P.IHC:Value() and D.P.P:Value() == 3 then
CastSkillShot(_R, pos)
end
end

reticles = {}
function OnTick()
local target = GetCurrentTarget()
    if IOW:Mode() == "Combo" then
	    if D.C.Q.e:Value() and IsReady(_Q) and GetPercentMP(myHero) >= D.C.Q.m:Value() and ValidTarget(target, 700) then
		    CastSpell(_Q)
		end
        if D.C.W.e:Value() and IsReady(_W) and GetPercentMP(myHero) >= D.C.W.m:Value() and ValidTarget(target, 700) then
		    CastSpell(_W)
		end
		if D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    OpE(target)
		elseif D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    GoSE(target) 
		elseif D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    IpE(target) 
        end		    
	end
    if IOW:Mode() == "Combo" then
	    if D.H.Q.e:Value() and IsReady(_Q) and GetPercentMP(myHero) >= D.H.Q.m:Value() and ValidTarget(target, 700) then
		    CastSpell(_Q)
		end
        if D.H.W.e:Value() and IsReady(_W) and GetPercentMP(myHero) >= D.H.W.m:Value() and ValidTarget(target, 700) then
		    CastSpell(_W)
		end
		if D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    OpE(target)
		elseif D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    GoSE(target) 
		elseif D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    IpE(target) 
        end		    
	end
		if D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_E)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    OpE(target)
		elseif D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_E)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    GoSE(target) 
		elseif D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_E)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    IpE(target) 
        end		  
		if D.KS.R:Value() and GetCastName(myHero,_R) == "DravenRCast" and IsReady(_R) and ValidTarget(target, 3000) and D.P.P:Value() == 1 and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_R)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    OpR(target)
		elseif D.KS.R:Value() and GetCastName(myHero,_R) == "DravenRCast" and IsReady(_R) and ValidTarget(target, 3000) and D.P.P:Value() == 2 and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_R)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    GoSR(target) 
		elseif D.KS.R:Value() and GetCastName(myHero,_R) == "DravenRCast" and IsReady(_R) and ValidTarget(target, 3000) and D.P.P:Value() == 3 and GetCurrentHP(target) < CalcDamage(myHero, target, 100*GetCastLevel(myHero,_R)+75+1.1*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    IpR(target) 
        end   
		if D.KS.R2:Value() and GetCastName(myHero,_R) == "DravenRCast" and IsReady(_R) and ValidTarget(target, 3000) then
		    CastSpell(_R) 	
        end			
end
for _,reticle in pairs(reticles) do
   local RP = GetOrigin(Axe)
        
 if IOW:Mode() == "Combo" then
  if GetDistance(RP) <= D.CA.crc:Value() and D.CA.c:Value() then
	IOW.forcePos = RP
	else
	IOW.forcePos = nil
	return
  end
 end

 if IOW:Mode() == "Harass" then
  if GetDistance(RP) <= D.CA.crh:Value() and D.CA.h:Value() then
	IOW.forcePos = RP
	else
	IOW.forcePos = nil
	return
  end
 end
 
 if IOW:Mode() == "LaneClear" then
  if GetDistance(RP) <= D.CA.crlc:Value() and D.CA.lc:Value() then
	IOW.forcePos = RP
	else
	IOW.forcePos = nil
	return
  end
 end
 
 if IOW:Mode() == "LastHit" then
  if GetDistance(RP) <= D.CA.crlh:Value() and D.CA.lh:Value() then
	IOW.forcePos = RP
	else
	IOW.forcePos = nil
	return
  end
 end
end

OnCreateObj(function(Object)
  if GetObjectBaseName(Object) == "Draven_Base_Q_reticle_self.troy" then
    table.insert(reticles, Object)
  end
end)

OnDeleteObj(function(Object)
  myHer0 = GetOrigin(myHero)
if GetObjectBaseName(Object) == "Draven_Base_Q_reticle_self.troy" then
  table.remove(reticles, 1)
end
end)

OnDraw(function(myHero)

    if D.D.Draw:Value() == 1 then
		
        if IsReady(_E) and D.D.E:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_E),D.D.WQ:Value(),D.D.QQ:Value(),ARGB(255,255,245,255)) 
	    end	
		
 
    elseif D.D.Draw:Value() == 2 then
		
        if D.D.E:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_E),D.D.WQ:Value(),D.D.QQ:Value(),ARGB(255,255,245,255)) 
	    end		

	end 
	
	for _,Axe in pairs(Axes) do
	    if D.D.A:Value() then
			DrawCircle(GetOrigin(Axe),100,D.D.WQ:Value(),D.D.QQ:Value(),ARGB(255,255,245,255)) 
		end
	end
end)

else 
PrintChat("<font color=\"#FFFFFF\"><b>Download OpenPredict! </b> ")
end

end

if myHero.charName == "Vayne" then

if FileExist(COMMON_PATH  .. "OpenPredict.lua") then
require 'OpenPredict'
require 'MapPositionGOS'
PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: [Vayne] has been loaded!</b></font>")

local E = { delay = 0.250, speed = 3000, width = 1, range = 590 }

local V = Menu("{SxcSAIO} ::: Vayne", "{SxcSAIO} ::: Vayne")

V:SubMenu("C", "Combo")
V:SubMenu("H", "Harass")
V:SubMenu("D", "Draw")
V:SubMenu("AGP", "AntiGapCloser")

V.C:SubMenu("Q", "Q")
V.C.Q:Boolean("e", "Enabled", true)
V.C:SubMenu("E", "E")
V.C.E:Slider("a", "accuracy", 15, 1, 50, 10)
V.C.E:Slider("pd", "Push distance", 590, 1, 590, 10)
V.C.E:Boolean("e", "Enabled", true)

V.H:SubMenu("Q", "Q")
V.H.Q:Boolean("e", "Enabled", true)
V.H:SubMenu("E", "E")
V.H.E:Slider("a", "accuracy", 15, 1, 50, 10)
V.H.E:Slider("pd", "Push distance", 590, 1, 590, 10)
V.H.E:Boolean("e", "Enabled", true)

V.D:DropDown("Draw", "Draw", 1, {"If Is Ready", "Always"})
V.D:Slider("QQ", "Quality", 35, 1, 100, 10)
V.D:Slider("WQ", "Width", 1, 1, 5, 1)
V.D:Boolean("Q", "Draw Q", true)
V.D:Boolean("E", "Draw E", true)

AddGapcloseEvent(_E, 550, true, V.AGP)

function OnTick()
end

IOW:AddCallback(AFTER_ATTACK, function(target, mode)
local m = GetMousePos()
  if mode == "Combo" and V.C.Q.e:Value() and IsReady(_Q)and ValidTarget(target, 800) and GetDistance(target) <= 700 then
    CastSkillShot(_Q, m)
  end
   if mode == "Combo" and V.C.E.e:Value() and IsReady(_E) and ValidTarget(target, 800) and GetDistance(target) <= 550 then
    rekt(target)
   end
  if mode == "Harass" and ValidTarget(target, 800) and V.H.Q.e:Value() and IsReady(_Q) and GetDistance(target) <= 700 then
    CastSkillShot(_Q, m)
   end
   if mode == "Harass" and V.H.E.e:Value() and IsReady(_E) and ValidTarget(target, 800) and GetDistance(target) <= 550 then
    rekt(target)
  end
end)

function rekt(unit)
    local e = GetPrediction(unit, E)
	local ePos = Vector(e.castPos)
	local c = math.ceil(V.C.E.a:Value())
	local cd = math.ceil(V.C.E.pd:Value()/c)
	for rekt = 1, c, 1 do
		local PP = Vector(ePos) + Vector(Vector(ePos) - Vector(myHero)):normalized()*(cd*rekt)
			
		if MapPosition:inWall(PP) == true and GotBuff(unit,"BlackShield") ~= 1 then
                CastTargetSpell(unit, _E)
	    end	
	end	
    local e = GetPrediction(unit, E)
    local ePos = Vector(e.castPos)
    local c2 = math.ceil(V.H.E.a:Value())
	local cd2 = math.ceil(V.H.E.pd:Value()/c2)
	for rekt = 1, c2, 1 do
		local PP2 = Vector(ePos) + Vector(Vector(ePos) - Vector(myHero)):normalized()*(cd2*rekt)
					
		if MapPosition:inWall(PP2) == true and GotBuff(unit,"BlackShield") ~= 1 then
                CastTargetSpell(unit, _E)
		end	
    end		
end

OnDraw(function(myHero)
    if V.D.Draw:Value() == 1 then
	   
        if IsReady(_Q) and V.D.Q:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_Q),V.D.WQ:Value(),V.D.QQ:Value(),ARGB(245,255,255,255))	
		end
        if IsReady(_E) and V.D.E:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_E),V.D.WQ:Value(),V.D.QQ:Value(),ARGB(255,255,245,255)) 
        end			
    end
 
    if V.D.Draw:Value() == 2 then
 
        if V.D.Q:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_Q),V.D.WQ:Value(),V.D.QQ:Value(),ARGB(245,255,255,255))	
		end
        if V.D.E:Value() then
            DrawCircle(GetOrigin(myHero),GetCastRange(myHero,_E),V.D.WQ:Value(),V.D.QQ:Value(),ARGB(255,255,245,255)) 			
	    end
	end
end)

else 
PrintChat("<font color=\"#FFFFFF\"><b>Download OpenPredict! </b> ")
end

end

-- if myHero.charName ~= "Blitzcrank" then

-- if FileExist(COMMON_PATH  .. "OpenPredict.lua") then
-- require 'OpenPredict'
-- require 'IPrediction'
-- PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: [Blitzcrank] has been loaded!</b></font>")

-- local QPred = { name = "RocketGrab", speed = 1800, delay = 0.250, range = 900, width = 70, collision = true, type = "linear"}
-- QPrediction = IPrediction.Prediction(QPred)

-- local Q = { delay = 0.250, speed = 1400, width = 130, range = 1100 }

-- local D = Menu("{SxcSAIO} ::: Blitzcrank", "{SxcSAIO} ::: Blitzcrank")

-- B:SubMenu("C", "Combo")
-- B:SubMenu("KS", "KillSteal")
-- B:SubMenu("P", "Prediction")
-- B:SubMenu("D", "Draw")

-- B.C:SubMenu("Q", "Q")
-- B.C.Q:Boolean("e", "Enabled", true)
-- B.C.Q:Slider("m", "Mana", 20, 1, 100, 10)
-- B.C:SubMenu("W", "W")
-- B.C.W:Boolean("e", "Enabled", true)
-- B.C.W:Slider("m", "Mana", 20, 1, 100, 10)
-- B.C:SubMenu("E", "E")
-- B.C.E:Boolean("e", "Enabled", true)
-- B.C.E:Slider("m", "Mana", 20, 1, 100, 10)

-- B.KS:Boolean("E", "E", true)
-- B.KS:Boolean("R", "R(cast ult)", true)
-- B.KS:Boolean("R2", "R2(comeback of ult)", false)

-- B.P:DropDown("P", "Prediction", 1, {"OpenPredict", "GoS", "IPrediction"})
-- B.P:Slider("OPHC", "OpenPredict Hitchance", 40, 1, 100, 10)
-- B.P:Slider("GHC", "GoSPrediction Hitchance", 1, 0, 1, 1)
-- B.P:Slider("IHC", "IPrediction Hitchance", 2, 1, 2, 1)

-- B.D:DropDown("Draw", "Draw", 1, {"Draw If Is Ready", "Draw Always"})
-- B.D:Slider("QQ", "Quality", 35, 1, 100, 10)
-- B.D:Slider("WQ", "Circle Width", 1, 1, 5, 1)
-- B.D:Boolean("A", "Draw Axe Pos", true)
-- B.D:Boolean("E", "Draw E", true)

-- function GoSE(unit)
-- local EP = GetPredictionForPlayer(GetOrigin(myHero), unit, GetMoveSpeed(unit), 1400, 250, 1100, 130, false, true)
-- if EP.HitChance == D.P.GHC:Value() and D.P.P:Value() == 2 then
   -- CastSkillShot(_E, EP.PredPos.x,EP.PredPos.y,EP.PredPos.z)
-- end
-- end

-- function GoSR(unit)
-- local RP = GetPredictionForPlayer(GetOrigin(myHero), unit, GetMoveSpeed(unit), 2000, 400, 1100, 140, false, true)
-- if RP.HitChance == D.P.GHC:Value() and D.P.P:Value() == 2 then
   -- CastSkillShot(_R, RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
-- end
-- end

-- function OpE(unit)
-- local EpI = GetPrediction(unit, E)
-- if EpI and EpI.hitChance >= (D.P.OPHC:Value()/100) and D.P.P:Value() == 1 then
   -- CastSkillShot(_E, EpI.castPos)
-- end
-- end

-- function OpR(unit)
-- local RpI = GetPrediction(unit, R)
-- if RpI and RpI.hitChance >= (D.P.OPHC:Value()/100) and D.P.P:Value() == 1 then
   -- CastSkillShot(_R, RpI.castPos)
-- end
-- end

-- function IpE(unit)
-- local hitchance, pos = EPrediction:Predict(unit)
-- if hitchance >= D.P.IHC:Value() and D.P.P:Value() == 3 then
-- CastSkillShot(_E, pos)
-- end
-- end

-- function IpR(unit)
-- local hitchance, pos = RPrediction:Predict(unit)
-- if hitchance >= D.P.IHC:Value() and D.P.P:Value() == 3 then
-- CastSkillShot(_R, pos)
-- end
-- end

-- function OnTick()
-- for _,target in pairs(GetEnemyHeroes()) do
    -- if IOW:Mode() == "Combo" then
	    -- if D.C.Q.e:Value() and IsReady(_Q) and GetPercentMP(myHero) >= D.C.Q.m:Value() and ValidTarget(target, 700) then
		    -- CastSpell(_Q)
		-- end
        -- if D.C.W.e:Value() and IsReady(_W) and GetPercentMP(myHero) >= D.C.W.m:Value() and ValidTarget(target, 700) then
		    -- CastSpell(_W)
		-- end
		-- if D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    -- OpE(target)
		-- elseif D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    -- GoSE(target) 
		-- elseif D.C.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.C.E.m:Value() and ValidTarget(target, 1100) then
		    -- IpE(target) 
        -- end		    
	-- end
    -- if IOW:Mode() == "Combo" then
	    -- if D.H.Q.e:Value() and IsReady(_Q) and GetPercentMP(myHero) >= D.H.Q.m:Value() and ValidTarget(target, 700) then
		    -- CastSpell(_Q)
		-- end
        -- if D.H.W.e:Value() and IsReady(_W) and GetPercentMP(myHero) >= D.H.W.m:Value() and ValidTarget(target, 700) then
		    -- CastSpell(_W)
		-- end
		-- if D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    -- OpE(target)
		-- elseif D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    -- GoSE(target) 
		-- elseif D.H.E.e:Value() and IsReady(_E) and GetPercentMP(myHero) >= D.H.E.m:Value() and ValidTarget(target, 1100) then
		    -- IpE(target) 
        -- end		    
	-- end
		-- if D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_Q)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    -- OpE(target)
		-- elseif D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_Q)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    -- GoSE(target) 
		-- elseif D.KS.E:Value() and IsReady(_E) and ValidTarget(target, 1100) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_Q)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    -- IpE(target) 
        -- end		  
		-- if D.KS.R:Value() and IsReady(_R) and ValidTarget(target, GetCastRange(myHero,) and GetCurrentHP(target) < CalcDamage(myHero, target, 35*GetCastLevel(myHero,_R)+35+.5*(GetBonusDmg(myHero)+GetBaseDamage(myHero)), 0) then
		    -- CastSpell(_R)
        -- end   
-- end		
-- end
-- end

-- else 
-- PrintChat("<font color=\"#FFFFFF\"><b>Download OpenPredict! </b> ")
-- end

-- end


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
    self.Socket:connect('gamingonsteroids.com', 80)
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
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: gamingonsteroids.com\r\n\r\n")
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
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: gamingonsteroids.com\r\n\r\n")
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
-- }

AutoUpdater(ToUpdate.Version,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)




