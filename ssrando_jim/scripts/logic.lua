function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count >= amount
  end
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
  return (gust() and sword())
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
  if has("op_thc") then
    return has("bog")
  else
    return 1
  end
end

function sealedtemple()
  return has("emerald")
end

function faron()
  return (sealedtemple() and (cs() or sword() or bomb()))
end

function deepwoods()
  return (faron() and ranged())
end

function floria()
  return (faron() and wds() and yerbal())
end

function eldin1()
  return has("ruby")
end

function eldin2()
  return (eldin1() and (bomb() or hook() or dig()))
end

function volcano()
  return (eldin2() and has("fse"))
end

function lanayru1()
  return has("amber")
end

function lanayru2()
  return (lanayru1() and (cs() or hook()))
end

function sea()
  return (lanayru1() and cs() and has("cavessk"))
end

-- dungeon macros

function skyview_high() -- entrance of skyview
  return ranged()
end

function skyview_left() -- digspot in skyview
  return (skyview_high() or goddess() or wds())
end

function skyview_first() -- first room of skyview
  return ((sword() and (skyview_high() or wds())) or bomb())
end

function earth_bridge() -- drawbridge in earth
  return (bow() or (btl() and (lizalfos() or sling() or cs())))
end

function mine_crystal() -- crystal in map room
  return (goddess() or whip() or sling() or bow())
end

function cistern_statue() -- lower statue
  if (whip() and (cs() or (wds() and (bow() or btl()) and has("cisternsk",2)))) then
    return true
  elseif (whip() and (wds() and (bow() or btl()) and has("cisternsk",1))) then
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
  return (skyview_acc() and goddess() and has("skyviewsk",2) and has("skyviewbk"))
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

function batreaux()
  return true
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
  return (has("ms") and sealedtemple()
    and (has("sv_r") or has("et_r") or has("lmf_r")
      or has("ac_r") or has("ss_r") or has("fs_r"))
    and not (has("sv_r") and not has("skyview"))
    and not (has("et_r") and not has("earth"))
    and not (has("lmf_r") and not has("mine"))
    and not (has("ac_r") and not has("cistern"))
    and not (has("ss_r") and not has("skyship"))
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
  return (gorge() and bomb() and cs() and hook() and whip())
end

function demise()
  return (past() and has("tri",3))
end

--goddess cubes macros

function cube_initial() -- initial cube
  return (deepwoods() and goddess())
end

function cube_wgt() --west great tree
  return (faron() and (cs() or (gust() and wds())) and goddess())
end

function cube_egtr() --east great tree rope
  return (faron() and (cs() or (gust() and wds())) and goddess())
end

function cube_egtcs() --east great tree claw
  return (faron() and (cs() or (gust() and wds())) and goddess())
end

function cube_dw() -- deepwoods
  return (deepwoods() and goddess())
end

function cube_sv() --skyview
  return (deepwoods() and cs() and goddess())
end

function cube_svs() --skyview spring
  return (skyview() and goddess())
end

function cube_fl() --floria
  return (floria() and goddess())
end

function cube_fw() --floria waterfall
  return (floria() and cs() and goddess())
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
  return (eldin2() and dig() and goddess())
end

function cube_ete() --east of et
  return (eldin2() and goddess())
end

function cube_es() --eldin slide
  return (eldin2() and goddess())
end

function cube_vs() --volcano summit
  return (volcano() and goddess())
end

function cube_sw() --summit waterfall
  return (volcano() and goddess())
end

function cube_fse() --sanc entrance
  return (volcano() and bottle() and cs()) and goddess()
end

function cube_lme() --mine entrance
  return (lanayru1() and goddess())
end

function cube_so() --sand oasis
  return (lanayru2() and goddess())
end

function cube_tot() --ride in tot
  return (lanayru2() and hook() and goddess())
end

function cube_sp() --desert secret passageway
  return (lanayru2() and bomb() and cs()) and goddess()
end

function cube_hbf() --hook beetle flight
  return (lanayru1() and (cs() or bomb() or hook()) and goddess())
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


--framework for dungeon rando
function skyview_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("sv_dw")) or (dungeon_ev() and has("sv_ev"))
      or (dungeon_ld() and has("sv_ld")) or (dungeon_lf() and has("sv_lf"))
      or (dungeon_ss() and has("sv_ss")) or (dungeon_vs() and has("sv_vs"))
      or (dungeon_sl() and has("sv_sl")))
  else
    return dungeon_dw()
  end
end

function earth_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("et_dw")) or (dungeon_ev() and has("et_ev"))
      or (dungeon_ld() and has("et_ld")) or (dungeon_lf() and has("et_lf"))
      or (dungeon_ss() and has("et_ss")) or (dungeon_vs() and has("et_vs"))
      or (dungeon_sl() and has("et_sl")))
  else
    return dungeon_ev()
  end
end

function mine_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("lmf_dw")) or (dungeon_ev() and has("lmf_ev"))
      or (dungeon_ld() and has("lmf_ld")) or (dungeon_lf() and has("lmf_lf"))
      or (dungeon_ss() and has("lmf_ss")) or (dungeon_vs() and has("lmf_vs"))
      or (dungeon_sl() and has("lmf_sl")))
  else
    return dungeon_ld()
  end
end

function cistern_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("ac_dw")) or (dungeon_ev() and has("ac_ev"))
      or (dungeon_ld() and has("ac_ld")) or (dungeon_lf() and has("ac_lf"))
      or (dungeon_ss() and has("ac_ss")) or (dungeon_vs() and has("ac_vs"))
      or (dungeon_sl() and has("ac_sl")))
  else
    return dungeon_lf()
  end
end

function sandship_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("ss_dw")) or (dungeon_ev() and has("ss_ev"))
      or (dungeon_ld() and has("ss_ld")) or (dungeon_lf() and has("ss_lf"))
      or (dungeon_ss() and has("ss_ss")) or (dungeon_vs() and has("ss_vs"))
      or (dungeon_sl() and has("ss_sl")))
  else
    return dungeon_ss()
  end
end

function sanc_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("fs_dw")) or (dungeon_ev() and has("fs_ev"))
      or (dungeon_ld() and has("fs_ld")) or (dungeon_lf() and has("fs_lf"))
      or (dungeon_ss() and has("fs_ss")) or (dungeon_vs() and has("fs_vs"))
      or (dungeon_sl() and has("fs_sl")))
  else
    return dungeon_vs()
  end
end

function skykeep_acc()
  if (Tracker.ActiveVariantUID == "var_dungshuf") then
    return ((dungeon_dw() and has("sk_dw")) or (dungeon_ev() and has("sk_ev"))
      or (dungeon_ld() and has("sk_ld")) or (dungeon_lf() and has("sk_lf"))
      or (dungeon_ss() and has("sk_ss")) or (dungeon_vs() and has("sk_vs"))
      or (dungeon_sl() and has("sk_sl")))
  else
    return dungeon_sl()
  end
end

function dungeon_dw() -- dungeon entrance in deep woods
  return deepwoods()
end

function dungeon_ev() -- dungeon entrance in eldin volcano
  return (eldin2() and has("kp",5))
end

function dungeon_ld() -- dungeon entrance in lanayru desert
  return (lanayru1() and bomb() and hook() and sword())
end

function dungeon_lf() -- dungeon entrance in lake floria
  return floria()
end

function dungeon_ss() -- dungeon entrance in sand sea
  return (sea() and has("chart"))
end

function dungeon_vs() -- dungeon entrance in volcano summit
  return (volcano() and bottle() and cs())
end

function dungeon_sl() -- dungeon entrance in skyloft
  return (has("trials") and cs())
end