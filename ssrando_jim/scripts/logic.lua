function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

function has_acc(item)
  local c = Tracker:ProviderCountForCode(item)
  if (c > 0) then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function and_accessibility(...)
  local level = AccessibilityLevel.Normal
  for _, data in ipairs({...}) do
    if data == AccessibilityLevel.None then
      return AccessibilityLevel.None
    elseif data == AccessibilityLevel.SequenceBreak then
      level = AccessibilityLevel.SequenceBreak
    end
  end
  return level
end

function or_accessibility(...)
  local level = AccessibilityLevel.None
  for _, data in ipairs({...}) do
    if data == AccessibilityLevel.Normal then
      return AccessibilityLevel.Normal
    elseif level == AccessibilityLevel.None and data == AccessibilityLevel.SequenceBreak then
      level = AccessibilityLevel.SequenceBreak
    end
  end
  return level
end

-- item functions to make file cleaner/more readable

function bomb()
  return has("bombs")
end

function bow()
  return has("bow")
end

function sling()
  return has("sling")
end

function btl()
  return has("beetle")
end

function hook()
  return has("hook")
end

function gust()
  return has("bellows")
end

function whip()
  return has("whip")
end

function wds()
  return has("wds")
end

function cs()
  return has("cs")
end

function dig()
  return has("mitts")
end

function harp()
  return has("harp")
end

function sword()
  return has("ps")
end

function goddess()
  return has("gs")
end

function tms()
  return has("ts")
end

function hero()
  return has("op_hero")
end

function ranged()
  return (sling() or cs() or btl() or bow() or bomb())
end

function soth() -- song of the hero
  return ((has("sohf") and has("sohe") and has("sohl")) or has("soh",3))
end

function bottle() -- can use bottles
  return (has("adventure") and has("bottle"))
end

function walls() -- goddess walls
  return (skyview2_acc() and has("bog") and harp() and (sword() or bomb()))
end

function notrace()
  return (not has("op_race"))
end

function strike() -- fully upgraded skyward strike
  return ((goddess() and hero()) or tms())
end

-- enemy macros

function bokoblin()
  return (sword() or bow() or bomb())
end

function moblin()
  return (sword() or bow() or bomb())
end

function keese()
  return (sword() or ranged() or whip())
end

function lizalfos()
  return (sword() or bomb())
end

function ampilus()
  return (sword() or bow() or bomb())
end

function molderach()
  -- return (gust() and sword())
  if (sword()) then
    if (gust()) then
      return true
    else
      return true, AccessibilityLevel.SequenceBreak
    end
  else
    return false
  end
end

function armos()
  return (gust() and sword())
end

function beamos()
  return (sword() or bow())
end

function koloktos()
  return (whip() and (sword() or bomb() or bow()))
end

-- area macros

function thunderhead() -- open/closed thunderhead
  if has("op_cth") then
    if has("bog") then
      return true
    elseif has("t_bit") then -- RBM 2x20
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return true
  end
end

function sealedtemple()
  return has("emerald")
end

function faron()
  return (sealedtemple() and (cs() or sword() or bomb()))
end

function deepwoods()
  -- return (faron() and ranged())
  if (faron()) then
    if (ranged()) then
      return true
    elseif (goddess() and has("t_trickshot")) then -- bokobait strike
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function deepwoods_acc()
  -- return (faron() and ranged())
  if (faron()) then
    if (ranged()) then
      return AccessibilityLevel.Normal
    elseif (goddess() and has("t_trickshot")) then -- bokobait strike
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function floria()
  --return (faron() and wds() and yerbal() and goddess()) (original)
  if (faron()) then
    if (wds() and yerbal() and goddess()) then
      return true
    elseif (sword() and has("t_elf")) then -- floria fence hop
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function floria_acc()
  --return (faron() and wds() and yerbal() and goddess()) (original)
  if (faron()) then
    if (wds() and yerbal() and goddess()) then
      return AccessibilityLevel.Normal
    elseif (sword() and has("t_elf")) then -- floria fence hop
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function eldin1()
  return has("ruby")
end

function eldin2()
  -- return (eldin1() and (bomb() or hook() or dig()))
  if (eldin1()) then
    if (bomb() or hook() or dig()) then
      return true
    elseif (has("t_bit")) then -- RBM 6x08
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function eldin2_acc()
  -- return (eldin1() and (bomb() or hook() or dig()))
  if (eldin1()) then
    if (bomb() or hook() or dig()) then
      return AccessibilityLevel.Normal
    elseif (has("t_bit")) then -- RBM 6x08
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function volcano()
  return (eldin2() and has("fse"))
end

function volcano_acc()
  return and_accessibility(eldin2(), has_acc("fse"))
end

function lanayru1()
  return has("amber")
end

function lanayru2()
  -- return (lanayru1() and (cs() or hook())) original
  if (lanayru1() and (cs() or hook())) then
    return true
  elseif (lanayru1() and (has("t_brakeslide") or has("t_bit"))) then -- desert brakeslide or UA BiTWarp
    return true, AccessibilityLevel.SequenceBreak
  else
    return false
  end
end

function lanayru2_acc()
  if (lanayru1() and (cs() or hook())) then
    return AccessibilityLevel.Normal
  elseif (lanayru1() and (has("t_brakeslide") or has("t_bit"))) then -- desert brakeslide or UA BiTWarp
    return AccessibilityLevel.SequenceBreak
  else
    return AccessibilityLevel.None
  end
end

function sea()
  return (lanayru1() and cs() and has("cavessk"))
end

-- dungeon macros

function skyview_high() -- entrance of skyview
  return ranged()
end

function skyview_left() -- map chest in skyview
  return (skyview_high() or goddess() or whip())
end

function skyview_first() -- first room of skyview
  return ((sword() and (skyview_high() or wds())) or bomb())
end

function earth_bridge() -- drawbridge in earth
  -- return (bow() or (btl() and (lizalfos() or sling() or cs())))
  if (bow() or (btl() and (lizalfos() or sling() or cs()))) then
    return true
  elseif (((goddess() and hero()) or tms()) and has("t_trickshot")) then -- keese yeet
    return true, AccessibilityLevel.SequenceBreak
  else
    return false
  end
end

function mine_crystal() -- crystal in map room
  return (goddess() or whip() or sling() or bow())
end

function cistern_statue() -- lower statue
  if (whip() and (cs() or (wds() and (bow() or btl()) and has("cisternsk",2)))) then
    return true
  elseif (whip() and (wds() and (bow() or btl()) and has("cisternsk",1))) then
    return true, AccessibilityLevel.SequenceBreak
  elseif (wds() and sword() and has("t_cc")) then -- cistern clip
    return true, AccessibilityLevel.SequenceBreak
  else 
    return false
  end
end

function sanc_pods() -- water pods in fire sanc
  return ranged()
end

-- dungeon beatable macros

function skyview()
  -- return (skyview_acc() and goddess() and has("skyviewsk",2) and has("skyviewbk")
  --   and (hero() or hook() or bow() or tms()))
  if (skyview_acc() and goddess() and has ("skyviewbk")
      and (hero() or hook() or bow() or tms())) then
    if (has("skyviewsk",2)) then
      return true
    else -- UA BiTWarp
      return true, AccessibilityLevel.SequenceBreak
    end
  else
    return false
  end
end

function skyviewb_acc()
  if (skyview_acc() and goddess() and has ("skyviewbk")
      and (hero() or hook() or bow() or tms())) then
    if (has("skyviewsk",2)) then
      return AccessibilityLevel.Normal
    else -- UA BiTWarp
      return AccessibilityLevel.SequenceBreak
    end
  else
    return AccessibilityLevel.None
  end
end

function skyview2()
  return (skyview2_acc() and skyview())
end

function earth()
  return (earth_acc() and bomb() and (hook() or (btl() and mitts()))
    and has("earthbk") and goddess())
end

function mine()
  return (mine_acc() and hook() and gust() and has("minebk")
    and sword() and mine_crystal())
end

function cistern()
  return (cistern_acc() and whip() and (has("cisternsk",2) or cs())
    and has("cisternbk") and goddess())
end

function sandship()
  return (sandship_acc() and bow() and has("sandshipbk") and goddess())
end

function sanc()
  return (sanc_acc() and hook() and has("mogma") and has("sancsk",3)
    and has("sancbk") and goddess())
end

function skykeep()
  return (skykeep_acc() and cs() and bow() and gust() and whip()
    and has("skykeepsk") and sword())
end

-- story/npc macros

function beedle()
  return ranged()
end

function yerbal()
  return (faron() and (sling() or btl()) and ((gust() and wds()) or cs()))
end

function skyview2_acc()
  return (skyview_acc() and wds())
end

function sacredwater()
  return (skyview2() and bottle())
end

function gate()
  return (harp() and sealedtemple())
end

function past()
  return (has("ms") and sealedtemple() and harp()
    and not (has("sv_r") and not has("skyview"))
    and not (has("et_r") and not has("earth"))
    and not (has("lmf_r") and not has("mine"))
    and not (has("ac_r") and not has("cistern"))
    and not (has("ss_r") and not has("sandship"))
    and not (has("fs_r") and not has("sanc")))
end

function levias()
  return past()
end

function wheel()
  return (lanayru1() and bomb())
end

function floodedfaron() -- unused
  return (levias() and wds())
end

function bokobase() -- unused
  return levias()
end

function gorge() -- unused
  return (lanayru1() and levias() and cs())
end

function thunder() -- unused
  return (gorge() and cs() and hook() and whip() and beamos())
end

function demise()
  return (past() and (not has("sk_r") or has("tri",3)))
end

--goddess cubes macros

function cube_initial() -- initial cube
  -- return (deepwoods() and goddess())
  if (goddess()) then
    if (deepwoods_acc() ~= AccessibilityLevel.None) then
      return true, deepwoods_acc()
    else
      return false
    end
  else
    return false
  end
end

function cube_wgt() --west great tree
  -- return (faron() and (cs() or (gust() and wds())) and goddess())
  if (faron() and goddess()) then
    if (cs() or (gust() and wds())) then
      return true
    elseif (has("t_trickshot")) then -- bokobait strike
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function cube_egtr() --east great tree rope
  return (faron() and (cs() or (gust() and wds())) and goddess())
end

function cube_egtcs() --east great tree claw
  -- return (faron() and (cs() or (gust() and wds())) and goddess())
  if (faron() and goddess()) then
    if (cs() or (gust() and wds())) then
      return true
    elseif (has("t_trickshot")) then -- bokobait strike
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function cube_dw() -- deepwoods
  -- return (deepwoods() and goddess())
  if (goddess()) then
    if (deepwoods_acc() ~= AccessibilityLevel.None) then
      return true, deepwoods_acc()
    else
      return false
    end
  else
    return false
  end
end

function cube_sv() --skyview
  -- return (deepwoods() and cs() and goddess())
  if (goddess() and cs()) then
    if (deepwoods_acc() ~= AccessibilityLevel.None) then
      return true, deepwoods_acc()
    else
      return false
    end
  else
    return false
  end
end

function cube_svs() --skyview spring
  -- return (skyview() and goddess())
  if (goddess()) then
    if (skyviewb_acc() ~= AccessibilityLevel.None) then
      return true, skyviewb_acc()
    else
      return false
    end
  else
    return false
  end
end

function cube_fl() --floria
  local acc = and_accessibility(floria_acc(), has_acc("wds"), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_fw() --floria waterfall
  local acc = and_accessibility(floria_acc(), has_acc("cs"), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_ee() --eldin entrance
  return (eldin1() and goddess())
end

function cube_mte() --mogma turf entrance
  return (eldin1() and goddess())
end

function cube_mt() --mogma turf
  return (eldin1() and goddess())
end

function cube_etw() --west of et
  local acc = and_accessibility(eldin2_acc(), has_acc("mitts"), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_ete() --east of et
  local acc = and_accessibility(eldin2_acc(), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_es() --eldin slide
  local acc = and_accessibility(eldin2_acc(), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_vs() --volcano summit
  local acc = and_accessibility(volcano_acc(), or_accessibility(and_accessibility(has_acc("gs"), has_acc("op_hero")), has_acc("tms")))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_sw() --summit waterfall
  local acc = and_accessibility(volcano_acc(), has_acc("gs"))
  if (acc ~= AccessibilityLevel.None) then
    return true, acc
  else
    return false
  end
end

function cube_fse() --sanc entrance
  -- return (volcano() and bottle() and cs() and goddess())
  local acc = volcano_acc()
  if (acc ~= AccessibilityLevel.None) then
    if (bottle() and cs() and goddess()) then
      return true
    elseif (gust() and cs() and goddess() and has("t_bit")) then -- RBMs Dx04 and Dx08
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function cube_lme() --mine entrance
  return (lanayru1() and goddess())
end

function cube_so() --sand oasis
  -- return (lanayru2() and goddess())
  if (goddess()) then
    local acc = lanayru2_acc()
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    return false
  end
end

function cube_tot() --ride in tot
  -- return (lanayru2() and hook() and goddess())
  if (hook() and goddess()) then
    local acc = lanayru2_acc()
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    return false
  end
end

function cube_sp() --desert secret passageway
  if (bomb() and cs() and goddess()) then
    local acc = lanayru2_acc()
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    return false
  end
end

function cube_hbf() --hook beetle fight
  -- return (lanayru1() and (cs() or bomb() or hook()) and
  --   ((goddess() and (hero() or cs())) or tms()))
  if (lanayru1() and ((goddess() and (hero() or cs())) or tms())) then
    if (cs() or bomb() or hook()) then
      return true
    elseif (has("t_brakeslide")) then -- desert brakeslides
      return true, AccessibilityLevel.SequenceBreak
    else
      return false
    end
  else
    return false
  end
end

function cube_ah() --ancient harbour
  return (sea() and goddess())
end

function cube_sr() --skipper's retreat
  return (sea() and (bomb() or hook() or whip()) and goddess())
end

function cube_ps() --pirate stronghold
  return (sea() and gust() and goddess())
end

function cube_lg() --gorge, unused
  return (gorge() and cs() and whip() and hook() and goddess())
end

-- dungeon entrance rando
function skyview_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("sv_dw")),
      and_accessibility(dungeon_ev(), has_acc("sv_ev")),
      and_accessibility(dungeon_ld(), has_acc("sv_ld")),
      and_accessibility(dungeon_lf(), has_acc("sv_lf")),
      and_accessibility(dungeon_ss(), has_acc("sv_ss")),
      and_accessibility(dungeon_vs(), has_acc("sv_vs")),
      and_accessibility(dungeon_sl(), has_acc("sv_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_dw() ~= AccessibilityLevel.None) then
      return true, dungeon_dw()
    else
      return false
    end
  end
end

function earth_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("et_dw")),
      and_accessibility(dungeon_ev(), has_acc("et_ev")),
      and_accessibility(dungeon_ld(), has_acc("et_ld")),
      and_accessibility(dungeon_lf(), has_acc("et_lf")),
      and_accessibility(dungeon_ss(), has_acc("et_ss")),
      and_accessibility(dungeon_vs(), has_acc("et_vs")),
      and_accessibility(dungeon_sl(), has_acc("et_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_ev() ~= AccessibilityLevel.None) then
      return true, dungeon_ev()
    else
      return false
    end
  end
end

function mine_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("lmf_dw")),
      and_accessibility(dungeon_ev(), has_acc("lmf_ev")),
      and_accessibility(dungeon_ld(), has_acc("lmf_ld")),
      and_accessibility(dungeon_lf(), has_acc("lmf_lf")),
      and_accessibility(dungeon_ss(), has_acc("lmf_ss")),
      and_accessibility(dungeon_vs(), has_acc("lmf_vs")),
      and_accessibility(dungeon_sl(), has_acc("lmf_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_ld() ~= AccessibilityLevel.None) then
      return true, dungeon_ld()
    else
      return false
    end
  end
end

function cistern_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("ac_dw")),
      and_accessibility(dungeon_ev(), has_acc("ac_ev")),
      and_accessibility(dungeon_ld(), has_acc("ac_ld")),
      and_accessibility(dungeon_lf(), has_acc("ac_lf")),
      and_accessibility(dungeon_ss(), has_acc("ac_ss")),
      and_accessibility(dungeon_vs(), has_acc("ac_vs")),
      and_accessibility(dungeon_sl(), has_acc("ac_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_lf() ~= AccessibilityLevel.None) then
      return true, dungeon_lf()
    else
      return false
    end
  end
end

function sandship_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("ss_dw")),
      and_accessibility(dungeon_ev(), has_acc("ss_ev")),
      and_accessibility(dungeon_ld(), has_acc("ss_ld")),
      and_accessibility(dungeon_lf(), has_acc("ss_lf")),
      and_accessibility(dungeon_ss(), has_acc("ss_ss")),
      and_accessibility(dungeon_vs(), has_acc("ss_vs")),
      and_accessibility(dungeon_sl(), has_acc("ss_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_ss() ~= AccessibilityLevel.None) then
      return true, dungeon_ss()
    else
      return false
    end
  end
end

function sanc_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("fs_dw")),
      and_accessibility(dungeon_ev(), has_acc("fs_ev")),
      and_accessibility(dungeon_ld(), has_acc("fs_ld")),
      and_accessibility(dungeon_lf(), has_acc("fs_lf")),
      and_accessibility(dungeon_ss(), has_acc("fs_ss")),
      and_accessibility(dungeon_vs(), has_acc("fs_vs")),
      and_accessibility(dungeon_sl(), has_acc("fs_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_vs() ~= AccessibilityLevel.None) then
      return true, dungeon_vs()
    else
      return false
    end
  end
end

function skykeep_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    local acc = (or_accessibility(
      and_accessibility(dungeon_dw(), has_acc("sk_dw")),
      and_accessibility(dungeon_ev(), has_acc("sk_ev")),
      and_accessibility(dungeon_ld(), has_acc("sk_ld")),
      and_accessibility(dungeon_lf(), has_acc("sk_lf")),
      and_accessibility(dungeon_ss(), has_acc("sk_ss")),
      and_accessibility(dungeon_vs(), has_acc("sk_vs")),
      and_accessibility(dungeon_sl(), has_acc("sk_sl"))))
    if (acc ~= AccessibilityLevel.None) then
      return true, acc
    else
      return false
    end
  else
    if (dungeon_sl() ~= AccessibilityLevel.None) then
      return true, dungeon_sl()
    else
      return false
    end
  end
end

function dungeon_dw() -- dungeon entrance in deep woods
  if (deepwoods_acc() ~= AccessibilityLevel.None) then
    return deepwoods_acc()
  else
    return AccessibilityLevel.None
  end
end

function dungeon_ev() -- dungeon entrance in eldin volcano
  -- return (eldin2() and has("kp",5))
  if (eldin2()) then
    if (has("kp",5)) then
      return AccessibilityLevel.Normal
    elseif (has("t_bit")) then -- RBM 5x02
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function dungeon_ld() -- dungeon entrance in lanayru desert
  if (lanayru1() and bomb() and hook() and sword()) then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function dungeon_lf() -- dungeon entrance in lake floria
  return and_accessibility(floria_acc(), has_acc("wds"))
end

function dungeon_ss() -- dungeon entrance in sand sea
  -- return (sea() and has("chart") and sword())
  if (sea()) then
    if (has("chart") and sword()) then
      return AccessibilityLevel.Normal
    elseif (has("t_bit")) then -- RBM Cx40
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function dungeon_vs() -- dungeon entrance in volcano summit
  -- return (volcano() and bottle() and cs())
  if (volcano()) then
    if (bottle() and cs()) then
      return AccessibilityLevel.Normal
    elseif ((bottle() or gust()) and has("t_bit")) then -- RBMs Dx04 and Dx08
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end

function dungeon_sl() -- dungeon entrance in skyloft
  -- return (has("trials") and cs())
  if (has("trials")) then
    if (cs()) then
      return AccessibilityLevel.Normal
    elseif has("t_bit") then -- Reverse BiTWarp
      return AccessibilityLevel.SequenceBreak
    else
      return AccessibilityLevel.None
    end
  else
    return AccessibilityLevel.None
  end
end