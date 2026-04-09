AnimalTracksDefinitions = AnimalTracksDefinitions or {};

--[[AnimalTracksDefinitions.trackType["fleshfeed"] = {};
AnimalTracksDefinitions.trackType["fleshfeed"].name = "fleshfeed";
AnimalTracksDefinitions.trackType["fleshfeed"].sprite = "bends_natural_01_85";
AnimalTracksDefinitions.trackType["fleshfeed"].actionType = "eat";
AnimalTracksDefinitions.trackType["fleshfeed"].chanceToFindTrack = 100;
AnimalTracksDefinitions.trackType["fleshfeed"].minskill = 1;--]]

AnimalTracksDefinitions.animallist = {};
AnimalTracksDefinitions.animallist["coyote"] = {}; -- "deer" should correspond to the migration group (see MigrationGroupDefinitions.lua)
AnimalTracksDefinitions.animallist["coyote"].tracks = {}; -- define all tracks this animal can leave
AnimalTracksDefinitions.animallist["coyote"].tracks["footstep"] = copyTable(AnimalTracksDefinitions.trackType["footstep"]);
--AnimalTracksDefinitions.animallist["coyote"].tracks["footstep"].sprites = {NE = "animaltracks_coyote_0", SW = "animaltracks_coyote_1", NW = "animaltracks_coyote_2", SE = "animaltracks_coyote_3", S = "animaltracks_coyote_4", N = "animaltracks_coyote_5", E = "animaltracks_coyote_6", W = "animaltracks_coyote_7"}; -- sprites is used as a list when we have directions, otherwise use simple "sprite"
AnimalTracksDefinitions.animallist["coyote"].tracks["poop"] = copyTable(AnimalTracksDefinitions.trackType["poop"]);
AnimalTracksDefinitions.animallist["coyote"].tracks["poop"].item = "CoyoteMod.Dung_Coyote";
AnimalTracksDefinitions.animallist["coyote"].tracks["brokentwigs"] = copyTable(AnimalTracksDefinitions.trackType["brokentwigs"]);
AnimalTracksDefinitions.animallist["coyote"].tracks["brokentwigs"].item = "Base.Twigs";
AnimalTracksDefinitions.animallist["coyote"].tracks["herbgraze"] = copyTable(AnimalTracksDefinitions.trackType["herbgraze"]);
AnimalTracksDefinitions.animallist["coyote"].tracks["flattenedherb"] = copyTable(AnimalTracksDefinitions.trackType["flattenedherb"]);
AnimalTracksDefinitions.animallist["coyote"].tracks["fur"] = copyTable(AnimalTracksDefinitions.trackType["fur"]);
AnimalTracksDefinitions.animallist["coyote"].tracks["fur"].item = "Base.FurTuft_Brownlight";
AnimalTracksDefinitions.animallist["coyote"].skillToIdentify = 4; -- min tracking skill required to know exactly what the animal left that track, if under this skill, check "trackType"
AnimalTracksDefinitions.animallist["coyote"].trackType = "large"; -- if you don't have min tracking skill to properly identify this track, it'll say "large animal footstep" or "large animal poop" etc. can be large, medium or small.
AnimalTracksDefinitions.animallist["coyote"].trackChance = {}; -- during each action we have a chance to drop a track
AnimalTracksDefinitions.animallist["coyote"].trackChance["walk"] = 800; -- per tick
AnimalTracksDefinitions.animallist["coyote"].trackChance["eat"] = 200;
AnimalTracksDefinitions.animallist["coyote"].trackChance["sleep"] = 100;
AnimalTracksDefinitions.animallist["coyote"].chanceToFindTrack = 100; -- this is added to the trackType.chance, it's done each tick, the higher number the harder is it to find a track, this is lowered by tracking skill.