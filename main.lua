local mod_id, mod_config = SMODS.current_mod.id, SMODS.current_mod.config

assert(SMODS.load_file("src/sprites.lua"))()

local load_utils = assert(SMODS.load_file("src/functions/load_utils.lua"))()
local load_directory, load_pokemon_directory = load_utils.load_directory, load_utils.load_pokemon_directory

load_pokemon_directory("src/pokemon/")

load_directory("src/consumables/", SMODS.Consumable)
load_directory("src/vouchers/", SMODS.Voucher)
load_directory("src/enhancements/", SMODS.Enhancement)
load_directory("src/backs/", SMODS.Back)
load_directory("src/challenges/", SMODS.Challenge)

local pokemon_in_pool_ref = pokemon_in_pool
function pokemon_in_pool(center)
  if center.mod.id == mod_id
      and mod_config.disabled[center.config_key] then
    return false
  end
  return pokemon_in_pool_ref(center)
end

SMODS.current_mod.config_tab = function() 
    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
        },
        nodes = {
            create_toggle({
                label = localize("seviper_line"),
                ref_table = mod_config.disabled,
                ref_value = "seviper",
            }),
            create_toggle({
                label = localize("slakoth_line"),
                ref_table = mod_config.disabled,
                ref_value = "slakoth",
            }),
            create_toggle({
                label = localize("tandemaus_line"),
                ref_table = mod_config.disabled,
                ref_value = "tandemaus",
            }),
            create_toggle({
                label = localize("makuhita_line"),
                ref_table = mod_config.disabled,
                ref_value = "makuhita",
            }),
        },
    }
end
