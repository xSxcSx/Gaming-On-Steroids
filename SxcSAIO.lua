local SxcSAIOVersion = 0.1

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
	}
	
	function OnLoad()
	FindUpdates()
	BaseMenu()
	end
	
	local ChampName = myHero.charName
	
	if not Champs[ChampName] then 
	PrintChat("<font color=\"#81F700\"><b>{SxcSAIO}::: " .. ChampName .. "not supported!</b></font>")
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
  
  if FileExist(COMMON_PATH .. "OpenPredict.lua") or FileExist(COMMON_PATH .. "MapPositionGOS") then
    PrintChat("<font color=\"#81F700\"><b>{SxcSAIO} ::: Version: " .. SxcSAIOVersion .. " ::: has been loaded!</b></font>")
  end
	
   local BlockAntiGapCloser = {["Vayne"] = true,}
   local BlockLast = {}
   local BlockLane = {["Vayne"] = true,}
   local BlockHarass = {["Vayne"] = true,}
   local BlockJungle = {["Vayne"] = true,}
   local BlockKill = {["Vayne"] = true,}

    local BM = MenuConfig(ChampName, ChampName)
	BM:Menu("C", "Combo")	
    if BlockAntiGapCloser[ChampName] == true then BM:Menu("AGP", "AntiGapCloser") end
    if BlockHarass[ChampName] == true then BM:Menu("H", "Harass") end
    if BlockLast[ChampName] == true then BM:Menu("LH", "LastHit") end
    if BlockLane[ChampName] == true then BM:Menu("LC", "LaneClear") end
	if BlockJungle[ChampName] == true then BM:Menu("JC", "JungleClear")	end
	if BlockKill[ChampName] == true then BM:Menu("KS", "KillSteal") end
	
   --{Vayne
  class 'Vayne'

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
  
  BM.LC:Boolean("UseQ", "Use Q", true)
  BM.LC:Boolean("mManager", "LaneClear Mana", 25, 1, 100, 10) 
  
  BM.JC:Boolean("UseQ", "Use Q", true)
  BM.JC:Boolean("UseE", "Use E", true)
  BM.JC:Slider("mManager", "JungleClear Mana", 25, 1, 100, 10) 
  
  BM.KS:Boolean("UseE", "Use E", true)
  
  end

  AddGapcloseEvent(_E, 550, true, Menu.AGP)
  
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

 -- self:KillSteal()
 end
  
  function Vayne:QLogic(unit)
  if IsReady(_Q) and GetDistance(unit) <= 1000 then 
  CastSpell(_Q, GetMousePos())
  end
  end


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
  if BM.C.UseQ:Value() then self:QLogic(unit) end
  if BM.C.UseE:Value() then self:CastE(unit) end 
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

  -- function Vayne:KillSteal()
  -- for _, unit in pairs(GetEnemyHeroes()) do
  -- local health = GetCurrentHP(unit)
  -- if BM.KS.UseE:Value() and IsReady(_E) then 
  -- end
  -- end
  --Vayne}

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
