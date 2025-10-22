local futil = require("util");
local util = require("data-util");


if util.me.silver() then
  if mods.bobelectronics or mods.MDbobelectronics or mods.MDbobelectronics2 then
    -- alternate electronic component recipe that uses silver
    local ec = futil.table.deepcopy(data.raw.recipe["basic-electronic-components"])
    ec.name = "basic-electronic-components-silver"
    data:extend({ec})
    util.set_enabled("basic-electronic-components-silver", false)
    util.replace_ingredient("basic-electronic-components-silver", "copper-cable", "silver-wire")
    local bec_icon = {
      icon = data.raw.item["basic-electronic-components"].icon,
      icon_size = data.raw.item["basic-electronic-components"].icon_size
    }
    util.set_icons("basic-electronic-components-silver", {
      bec_icon,
      {
        icon = "__bzgold__/graphics/icons/silver-wire.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {-8,-8}
      }
    })
    util.set_icons("basic-electronic-components", {
      bec_icon,
      {
        icon = "__base__/graphics/icons/copper-cable.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {-8,-8}
      }
    })
    util.add_unlock("electronics", "basic-electronic-components-silver")
  else
    -- alternate electronic circuit recipe that uses silver
    util.set_main_product("electronic-circuit", "electronic-circuit")
    local ec = futil.table.deepcopy(data.raw.recipe["electronic-circuit"])
    ec.name = "electronic-circuit-silver"
    ec.factoriopedia_alternative = "electronic-circuit"
    ec.localised_name = {"item-name.electronic-circuit"}
    ec.icons = {
      { icon = "__base__/graphics/icons/electronic-circuit.png" },
      { icon = "__bzgold__/graphics/icons/silver-wire.png", scale = 0.3, shift = {8,-8} }
    }
    data:extend({ec})
    util.set_enabled("electronic-circuit-silver", false)
    util.replace_ingredient("electronic-circuit-silver", "copper-cable", "silver-wire")
    data.raw.recipe["electronic-circuit"].icons = {
      { icon = "__base__/graphics/icons/electronic-circuit.png" },
      { icon = "__base__/graphics/icons/copper-cable.png", scale = 0.3, shift = {8,-8} }
    }
    if util.check_unlock("electronics", "electronic-circuit") then
      util.add_unlock("electronics", "electronic-circuit-silver")
    else
      util.add_unlock("silver-processing", "electronic-circuit-silver")
    end

    if mods["aai-industry"] and not mods.bzgas then
      local ec2 = futil.table.deepcopy(data.raw.recipe["electronic-circuit"])
      ec2.name = "electronic-circuit-stone-silver"
      data:extend({ec2})
      util.set_enabled("electronic-circuit-stone-silver", false)
      util.replace_ingredient("electronic-circuit-stone-silver", "copper-cable", "silver-wire")
      util.add_icon("electronic-circuit-stone-silver", {
        icon = "__bzgold__/graphics/icons/silver-wire.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {8,-8}
      })
      util.add_icon("electronic-circuit-stone-silver", {
        icon = "__aai-industry__/graphics/icons/stone-tablet.png",
        icon_size = 64, scale = 0.3, shift = {-8,-8}
      })
      util.add_icon("electronic-circuit", {
        icon = "__base__/graphics/icons/copper-cable.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3, shift = {8,-8}
      })
      util.add_icon("electronic-circuit", {
        icon = "__aai-industry__/graphics/icons/stone-tablet.png",
        icon_size = 64, scale = 0.3, shift = {-8,-8}
      })
      if util.check_unlock("electronics", "electronic-circuit") then
        util.add_unlock("electronics", "electronic-circuit-stone-silver")
      else
        util.add_unlock("silver-processing", "electronic-circuit-stone-silver")
      end
    end
  end
end

