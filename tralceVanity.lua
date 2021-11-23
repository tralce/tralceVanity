tralceVanity = {
  name = "tralceVanity",

  collectibles = {
    -- Mounts --
    [1174] = "MOUNT_EBONWOLF",
    [1185] = "MOUNT_DWEMERSPIDER",
    -- Pets --
    [1232] = "PET_THEODOLYTE",
    [8551] = "PET_DWEMER_SCARAB",
    -- Polymorphs --
    [  34] = "POLY_SKELETON",
    [ 167] = "POLY_SCARECROW",
    [ 168] = "POLY_PUMPKIN",
    [ 176] = "POLY_WEREWOLF",
    [ 387] = "POLY_CADAVASSASSIN",
    [1388] = "POLY_WRAITHCROW",
    [1480] = "POLY_FACTOTUM",
    [9239] = "POLY_IRONATRO",
    -- Other --
    [5002] = "OTHER_HIDEHELM"
  }
}

-- Force multi-key bindings. Shamelessly stolen from EssentialHousingTools.
if not KEYBINDING_MANAGER.IsChordingAlwaysEnabled or not KEYBINDING_MANAGER:IsChordingAlwaysEnabled() then
  function KEYBINDING_MANAGER:IsChordingAlwaysEnabled()
    return true
  end
end

local function OnAddOnLoaded( eventCode, addonName )
  if (addonName ~= tralceVanity.name) then return end

  EVENT_MANAGER:UnregisterForEvent(tralceVanity.name, EVENT_ADD_ON_LOADED)

  for id, code in pairs(tralceVanity.collectibles) do
    local name, _, _, _, unlocked = GetCollectibleInfo(id)
    if (unlocked) then
      ZO_CreateStringId("SI_BINDING_NAME_" .. code, zo_strformat(SI_COLLECTIBLE_NAME_FORMATTER, name))
    end
  end
end

EVENT_MANAGER:RegisterForEvent(tralceVanity.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

