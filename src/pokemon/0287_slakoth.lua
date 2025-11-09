local slakoth = {
  name = "slakoth",
  designer = "RoyalRedRamble",
  config = { extra = { mult = 20, rounds = 8 } },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    local status = (G.GAME.hands_played - center.ability.hands_played_at_create) % 2 == 0
        and localize('rx4_slacking_off')
        or localize('rx4_ready_ex')
    return { vars = { center.ability.extra.mult, status, center.ability.extra.rounds } }
  end,
  rarity = 1,
  cost = 3,
  stage = "Basic",
  ptype = "Colorless",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      if (G.GAME.hands_played - card.ability.hands_played_at_create) % 2 == 0 then
        return {
          message = localize('rx4_yawn')
        }
      else
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    return level_evo(self, card, context, 'j_rx4_vigoroth')
  end,
}

local vigoroth = {
  name = "vigoroth",
  designer = "RoyalRedRamble",
  config = { extra = { mult = 30, rounds = 4 } },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return { vars = { center.ability.extra.mult, center.ability.extra.rounds } }
  end,
  rarity = "poke_safari",
  cost = 6,
  stage = "One",
  ptype = "Colorless",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end
    return level_evo(self, card, context, 'j_rx4_slaking')
  end,
}

local slaking = {
  name = "slaking",
  designer = "RoyalRedRamble",
  config = { extra = { Xmult = 4 } },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    local status = (G.GAME.hands_played - center.ability.hands_played_at_create) % 2 == 0
        and localize('rx4_slacking_off')
        or localize('rx4_ready_ex')
    return { vars = { center.ability.extra.Xmult, status } }
  end,
  rarity = "poke_safari",
  cost = 10,
  stage = "Two",
  ptype = "Colorless",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      if (G.GAME.hands_played - card.ability.hands_played_at_create) % 2 == 0 then
        return {
          message = localize('rx4_yawn')
        }
      else
        return {
          Xmult = card.ability.extra.Xmult
        }
      end
    end
  end,
}

return {
  list = { slakoth, vigoroth, slaking },
  config_key = "slakoth",
}
