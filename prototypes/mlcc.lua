local util = require("data-util")

if util.me.palladium() then

local ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="stone", amount=2}}
if mods.bzzirconium and mods.bzaluminum then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="zirconia", amount=1}, {type="item", name="alumina", amount=1}}
elseif mods.bzzirconium then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="zirconia", amount=2}}
elseif mods.bzaluminum then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="alumina", amount=2}}
elseif mods.bzsilicon then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="silica", amount=3}}
elseif mods.Krastorio2 then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="kr-sand", amount=2}}
elseif mods["aai-industry"] or mods["sand-and-glass"] then
  ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name="sand", amount=2}}
end

data:extend({
  {
    type = "item",
    name = "mlcc",
    icon = "__bzgold__/graphics/icons/mlcc.png",
    icon_size = 128,
      pictures = {
        {filename="__bzgold__/graphics/icons/mlcc.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-1.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-2.png", size=128, scale=0.09375},
        -- {filename="__bzgold__/graphics/icons/mlcc-3.png", size=128, scale=0.09375},
        {filename="__bzgold__/graphics/icons/mlcc-4.png", size=128, scale=0.09375},
        -- {filename="__bzgold__/graphics/icons/mlcc.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-1.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-2.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-3.png", size=128, scale=0.0625},
        -- {filename="__bzgold__/graphics/icons/mlcc-4.png", size=128, scale=0.0625},
      },
    subgroup = "intermediate-product",
    order = "b[gold-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "mlcc",
    categories = {"crafting"},
    order = "d[mlcc]",
    enabled = false,
    energy_required = 4,
    ingredients = ingredients,
    results = {{type="item", name="mlcc", amount=10}},
  },
  {
    type = "technology",
    name = "advanced-capacitors",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/mlcc.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "mlcc" },
    },
    unit = {
      count = 50, time = 15,
      ingredients = util.se6() and 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"se-rocket-science-pack", 1},
      } or {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
    },
    prerequisites = {"palladium-processing"},
    order = "b-b",
  },
})
end
