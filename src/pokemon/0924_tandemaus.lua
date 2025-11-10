local get_tandemaus_evo = function(chance)
    if pseudorandom('tandemaus') < chance then
        return 'j_rx4_maushold_three'
    end
    return 'j_rx4_maushold_four'
end

local tandemaus={
  name = "tandemaus",
  designer = "RoyalRedRamble",
  config = {extra = {mult = 5, totalMult = 5, odds=90, threeChance = 0.3, rounds = 5, combo = true, hand = "Pair"}},
  loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      info_queue[#info_queue+1] = {set = 'Other', key = 'j_rx4_population_bomb', vars={center.ability.extra.odds, center.ability.extra.mult}}
      return {vars = {center.ability.extra.hand, center.ability.extra.rounds}}
  end,
  rarity = 1,
  cost = 4,
  stage = "Basic",
  ptype = "Colorless",
  blueprint_compat = true,
  calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and next(context.poker_hands[card.ability.extra.hand]) then
          if card.ability.extra.combo then
              if pseudorandom('tandemaus') < card.ability.extra.odds/100 then
                  local mult = card.ability.extra.totalMult
                  card.ability.extra.totalMult = mult * 2
                  return {
                      message = localize("rx4_population_bomb"),
                      mult = mult,
                      card = card
                  }
              else
                  card.ability.extra.combo = false
                  return {
                      message = localize("rx4_miss"),
                  }
              end
          end
      end
      if context.after then
          card.ability.extra.totalMult = card.ability.extra.mult
          card.ability.extra.combo = true
      end
      return level_evo(self, card, context, get_tandemaus_evo(card.ability.extra.threeChance))
  end,
}

local maushold_three={
  name = "maushold_three",
  designer = "RoyalRedRamble",
  pos = { x = 4, y = 0 },
  config = {extra = {Xmult = 1.5, totalXMult = 1.5, incMult = 0.5, odds=90, combo = true, hand = "Three of a Kind", handTwo = "Full House"}},
  loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      info_queue[#info_queue+1] = {set = 'Other', key = 'j_rx4_population_bomb_ex', vars={center.ability.extra.odds, center.ability.extra.Xmult, center.ability.extra.incMult}}
      return {vars = {center.ability.extra.hand, center.ability.extra.handTwo}}
  end,
  rarity = "poke_safari",
  cost = 6,
  stage = "One",
  ptype = "Colorless",
  atlas = "AtlasJokersBasicGen09",
  blueprint_compat = true,
  calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
          if card.ability.extra.combo and (next(context.poker_hands[card.ability.extra.hand]) or next(context.poker_hands[card.ability.extra.handTwo])) then
              if pseudorandom('maushold_three') < card.ability.extra.odds/100 then
                  local Xmult = card.ability.extra.totalXMult
                  local message = localize("rx4_population_bomb")
                  card.ability.extra.totalXMult = card.ability.extra.totalXMult + card.ability.extra.incMult
                  -- If it's a full house it'll count for both
                  if (next(context.poker_hands[card.ability.extra.hand]) and next(context.poker_hands[card.ability.extra.handTwo])) then
                      -- Double double!
                      card.ability.extra.totalXMult = card.ability.extra.totalXMult + card.ability.extra.incMult
                      message = localize("rx4_population_bomb_big")
                  end
                  return {
                      message = message,
                      xmult = Xmult,
                      card = card
                  }
              else
                  card.ability.extra.combo = false
                  return {
                      message = localize("rx4_miss"),
                  }
              end
          end
      end
      if context.after then
          card.ability.extra.totalXMult = card.ability.extra.Xmult 
          card.ability.extra.combo = true
      end
    end,
}

local maushold_four={
  name = "maushold_four",
  designer = "RoyalRedRamble",
  pos = { x = 6, y = 0 },
  config = {extra = {Xmult = 1.5, totalXMult = 1.5, incMult = 0.5, odds=90, combo = true, hand = "Four of a Kind", handTwo = "Full House"}},
  loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      info_queue[#info_queue+1] = {set = 'Other', key = 'j_rx4_population_bomb_ex', vars={center.ability.extra.odds, center.ability.extra.Xmult, center.ability.extra.incMult}}
      return {vars = {center.ability.extra.hand, center.ability.extra.handTwo}}
  end,
  rarity = "poke_safari",
  cost = 6,
  stage = "One",
  ptype = "Colorless",
  atlas = "AtlasJokersBasicGen09",
  blueprint_compat = true,
  calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
          if card.ability.extra.combo and (next(context.poker_hands[card.ability.extra.hand]) or next(context.poker_hands[card.ability.extra.handTwo])) then
              if pseudorandom('maushold_four') < card.ability.extra.odds/100 then
                  local Xmult = card.ability.extra.totalXMult
                  card.ability.extra.totalXMult = card.ability.extra.totalXMult + card.ability.extra.incMult
                  return {
                      message = localize("rx4_population_bomb"),
                      xmult = Xmult,
                      card = card
                  }
              else
                  card.ability.extra.combo = false
                  return {
                      message = localize("rx4_miss"),
                  }
              end
          end
      end
      if context.after then
          card.ability.extra.totalXMult = card.ability.extra.Xmult
          card.ability.extra.combo = true
      end
  end,
}

return {
  list = { tandemaus, maushold_three, maushold_four },
  config_key = "tandemaus",
}
