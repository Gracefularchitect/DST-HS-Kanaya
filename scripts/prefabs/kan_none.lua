local assets =
{
	Asset( "ANIM", "anim/kan.zip" ),
	Asset( "ANIM", "anim/ghost_kan_build.zip" ),
}

local skins =
{
	normal_skin = "kan",
	ghost_skin = "ghost_kan_build",
}

local base_prefab = "kan"

local tags = {"KAN", "CHARACTER"}

return CreatePrefabSkin("kan_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})