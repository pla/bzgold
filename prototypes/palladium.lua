local util = require("data-util")

if util.me.palladium() then
data:extend({
  {
    type = "item",
    name = "palladium-powder",
    icon = "__bzgold__/graphics/icons/palladium-powder.png",
    icon_size = 64,
    subgroup = "raw-resource",
    order = "b[palladium-powder]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "item",
    name = "palladium-ingot",
    icon = "__bzgold__/graphics/icons/palladium-ingot.png",
    icon_size = 128,
    subgroup = "raw-resource",
    order = "b[palladium-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "palladium-ingot",
    main_product = "palladium-ingot",
    category = "smelting",
    order = "d[palladium-ingot]",
    enabled = false,
    energy_required = 1.6,
    ingredients = {{type="item", name="palladium-powder", amount=1}},
    results = util.me.byproduct() and
    {
      {type="item", name="palladium-ingot", amount=1, probability=0.95},
      {type="item", name="sulfur", amount=1, probability=0.05},
    } or  {{type="item", name="palladium-ingot", amount=1}},
  },
})
data:extend({
  {
    type = "technology",
    name = "palladium-processing",
    icons = {
      {
        icon = "__bzgold__/graphics/technology/palladium-processing.png",
        icon_size = 256,
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "palladium-ingot" },
    },
    unit = {
      count = 50, time = 30,
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
    prerequisites = mods["space-exploration"] and {"se-rocket-science-pack"} or {"chemical-science-pack"},
    order = "b-b",
  },
})
if mods.bztitanium then
data:extend({
  {
    type = "item",
    name = "titanium-palladium-flange",
    icon = "__bzgold__/graphics/icons/titanium-palladium-alloy.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[palladium-ingot]",
    stack_size = util.get_stack_size(100),
  },
  {
    type = "recipe",
    name = "titanium-palladium-flange",
    category = "advanced-crafting",
    order = "d[palladium-ingot]",
    enabled = false,
    energy_required = 5,
    ingredients = {{type="item", name="palladium-ingot", amount=1}, {type="item", name=util.titanium_plate, amount=4}},
    results = {{type="item", name="titanium-palladium-flange", amount=5}},
  },
})
util.add_unlock("palladium-processing", "titanium-palladium-flange")
util.set_to_founding("titanium-palladium-flange")
end
end
