local seviper = {
  name = "seviper",
  designer = "RoyalRedRamble",
  config = { extra = { Xmult = 1.5 }, h_size_req = 5 },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Blind', key = 'bl_serpent' }
    return { vars = { center.ability.extra.Xmult, self.config.h_size_req } }
  end,
  rarity = 3,
  cost = 6,
  stage = "Basic",
  ptype = "Dark",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.drawing_cards and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
      return { cards_to_draw = 3 }
    end
    if context.joker_main
        and #G.hand.cards >= self.config.h_size_req then
      return {
        Xmult = card.ability.extra.Xmult
      }
    end
  end,
}

return { list = { seviper } }
