function change_tech_prereq(technology, newprerequisites, ingredients)
  if data.raw.technology[technology] then
  local replaced = false
    for i, prereq in pairs(data.raw.technology[technology].prerequisites) do
        prereq = newprerequisites
		data.raw.technology[technology].prerequisites = prereq
    end
    for j, unit in pairs(data.raw.technology[technology].unit) do
        unit = data.raw.technology[technology].unit
        unit.ingredients = ingredients
        replaced = true
    end    
	return replaced
  else
      log("Technology " .. technology .. " does not exist.")
  end
end

-- Tweak Logistic Cargo Wagon TEchnology requisites

local logiwagon
logiwagon = change_tech_prereq("logistic-cargo-wagon", {"logistic-system" }, {{"automation-science-pack", 1}, {"logistic-science-pack", 1},})
   if not logiwagon then
      log("Logistic Cargo Wagon tweak failed")
   end