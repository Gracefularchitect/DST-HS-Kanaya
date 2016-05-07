
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "kan_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "kan_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- On Nighttime Call.
local function updatekanlight(inst)
	if TheWorld.state.isnight and not inst.light then
        inst.light = SpawnPrefab("kanlight") -- spawns light entity
		
		local follower = inst.light.entity:AddFollower()        
		follower:FollowSymbol(inst.GUID, "swap_body", 0, 0, 0) -- makes it follow your character's center of body
    elseif not TheWorld.state.isday and inst.light then
        inst.light:Remove() -- remove light entity if not night        
		inst.light = nil    
		end
    end

--[[ On Nighttime Call.
local function OnIsNight(inst)
    inst:DoTaskInTime(2 + math.random(), updatelight)
end
]]--

--[[ On Nighttime and no light.
local function updatelight(inst)
    if TheWorld.state.isnight and not inst.components.playerprox:IsPlayerClose() and inst.components.inventoryitem.owner == nil then
        fadein(inst)
    else
        fadeout(inst)
    end
end
]]--

--[[inst:ListenForEvent("healthdelta", function(inst, data) -- this event is triggered everytime your characters loses/gains health    
	local threshold = <whatever you want>    
		if data.newpercent <= threshold and not inst.light then        
			inst.light = SpawnPrefab("kanlight") -- spawns light entity
			local follower = inst.light.entity:AddFollower()        
			follower:FollowSymbol(inst.GUID, "swap_body", 0, 0, 0) -- makes it follow your character's center of body
	
	elseif data.newpercent > threshold and inst.light 
		then        inst.light:Remove() -- remove light entity if life is above threshold        
		inst.light = nil    
		end
	end)
]]--
	
	
-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "kan.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
	--[[Adds Light
	inst.entity:AddLight()
    inst.Light:SetRadius(6)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(0.3)
    inst.Light:SetColour(245/255,255/255,245/255)
	inst:WatchWorldState("isnight", inst.Light:Enable(true))
	inst:WatchWorldState("isday", inst.Light:Enable(false))]]--
	
	inst:WatchWorldState("isnight", updatekanlight)
		
end



return MakePlayerCharacter("kan", prefabs, assets, common_postinit, master_postinit, start_inv)
