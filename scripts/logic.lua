function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count == amount
  end
end

function soth()
  local faron = has("sohf")
  local eldin = has("sohe")
  local lanayru = has("sohl")
  local complete = has("sohc")

  return (faron and eldin and lanayru) or complete
end

function bottle()
  local pouch = has("adventure")
  local bot = has("bottle")

  return (pouch and bot)
end

function thunderhead()
  return 1
end

function beedle()
  local s = has("sling")
  local bt = has("beetle")
  local bw = has("bow")
  local cs = has("cs")
  local bm = has("bombs")
  return (s or bt or bw or cs or bm)
end

function sealedtemple()
  local em = has("emerald")
  
  return em
end

function eldin1()
  local rb = has("ruby")

  return rb
end

function eldin2()
  local e1 = eldin1()
  local m = has("mitts")
  local b = has("bombs")
  local h = has("hb")

  return (e1 and (b or h or m))
end

function volcano()
  local e2 = eldin2()
  local fire = has("fse")

  return (e2 and fire)
end

function lanayru1()
  local am = has("amber")

  return am
end

function lanayru2()
  local l1 = lanayru1
  local c = has("cs")
  local h = has("hb")
  return (l1 and (c or h))
end

function wheel()
  local l1 = lanayru1()
  local b = has("bombs")
  return (l1 and b)
end

function sea()
  local l = lanayru1()
  local c = has("cs")
  local sk = has("cavessk")

  return (l and c and sk)
end

function walls()
  local ac = skyview2_acc()
  local bog = has("bog")
  local harp = has("harp")

  return (ac and bog and harp)
end

function yerbal()
  local s = has("sling")
  local bt = has("beetle")
  local gb = has("bellows")
  local w = has("wds")
  local c = has("cs")
  return ((s or bt) and ((gb and w) or c))
end

function floria()
  local st = sealedtemple()
  local w = has("wds")
  local y = yerbal()
  return (st and w and y)
end

function deepwoods()
  local st = sealedtemple()
  local sl = has("sling")
  local c = has("cs")
  local bt = has("beetle")
  local bw = has("bow")
  local bm = has("bombs")

  return (st and (sl or c or bt or bw or bm))
end

function dungeon_dw()
  local dw = deepwoods()
  return dw
end

function skyview0()
  local s = has("sling")
  local c = has("cs")
  local bt = has("beetle")
  local bw = has("bow")
  local bm = has("bombs")
  return (s or c or bt or bw or bm)
end

function skyview1()
  local s = skyview0()
  local w = has("wds")
  return (s or w)
end

function skyview()
  local acc = skyview_acc()
  local bm = has("bombs")
  local bt = has("beetle")
  local bw = has("bow")
  local w = has("wds")
  local sk = has("skyviewsk",2)
  local bk = has("skyviewbk")

  return (acc and (bm or bt or bw or w) and sk and bk)
end

function dungeon_ev()
  local e2 = eldin2()
  local kp = has("kp",5)

  return (e2 and kp)
end

function earth()
  local acc = earth_acc()
  local mt = has("mitts")
  local bm = has("bombs")
  local h = has("hb")
  local bt = has("beetle")
  local bk = has("earthbk")

  return (acc and bm and (h or (bt and mt)) and bk)
end

function dungeon_ld()
  local l1 = lanayru1()
  local bm = has("bombs")
  return (l1 and bm)
end

function mine()
  local acc = mine_acc()
  local h = has("hb")
  local g = has("bellows")
  local bk = has("minebk")
  
  return (acc and h and g and bk)
end

function gate()
  local bog = has("bog")
  local harp = has("harp")
  local st = sealedtemple()

  return (bog and harp and st)
end

function skyview2_acc()
  local w = has("wds")
  local acc = skyview_acc()
  return (w and acc)
end

function skyview2()
  local acc = skyview2_acc()
  local sv = skyview()
  return (acc and sv)
end

function sacredwater()
  local bot = bottle()
  local sv = skyview2()
  
  return (sv and bot)
end

function dungeon_lf()
  local f = floria()
  return f
end

function cistern()
  local bk = has("cisternbk")
  local sk = has("cisternsk",2)
  local acc = cistern_acc()
  local w = has("whip")
  local c = has("cs")

  return (acc and w and bk and (sk or c))
end

function dungeon_ss()
  local chart = has("seachart")
  local s = sea()

  return (s and chart)
end

function sandship()
  local acc = sandship_acc()
  local bk = has("sandshipbk")
  local b = has("bow")

  return (acc and b and bk)
end

function dungeon_vs()
  local v = volcano()
  local bt = bottle()
  local c = has("cs")

  return (v and bt and c)
end

function waterpod()
  local bw = has("bow")
  local bt = has("beetle")
  local c = has("cs")
  local s = has("sling")
  local bm = has("bombs")
  return (bw or bt or c or s or bm)
end

function sanc()
  local sk = has("sancsk",3)
  local mitts = has("mogma")
  local bk = has("sancbk")
  local acc = sanc_acc()
  local h = has("hb")

  return (acc and h and sk and mitts and bk)
end

function past()
  local ms = has("ms")
  local s = has("sanc")
  local c = has("cistern")
  
  return (ms and s and c)
end

function levias()
  local p = past()
  return p
end

function floodedfaron()
  local l = levias()
  local w = has("wds")
  return (l and w)
end

function bokobase()
  local l = levias()
  return l
end

function gorge()
  local l1 = lanayru1()
  local l = levias()
  local c = has("cs")
  return (l1 and l and c)
end

function thunder()
  local g = gorge()
  local bm = has("bombs") 
  local c = has("cs") 
  local h = has("hb") 
  local w = has("whip") 
  local p = past()
  return (g and bm and c and h and w and p)
end

function dungeon_sl()
  local st = has("trials")
  local c = has("cs")
  
  return (st and c)
end

function skykeep()
  local ac = skykeep_acc()
  local sk = has("skykeepsk")
  local c = has("cs")
  local b = has("bow") 
  local g = has("bellows")
  local w = has("whip")

  return (ac and sk and c and b and g and w)
end

function demise()
  local p = past()
  local s = skykeep()
  return (p and s)
end

function cube_initial()
  local dw = deepwoods()
  return dw
end

function cube_wgt() --west great tree
  local st = sealedtemple()
  local c = has("cs")
  local g = has("bellows")
  local w = has("wds")
  return (st and (c or (g and w)))
end

function cube_egtr() --east great tree rope
  local st = sealedtemple()
  local c = has("cs")
  local g = has("bellows")
  local w = has("wds")
  return (st and (c or (g and w)))
end

function cube_egtcs() --east great tree claw
  local st = sealedtemple()
  local c = has("cs")
  local g = has("bellows")
  local w = has("wds")
  return (st and (c or (g and w)))
end

function cube_dw()
  local dw = deepwoods()
  return dw
end

function cube_sv() --skyview
  local dw = deepwoods() 
  local c = has("cs")
  return (dw and c)
end

function cube_svs() --skyview spring
  local sv = skyview()
  return sv
end

function cube_fl() --floria
  local f = floria()
  return f
end

function cube_fw() --floria waterfall
  local f = floria() 
  local c = has("cs")
  return (f and c)
end

function cube_ee() --eldin entrance
  local e1 = eldin1()
  return e1
end

function cube_mte() --mogma turf entrance
  local e1 = eldin1()
  return e1
end

function cube_mt() --mogma turf
  local e1 = eldin1()
  return e1
end

function cube_etw() --west of et
  local mitts = has("digging")
  local e2 = eldin2()

  return (e2 and mitts)
end

function cube_ete() --east of et
  local e2 = eldin2()
  return e2
end

function cube_es() --eldin slide
  local e2 = eldin2()
  return e2
end

function cube_vs() --volcano summit
  local v = volcano()
  return v
end

function cube_sw() --summit waterfall
  local v = volcano()
  return v
end

function cube_fse() --sanc entrance
  local bot = bottle()
  local v = volcano() 
  local c = has("cs")

  return (v and bot and c)
end

function cube_lme() --mine entrance
  local l1 = lanayru1()
  return l1
end

function cube_so() --sand oasis
  local l2 = lanayru2()
  return l2
end

function cube_tot() --ride in tot
  local l2 = lanayru2()
  local h = has("hb")
  return (l2 and h)
end

function cube_sp() --desert secret passageway
  local l2 = lanayru2()
  local b = has("bombs") 
  local c = has("cs")
  return (l2 and b and c)
end

function cube_hbf() --hook beetle flight
  local l1 = lanayru1()
  local c = has("cs")
  local b = has("bombs")
  local h = has("hb")
  return (l1 and (c or b or h))
end

function cube_ah() --ancient harbour
  local s = sea()
  return s
end

function cube_sr() --skipper's retreat
  local s = sea() 
  local b = has("bombs") 
  local h = has("hb")
  local w = has("whip")
  return (s and (b or h or w))
end

function cube_ps() --pirate stronghold
  local s = sea() 
  local g = has("bellows")
  return (s and g)
end

function cube_lg() --gorge
  local g = gorge()
  local c = has("cs")
  local w = has("whip")
  local h = has("hb")
  return (g and c and w and h)
end

--framework for dungeon_ rando
function skyview_acc()
  local acc = dungeon_dw()
  return acc
end

function earth_acc()
  local acc = dungeon_ev()
  return acc
end

function mine_acc()
  local acc = dungeon_ld()
  return acc
end

function cistern_acc()
  local acc = dungeon_lf()
  return acc
end

function sandship_acc()
  local acc = dungeon_ss()
  return acc
end

function sanc_acc()
  local acc = dungeon_vs()
  return acc
end

function skykeep_acc()
  local acc = dungeon_sl()
  return acc
end