local khaoslib_item = require("__khaoslib__.prototypes.item")
local khaoslib_technology = require("__khaoslib__.prototypes.technology")

-- Add subgroup to bioprocessing tab if installed
if mods["bioprocessing-tab"] then
  data.raw["item-subgroup"]["freeze-thaw-processes"].group = "bioprocessing"
end

-- Add exploration science pack to cryogenic tech if Muluna is installed
if mods["planet-muluna"] then
  khaoslib_technology:load("s6x-freeze-preservation-living")
    :add_prerequisite("interstellar-science-pack")
    :add_science_pack({"interstellar-science-pack", 1})
    :commit()
end

-- Set proper import location
local import_food = {
  ["s6x-frozen-raw-fish"] = "nauvis",
  ["s6x-frozen-biter-egg"] = "nauvis",
  ["s6x-frozen-sulfuric-bacteria"] = "vulcanus",
}

for item, planet in pairs(import_food) do
  if khaoslib_item.exists(item) then
    khaoslib_item:load(item)
      :set {default_import_location = planet}
      :commit()
  end
end
