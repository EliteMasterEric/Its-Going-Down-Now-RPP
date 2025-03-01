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

local function registerReactions()
    ReactionPack.AddDanceMusicPack(musicCharDataA, musicPackA, musicDataA)
    ReactionPack.AddDanceMusicPack(musicCharDataB, musicPackB, musicDataB)
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