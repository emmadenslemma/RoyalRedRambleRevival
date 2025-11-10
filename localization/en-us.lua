return {
    descriptions = {
        Joker = {
            j_rx4_slakoth = {
                name = "Slakoth",
                text = {
                    "{C:mult}+#1#{} Mult every",
                    "{C:attention}second{} hand",
                    "{C:inactive}#2#",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                },
            },
            j_rx4_vigoroth = {
                name = "Vigoroth",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                },
            },
            j_rx4_slaking = {
                name = "Slaking",
                text = {
                    "{C:white,X:mult}X#1#{} Mult every",
                    "{C:attention}second{} hand",
                    "{C:inactive}#2#",
                },
            },
            j_rx4_zangoose = {
                name = "Zangoose",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if {C:attention}#2#{} or fewer",
                    "cards held in hand",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Applies {C:attention}The Hook{}",
                },
            },
            j_rx4_seviper = {
                name = "Seviper",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if {C:attention}#2#{} or more",
                    "cards held in hand",
                    "{br:2}ERROR - CONTACT STEAK",
                    "Applies {C:attention}The Serpent{}",
                    "{C:inactive,s:0.8}(Only during a {C:attention,s:0.8}Blind{C:inactive,s:0.8})",
                },
            },
            j_rx4_tandemaus = {
                name = "Tandemaus",
                text = {
                    "Uses {C:attention}Population Bomb{} if hand",
                    "contains a {C:attention}#1#{}",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)"
                } 
            },
            j_rx4_maushold_three = {
                name = "Maushold",
                text = {
                    "Uses {C:attention}Population Bomb EX{} if hand",
                    "contains a {C:attention}#1#{}",
                    "or a {C:attention}#2#{}",
                    "{C:inactive,s:0.8}(Yes these stack)",
                } 
            },
            j_rx4_maushold_four = {
                name = "Maushold",
                text = {
                    "Uses {C:attention}Population Bomb EX{} if hand",
                    "contains a {C:attention}#1#{}", 
                    "or a {C:attention}#2#{}",
                } 
            },
            j_rx4_makuhita = {
                name = "Makuhita",
                text = {
                    "{C:blue}+#1#{} hand",
                    "{C:attention}+#2#{} hand size",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                } 
            },
            j_rx4_hariyama = {
                name = "Hariyama",
                text = {
                    "{C:blue}+#1#{} hands, {C:attention}+#2#{} hand size",
                    "{C:attention}+1{} hand size per hand",
                    "played this round",
                } 
            },
        },
        Other = {
            j_rx4_population_bomb = {
                name = "Population Bomb",
                text = {
                    "{C:green}#1#%{} chance to give",
                    "{C:mult}+#2#{} Mult when card is scored",
                    "Mult is {C:attention}doubled{} per trigger",
                    "but stops triggering on first failure.",
                    "{C:attention}Resets{} after each hand.",
                }
            },
            j_rx4_population_bomb_ex = {
                name = "Population Bomb EX",
                text = {
                    "{C:green}#1#%{} chance to give",
                    "{X:mult,C:white}X#2#{} Mult when card is scored",
                    "Increased by {X:mult,C:white}#3#{} per trigger",
                    "but stops triggering on first failure.",
                    "{C:attention}Resets{} after each hand.",
                }
            },
        },
    },
    misc = {
        dictionary = {
            -- Joker Messages
            rx4_yawn = "Yawn",
            rx4_slacking_off = "Slacking off...",
            rx4_ready_ex = "Ready!",
            rx4_miss = "Miss",
            rx4_population_bomb = "Population Bomb!",
            rx4_population_bomb_big = "POPULATION BOMB!",            
            -- Config Descriptions
            seviper_line = "Disable Seviper and Zangoose?",
            slakoth_line = "Disable Slakoth Line?",
            makuhita_line = "Disable Makuhita Line?",
            tandemaus_line = "Disable Tandemaus Line?",
        }
    },
}
