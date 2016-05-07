PrefabFiles = {
	"kan",
	"kan_none",
	"kanlight",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/kan.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/kan.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/kan.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/kan.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/kan_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/kan_silho.xml" ),

    Asset( "IMAGE", "bigportraits/kan.tex" ),
    Asset( "ATLAS", "bigportraits/kan.xml" ),
	
	Asset( "IMAGE", "images/map_icons/kan.tex" ),
	Asset( "ATLAS", "images/map_icons/kan.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_kan.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_kan.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_kan.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_kan.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_kan.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_kan.xml" ),
	
	Asset( "IMAGE", "images/names_kan.tex" ),
    Asset( "ATLAS", "images/names_kan.xml" ),
	
    Asset( "IMAGE", "bigportraits/kan_none.tex" ),
    Asset( "ATLAS", "bigportraits/kan_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.kan = "The Rainbow Drinker"
STRINGS.CHARACTER_NAMES.kan = "Kanaya"
STRINGS.CHARACTER_DESCRIPTIONS.kan = "Glows at night"
STRINGS.CHARACTER_QUOTES.kan = "\"I Suddenly Dont Understand Anything\""

-- Custom speech strings
STRINGS.CHARACTERS.KAN = require "speech_kan"

-- The character's name as appears in-game 
STRINGS.NAMES.KAN = "Kanaya"

AddMinimapAtlas("images/map_icons/kan.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("kan", "FEMALE")

