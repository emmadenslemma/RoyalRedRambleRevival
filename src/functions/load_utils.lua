local mod_prefix = SMODS.current_mod.prefix

local function load_file(file, map_item)
  if file.init then
    file.init()
  end

  if file.list then
    for i, item in ipairs(file.list) do
      map_item(item, i == 1 and file.list)
    end
  end
end

local function load_directory(directory, map_item, map_file)
  map_file = map_file or load_file
  local files = NFS.getDirectoryItems(SMODS.current_mod.path .. directory)
  for _, filename in ipairs(files) do
    local file = assert(SMODS.load_file(directory .. filename))()
    map_file(file, map_item)
  end
end

local function load_pokemon(item)
  local custom_atlas = item.atlas and string.find(item.atlas, "^" .. mod_prefix)

  if not item.atlas then
    poke_load_atlas(item)
    poke_load_sprites(item)
  end

  pokermon.Pokemon(item, mod_prefix, custom_atlas)
end

local function load_pokemon_file(file, map_item)
  if file.init then
    file.init()
  end

  if file.list then
    local family = {}
    for _, item in ipairs(file.list) do
      item.config_key = item.config_key or file.config_key
      family[#family + 1] = item.name
      map_item(item)
    end
    if (SMODS.Mods["NachosPokermonDip"] or {}).can_load and PkmnDip and PkmnDip.dex_order_groups then
      PkmnDip.dex_order_groups[#PkmnDip.dex_order_groups + 1] = family
    end
    pokermon.add_family(file.family or family)
  end
end

local function load_pokemon_directory(directory)
  load_directory(directory, load_pokemon, load_pokemon_file)
end

return {
  load_directory = load_directory,
  load_pokemon_directory = load_pokemon_directory
}
