local tandemaus={
  name = "tandemaus",
  designer = "RoyalRedRamble",
  config = {extra = {mult = 5, totalMult = 5, odds=90, threeChance = 0.3, rounds = 5, combo = true, hand = "Pair"}},
  loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      info_queue[#info_queue+1] = {set = 'Other', key = 'j_rx4_population_bomb', vars={center.ability.extra.mult}}
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
      return level_evo(self, card, context, 'j_rx4_maushold')
  end,
}

local maushold={
  name = "maushold",
  designer = "RoyalRedRamble",
  pos = { x = 6, y = 0 },
  config = {extra = {Xmult = 1.5, totalXMult = 1.5, incMult = 0.5, combo = true, hand = "Four of a Kind", handTwo = "Full House", form = 0}},
  loc_vars = function(self, info_queue, center)
      type_tooltip(self, info_queue, center)
      local alt_key = nil
      if center.ability.extra.form == 1 then
        alt_key = "j_rx4_maushold_three"
      end
      info_queue[#info_queue+1] = {set = 'Other', key = 'j_rx4_population_bomb_ex', vars={ center.ability.extra.Xmult, center.ability.extra.incMult }}
      return {vars = {center.ability.extra.hand, center.ability.extra.handTwo}, key = alt_key}
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
          if pseudorandom('maushold') < 0.9 then
              local Xmult = card.ability.extra.totalXMult
              local message = localize("rx4_population_bomb")
              card.ability.extra.totalXMult = card.ability.extra.totalXMult + card.ability.extra.incMult
              -- If it's a full house and maushold_three it'll count for both
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
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      if pseudorandom('maushold') < 0.3 then
        card.ability.extra.form = 1
        self:set_sprites(card)
      end
    end
    card.ability.extra.hand = card.ability.extra.form == 1 and "Three of a Kind" or "Four of a Kind"
  end,
  set_sprites = function(self, card, front)
    if card.ability and card.ability.extra and card.ability.extra.form == 1 then
      card.children.center:set_sprite_pos({x = 4, y = 0})
    else
      card.children.center:set_sprite_pos({x = 6, y = 0})
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      self:set_ability(card)
    end
  end,
}

return {
  list = { tandemaus, maushold },
  family = {"tandemaus", {key = "maushold", form = 1}, {key = "maushold", form = 0}},
  config_key = "tandemaus",
}
