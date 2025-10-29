function RX4.load_directory(directory, func)
  local files = NFS.getDirectoryItems(SMODS.current_mod.path .. directory)
  for _, filename in ipairs(files) do
    local file = assert(SMODS.load_file(directory .. filename))()
    func(file)
  end
end

function RX4.load_pokemon_file(file)
  if file.init then
    file.init()
  end

  if file.list then
    local family = {}
    for _, item in ipairs(file.list) do
      family[#family + 1] = item.name
      RX4.load_pokemon(item)
    end
    if (SMODS.Mods["NachosPokermonDip"] or {}).can_load and PkmnDip and PkmnDip.dex_order_groups then
      PkmnDip.dex_order_groups[#PkmnDip.dex_order_groups + 1] = family
    end
    pokermon.add_family(family)
  end
end

function RX4.load_pokemon(item)
  local custom_atlas = item.atlas and string.find(item.atlas, "Rx4")

  if not item.atlas then
    poke_load_atlas(item)
    poke_load_sprites(item)
  end

  pokermon.Pokemon(item, "rx4", custom_atlas)
end
