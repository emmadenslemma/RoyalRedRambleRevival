local zangoose = {
  name = "zangoose",
  designer = "RoyalRedRamble",
  config = { extra = { Xmult = 2 }, h_size_req = 3 },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Blind', key = 'bl_hook' }
    return { vars = { center.ability.extra.Xmult, self.config.h_size_req } }
  end,
  rarity = 3,
  cost = 6,
  stage = "Basic",
  ptype = "Dark",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.press_play then
      G.E_MANAGER:add_event(Event({
        func = function()
          if #G.hand.cards > 0 then
            local cards = {}
            for _, hand_card in ipairs(G.hand.cards) do
              table.insert(cards, hand_card)
            end
            pseudoshuffle(cards, pseudoseed('zangoose'))
            for i = 1, math.min(2, #cards) do
              G.hand:add_to_highlighted(cards[i], true)
              play_sound('card1', 1)
            end
            G.FUNCS.discard_cards_from_highlighted(nil, true)
          end
          return true
        end
      }))
    end
    if context.joker_main
        and #G.hand.cards <= self.config.h_size_req then
      return {
        Xmult = card.ability.extra.Xmult
      }
    end
  end,
}

return {
  list = { zangoose },
  config_key = "seviper",
}
