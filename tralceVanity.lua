tralceVanity = {
  name = "tralceVanity",

  collectibles = {
    -- Costumes --
    [ 286] = "Cost_GrahtClimbersActiveWear",
    [ 287] = "Cost_DoeskinChamoisWoodsWear",
    [ 753] = "Cost_NordicBathersTowel",
    [1419] = "Cost_EggSisterBiasCutCasualWear",
    [1421] = "Cost_LizardlyFourFabricSkirtSet",
    [8043] = "Cost_TimbercrowWanderer",
    [8044] = "Cost_DarkPassionsRegalia",
    -- Mounts --
    [1174] = "Mount_EbonDwarvenWolf",
    [1185] = "Mount_DwemerSpider",
    [8530] = "Mount_BloodrootWildHuntSenche",
    [9370] = "Mount_NebulousStarBornSteed",
    -- Multi-Rider Mounts --
    [ 4713] = "MR_Senche1",
    [ 6972] = "MR_Spider1",
    [ 8379] = "MR_Spider3",
    [ 8512] = "MR_Spider2",
    [ 9576] = "MR_Horse1",
    [10254] = "MR_Horse5",
    [10384] = "MR_Horse4",
    [10586] = "MR_Horse3",
    [10708] = "MR_Horse2",
    -- Personalities --
    [ 368] = "Pers_Drunk",
    [ 604] = "Pers_Commander",
    [ 773] = "Pers_Jester",
    [ 774] = "Pers_DeadlandsFirewalker",
    [1192] = "Pers_BrassyAssassin",
    [5884] = "Pers_TreasureHunter",
    [6927] = "Pers_Swashbuckler",
    [8080] = "Pers_Minstrel",
    -- Pets --
    [1232] = "Pet_DwarvenTheodolite",
    [8551] = "Pet_DwarvenScarab",
    -- Polymorphs --
    [  34] = "Poly_Skeleton",
    [ 167] = "Poly_ScarecrowSpectre",
    [ 168] = "Poly_PumpkinSpectre",
    [ 176] = "Poly_Werewolf",
    [ 387] = "Poly_CadaverousAssassin",
    [1388] = "Poly_WraithCrow",
    [1480] = "Poly_Factotum",
    [9239] = "Poly_IronAtronach",
    -- Skins --
    [5725] = "Skin_Crystalfrost",
    [5914] = "Skin_MeridianPurified",
    [5916] = "Skin_ArcticRime",
    [6272] = "Skin_SunspireIceFire",
    [7231] = "Skin_MireheartScale",
    [8065] = "Skin_ReanimatedVampiricThrall",
    [8125] = "Skin_SlagTownDiver",
    [8469] = "Skin_DeadlandsScorcher",
    [8841] = "Skin_VarlaBorn",
    [8905] = "Skin_HistTsoko",
    [9405] = "Skin_AstralSheen",
    [9814] = "Skin_ImpishEpidermis",
    -- Other --
    [5002] = "Etc_HideYourHelm"
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

function tralceVanity.NotifyAndUseCollectible(collectibleID)
  local collectibleName = GetCollectibleInfo(collectibleID)
  df("|cff0055Equipping " .. collectibleName .. "...")
  UseCollectible(collectibleID)
end

EVENT_MANAGER:RegisterForEvent(tralceVanity.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

