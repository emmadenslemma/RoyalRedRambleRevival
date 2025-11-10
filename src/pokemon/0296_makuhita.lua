local makuhita={
    name = "makuhita",
    config = {extra = {hands = 1, h_size = 1, rounds = 5}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {vars = {center.ability.extra.hands, center.ability.extra.h_size, center.ability.extra.rounds}}
    end,
    rarity = 2,
    cost = 6,
    stage = "Basic",
    ptype = "Fighting",
    blueprint_compat = true,
    calculate = function(self, card, context)
        return level_evo(self, card, context, 'j_rx4_hariyama')
    end,
    add_to_deck = function(self, card, from_debuff)
        -- Hands
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        if not from_debuff then
            ease_hands_played(card.ability.extra.hands)
        end

        -- Hand size
        G.hand:change_size(card.ability.extra.h_size)

    end,
    remove_from_deck = function(self, card, from_debuff)
        -- Hands
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
        if to_decrease > 0 then
          ease_hands_played(-to_decrease)
        end
        -- Hand size
        G.hand:change_size(-card.ability.extra.h_size)

    end,
}

local hariyama={
    name = "hariyama",
    config = {extra = {hands = 2, h_size = 2, orig_h_size = 2}},
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        return {vars = {center.ability.extra.hands, center.ability.extra.h_size}}
    end,
    rarity = "poke_safari",
    cost = 6,
    stage = "One",
    ptype = "Fighting",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- Every hand played increases your hand size by one
        if context.after then
            local changed_size = 1
            card.ability.extra.h_size = card.ability.extra.h_size + changed_size
            G.hand:change_size(changed_size)
        end

        -- reset to original size when finished
        if context.end_of_round and context.cardarea == G.jokers then
            G.hand:change_size(-(card.ability.extra.h_size-card.ability.extra.orig_h_size))
            card.ability.extra.h_size = card.ability.extra.orig_h_size
        end


    end,
    add_to_deck = function(self, card, from_debuff)
        -- Hands
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        if not from_debuff then
            ease_hands_played(card.ability.extra.hands)
        end

        -- Hand size
        G.hand:change_size(card.ability.extra.h_size)

    end,
    remove_from_deck = function(self, card, from_debuff)
        -- Hands
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
        if to_decrease > 0 then
          ease_hands_played(-to_decrease)
        end

        -- Hand size
        G.hand:change_size(-card.ability.extra.h_size)

    end,
}

return {
  list = { makuhita, hariyama },
  config_key = "makuhita",
}
