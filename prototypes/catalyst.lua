local util = require("data-util")

if util.me.catalysis() then
  if util.me.palladium() or util.me.platinum() then
  data:extend({
    {
      type = "item",
      name = "ptpd-catalyst",
      icon = "__bzgold__/graphics/icons/ptpd-catalyst.png",
      icon_size = 128,
      pictures = {
        {filename="__bzgold__/graphics/icons/ptpd-catalyst.png", size=128, scale=0.25},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-1.png", size=128, scale=0.25},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-2.png", size=128, scale=0.25},
        {filename="__bzgold__/graphics/icons/ptpd-catalyst-3.png", size=128, scale=0.25},
      },
      subgroup = "intermediate-product",
      order = "b[catalyst]",
      stack_size = util.get_stack_size(100),
    },
    {
      type = "technology",
      name = "catalysis",
      icons = {
        {
          icon = "__base__/graphics/technology/oil-processing.png",
          icon_size = 256,
        },
        {
          icon = "__bzgold__/graphics/icons/ptpd-catalyst.png",
          icon_size = 128, shift={0,20}
        },
      },
      effects = {},
      unit = {
        count = 100, time = 20,
        ingredients = { 
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
        },
      },
      prerequisites = {"production-science-pack", "advanced-oil-processing"},
      order = "b-b",
    },
  })
  end


  local base = "stone"
  if mods.bzaluminum then base = "alumina"
  elseif mods.bzsilicon then base = "silica"
  end

  local fluid = "sulfuric-acid"
  if data.raw.fluid["hydrogen-chloride"] then fluid = "hydrogen-chloride"
  end

  if util.me.palladium() then
  data:extend({
    {
      type = "recipe",
      name = "pd-catalyst",
      localised_name = {"item-name.ptpd-catalyst"},
      main_product = "ptpd-catalyst",
      category = "chemistry",
      order = "d[catalyst]",
      enabled = false,
      energy_required = 1.6,
      ingredients = {
        {type="item", name=base, amount=1},
        {type="item", name="palladium-ingot", amount=1},
        {type="fluid", name=fluid, amount=100, ignored_by_productivity=100},
      },
      results = {
        {type="item", name="ptpd-catalyst", amount=1},
        {type="fluid", name=fluid, amount=90, ignored_by_productivity=90},
        {type="fluid", name="water", amount=10, ignored_by_productivity=9},
      },
    },
  })
  end
  if util.me.platinum() then
  data:extend({
    {
      type = "recipe",
      name = "pt-catalyst",
      localised_name = {"item-name.ptpd-catalyst"},
      main_product = "ptpd-catalyst",
      category = "chemistry",
      order = "d[catalyst]",
      enabled = false,
      energy_required = 1.6,
      ingredients = {
        {type="item", name=base, amount=1},
        {type="item", name="platinum-ingot", amount=1},
        {type="fluid", name=fluid, amount=100, ignored_by_productivity=100},
      },
      results = {
        {type="item", name="ptpd-catalyst", amount=1},
        {type="fluid", name=fluid, amount=90, ignored_by_productivity=90},
        {type="fluid", name="water", amount=10, ignored_by_productivity=9},
      },
    },
  })
  end
  util.add_unlock("catalysis", "pt-catalyst")
  util.add_unlock("catalysis", "pd-catalyst")
end

