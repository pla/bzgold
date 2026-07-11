local util = require("data-util")

local silicon = {type="item", name="stone", amount=30}
if mods.bzsilicon then
  silicon = data.raw.item["silicon-wafer"] and {type="item", name="silicon-wafer", amount=30} or {type="item", name=mods.Krastorio2 and "kr-silicon" or "silicon", amount=15}
elseif mods.Krastorio2 then
  silicon = data.raw.item["silicon-wafer"] and {type="item", name="silicon-wafer", amount=30} or {type="item", name="kr-silicon", amount=15}
elseif data.raw.item["sand"] then
  silicon = {type="item", name="sand", amount=30}
end

local spreader = data.raw.item["cuw"] and {type="item", name="cuw", amount=2} or {type="item", name="copper-plate", amount=2}
data:extend({
  {
    type = "item",
    name = "cpu",
    icon = "__base__/graphics/technology/advanced-circuit.png",
    icon_size = 256,
    subgroup = "intermediate-product",
    order = "b[cpu]",
    stack_size = util.get_stack_size(200),
  },
  {
    type = "recipe",
    name = "cpu",
    categories = {"crafting-with-fluid"},
    order = "d[cpu]",
    enabled = false,
    energy_required = 50,
    ingredients = {
      silicon, spreader, {type="item", name="gold-ingot", amount=1}, {type="item", name="electronic-circuit", amount=10},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    results = {{type="item", name="cpu", amount=10}},
  },
})
if mods["space-exploration"] then
  local cpui = {}
  if mods.Krastorio2 then
    cpui = {
      { type = "item", name = "se-holmium-cable", amount = 2 },
      silicon,
      spreader,
      { type = "item", name = "electronic-circuit", amount = 20 },
      { type = "item", name = "gold-ingot", amount = 1 },
      { type = "fluid", name = "sulfuric-acid", amount = 50 },
    }
  else
    cpui = {
      { type = "item", name = "se-holmium-cable", amount = 1 },
      silicon,
      spreader,
      { type = "item", name = "electronic-circuit", amount = 20 },
      { type = "item", name = "gold-ingot", amount = 1 },
      { type = "fluid", name = "sulfuric-acid", amount = 50 },
    }
  end
  data:extend({
    {
      type = "recipe",
      name = "cpu-holmium",
      icons = {
        { icon = "__base__/graphics/technology/advanced-circuit.png", icon_size = 256, },
        { icon = "__space-exploration-graphics__/graphics/icons/holmium-solenoid.png", icon_size = 64, scale=.25, shift={-8, -8} },
      },
      categories = {"crafting-with-fluid"},
      order = "d[cpu]",
      enabled = false,
      energy_required = 50,
      ingredients = cpui,
      results = {{type="item", name="cpu", amount=20}},
    },
  })
end

util.replace_ingredient("cpu", "electronic-circuit", "pcb", 10, false, {"force", true})
util.replace_ingredient("cpu-holmium", "electronic-circuit", "pcb", 20, false, {"force", true})
