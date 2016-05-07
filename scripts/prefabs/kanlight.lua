local function fn()    
local inst = CreateEntity()    
 
inst.entity:AddNetwork()
inst.entity:AddTransform(0.25)
inst:AddTag("FX")

inst.entity:AddLight() -- adds light to the entity   
inst.Light:SetRadius(6)
inst.Light:SetFalloff(0.5) -- precentage of radius after which light will start fading
inst.Light:SetIntensity(.3)    
inst.Light:SetColour(245/255, 255/255, 245/255) -- colors in RGB    
inst.Light:Enable(true)
    

if not TheWorld.ismastersim then        
	return inst    
end

inst.entity:SetPristine()    
    
inst.persists = false    

return inst

end

return Prefab("common/fx/kanlight", fn)