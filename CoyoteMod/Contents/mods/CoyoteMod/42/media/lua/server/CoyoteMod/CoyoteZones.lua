--[[require "MetaGrid"

local function createAnimalPolyline(name, points, action)
    local grid = getWorld():getMetaGrid()

    local props = {
        Action = action,
        AnimalType = "coyote",
        SpawnAnimals = true,
		geometry = "polyline",
		points = points
    }

    -- bounding box
    local minX, minY = points[1], points[2]
    local maxX, maxY = minX, minY

    for i = 1, #points, 2 do
        local x, y = points[i], points[i+1]
        if x < minX then minX = x end
        if y < minY then minY = y end
        if x > maxX then maxX = x end
        if y > maxY then maxY = y end
    end

    local zone = grid:registerAnimalZone(
        name,
        "Animal",
        minX,
        minY,
        0,
        maxX - minX,
        maxY - minY,
        props
    )

    return zone
end

local function addCoyoteTestZones()

    local follow = createAnimalPolyline("CoyoteFollow_Test", {
        11233, 9686,
        11221, 9693,
        11227, 9707,
        11239, 9715,
        11260, 9711
    }, "Follow")

    local eat = createAnimalPolyline("CoyoteEat_Test", {
        11260, 9711,
        11269, 9719
    }, "Eat")

    local sleep = createAnimalPolyline("CoyoteSleep_Test", {
        11239, 9715,
        11235, 9701
    }, "Sleep")

    -- connexions (important!)
    if follow and eat then
        follow:addJunctionsWithOtherZone(eat)
    end

    if follow and sleep then
        follow:addJunctionsWithOtherZone(sleep)
    end
end

Events.OnLoadMapZones.Add(addCoyoteTestZones)--]]