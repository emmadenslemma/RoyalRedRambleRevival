RX4 = RX4 or {}

assert(SMODS.load_file("src/load_utils.lua"))()
assert(SMODS.load_file("src/sprites.lua"))()

RX4.load_directory('src/pokemon/', RX4.load_pokemon_file)
