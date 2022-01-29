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

EVENT_MANAGER:RegisterForEvent(tralceVanity.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

