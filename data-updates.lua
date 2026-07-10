local khaoslib_technology = require("__khaoslib__.technology")

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
