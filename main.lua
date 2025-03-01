-- Register the mod, which grants the ability to add code that correspond to in-game events (i.e. "callbacks").
local mod = RegisterMod("its_going_down_now_rpp", 1)

-- Each table provides a list of tracks that are randomly selected from,
-- so to provide multiple tracks we have to create multiple packs.
local musicPackA = "It's Going Down Now"
local musicDataA = {
    "itsgoingdownnow"
}
local musicCharDataA = {
    [PlayerType.PLAYER_CAIN_B] = {"itsgoingdownnow-slow"}
}

local musicPackB = "It's Going Down Now (Drop Ver.)"
local musicDataB = {
    "itsgoingdownnow-drop"
}
local musicCharDataB = {
    [PlayerType.PLAYER_CAIN_B] = {"itsgoingdownnow-drop-slow"}
}

-- Add a given music pack to every quality
---@param musicChars table A table of music names specific to each character
---@param packName string A readable name for the music pack
---@param musicDefault table A table of music names to use for the default character
local function addMusicPackToAll(musicChars, packName, musicDefault)
    ReactionPack.AddTraumaMusicPack(musicChars, packName, musicDefault)
    ReactionPack.AddUghMusicPack(musicChars, packName, musicDefault)
    ReactionPack.AddNeutralMusicPack(musicChars, packName, musicDefault)
    ReactionPack.AddPogMusicPack(musicChars, packName, musicDefault)
    ReactionPack.AddDanceMusicPack(musicChars, packName, musicDefault)
end

local function registerReactions()
    addMusicPackToAll(musicCharDataA, musicPackA, musicDataA)
    addMusicPackToAll(musicCharDataB, musicPackB, musicDataB)
end

-- Register the reaction pack
-- This only needs to be in a function if the mod is before Reaction Port Pack alphabetically,
-- but it doesn't hurt to use it every time just for convenience.
local hasRegisteredReactions = false
local function onPostGameStarted()
    if hasRegisteredReactions then
        return
    end
    
    registerReactions()

    hasRegisteredReactions = true
end
    
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, onPostGameStarted)