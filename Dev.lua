--(Feretorix) fixed version!

function GetDistanceX(p1,p2) --thanks Inspired!
    p1 = GetOrigin(p1) or p1
    p2 = GetOrigin(p2) or p2
    return math.sqrt(GetDistanceSqrX(p1,p2))
end

function GetDistanceSqrX(p1,p2) --thanks Inspired!
    p2 = p2 or GetMyHeroPos()
    local dx = p1.x - p2.x
    local dz = (p1.z or p1.y) - (p2.z or p2.y)
    return dx*dx + dz*dz
end



function OnTick()
local Obj_Type = GetObjectType(Object)
if Obj_Type == Obj_AI_Hero then
	if IsVisible(Object) then
		if IsObjectAlive(Object) then  --you can remove this check if you wish...
			local origin = GetOrigin(Object)
			local myscreenpos = WorldToScreen(1,origin.x,origin.y,origin.z)
			if myscreenpos.flag then --after they're visible, alive and in our screen i will get the rest of the data to save some FPS
				DrawText(string.format("ChampName  = %s", GetObjectName(Object)),12,myscreenpos.x,myscreenpos.y,0xffffffff)
				DrawText(string.format("NetworkID     = 0x%X", GetNetworkID(Object)),12,myscreenpos.x,myscreenpos.y+10,0xffffffff)
				DrawText(string.format("Q________   = %s", GetCastName(Object,_Q)),12,myscreenpos.x,myscreenpos.y+20,0xffffffff)
				DrawText(string.format("W________  = %s", GetCastName(Object,_W)),12,myscreenpos.x,myscreenpos.y+30,0xffffffff)
				DrawText(string.format("E________    = %s", GetCastName(Object,_E)),12,myscreenpos.x,myscreenpos.y+40,0xffffffff)
				DrawText(string.format("R________    = %s", GetCastName(Object,_R)),12,myscreenpos.x,myscreenpos.y+50,0xffffffff)
				DrawText(string.format("SUMONER_1  = %s", GetCastName(Object,SUMMONER_1)),12,myscreenpos.x,myscreenpos.y+60,0xffffffff)
				DrawText(string.format("SUMONER_2  = %s", GetCastName(Object,SUMMONER_2)),12,myscreenpos.x,myscreenpos.y+70,0xffffffff)
			
				local yadder = 0
				
				for i = 0,63 do
					if GetBuffCount(Object,i) > 0 then
						currbufname = GetBuffName(Object,i)
						currbufcount = GetBuffCount(Object,i)
						yadder = yadder + 10;
						DrawText(string.format("Buffstacks: %d for %s", currbufcount,currbufname),12,myscreenpos.x,myscreenpos.y+80+yadder,0xff00ff00)
						end
					end
				end
			end
		end
	--end
	else --it's not a champion, it's a different object type
	local origin = GetOrigin(Object)
	local mousepoz = GetMousePos()
	if (GetDistanceX(origin,mousepoz) < 200) then  --and (GetNetworkID(Object) > 0) then --add this network ID check for checking skillshots maybe?
		local myscreenpos = WorldToScreen(1,origin.x,origin.y,origin.z)
		if myscreenpos.flag then
			--you can port those to printchat if you wish; but since it's happening each game frame, it might not be the best idea.
			DrawCircle(origin.x,origin.y,origin.z,30,0,10000,0xffffffff); --specify some really bad circle quality like "10000" for best FPS
			DrawText(string.format("NetworkID = 0x%X", GetNetworkID(Object)),12,myscreenpos.x,myscreenpos.y,0xffffffff)
			DrawText(string.format("ObjType  = %s", GetObjectType(Object)),12,myscreenpos.x,myscreenpos.y+10,0xffffffff)
			DrawText(string.format("BaseName  = %s", GetObjectBaseName(Object)),12,myscreenpos.x,myscreenpos.y+20,0xffffffff)
			DrawText(string.format("Name  = %s", GetObjectName(Object)),12,myscreenpos.x,myscreenpos.y+30,0xffffffff)
			--add any other info you wish here ... but don't forget myscreenpos.y+XX
			end
		end
	end
end



OnDraw(function(myHero)  -- in here we get all needed info for our champ
origin = GetOrigin(myHero)
myscreenpos = WorldToScreen(1,origin.x,origin.y,origin.z)
if myscreenpos.flag then
	DrawText(string.format("ChampName  = %s", GetObjectName(myHero)),12,myscreenpos.x,myscreenpos.y,0xffffffff)
	DrawText(string.format("NetworkID     = 0x%X", GetNetworkID(myHero)),12,myscreenpos.x,myscreenpos.y+10,0xffffffff)
	DrawText(string.format("Q________   = %s", GetCastName(myHero,_Q)),12,myscreenpos.x,myscreenpos.y+20,0xffffffff)
	DrawText(string.format("W________  = %s", GetCastName(myHero,_W)),12,myscreenpos.x,myscreenpos.y+30,0xffffffff)
	DrawText(string.format("E________    = %s", GetCastName(myHero,_E)),12,myscreenpos.x,myscreenpos.y+40,0xffffffff)
	DrawText(string.format("R________    = %s", GetCastName(myHero,_R)),12,myscreenpos.x,myscreenpos.y+50,0xffffffff)
	DrawText(string.format("SUMONER_1  = %s", GetCastName(myHero,SUMMONER_1)),12,myscreenpos.x,myscreenpos.y+60,0xffffffff)
	DrawText(string.format("SUMONER_2  = %s", GetCastName(myHero,SUMMONER_2)),12,myscreenpos.x,myscreenpos.y+70,0xffffffff)
	local yadder = 0
	for i = 0,63 do
		if GetBuffCount(myHero,i) > 0 then
			currbufname = GetBuffName(myHero,i)
			currbufcount = GetBuffCount(myHero,i)
			yadder = yadder + 10;
			DrawText(string.format("Buffstacks: %d for %s", currbufcount,currbufname),12,myscreenpos.x,myscreenpos.y+80+yadder,0xff00ff00)
			end
		end
	end
end)


OnProcessSpell(function(Object,spellProc)
local Obj_Type = GetObjectType(Object)
if Obj_Type == Obj_AI_Hero then --check only champions?
	PrintChat(string.format("'%s' casts '%s'; Windup: %.3f Animation: %.3f", GetObjectName(Object), spellProc.name, spellProc.windUpTime, spellProc.animationTime))
	end
end)
