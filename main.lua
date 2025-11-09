
assert(SMODS.load_file("src/sprites.lua"))()

local load_utils = assert(SMODS.load_file("src/functions/load_utils.lua"))()
local load_directory, load_pokemon_directory = load_utils.load_directory, load_utils.load_pokemon_directory

load_pokemon_directory("src/pokemon/")

load_directory("src/consumables/", SMODS.Consumable)
load_directory("src/vouchers/", SMODS.Voucher)
load_directory("src/enhancements/", SMODS.Enhancement)
load_directory("src/backs/", SMODS.Back)
load_directory("src/challenges/", SMODS.Challenge)
