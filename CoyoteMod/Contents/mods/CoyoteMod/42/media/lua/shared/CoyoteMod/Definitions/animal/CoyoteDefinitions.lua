AnimalDefinitions = AnimalDefinitions or {};

-- stages
AnimalDefinitions.stages = AnimalDefinitions.stages or {};
AnimalDefinitions.stages["coyote"] = {};
AnimalDefinitions.stages["coyote"].stages = {};
AnimalDefinitions.stages["coyote"].stages["coyotepup"] = {};
AnimalDefinitions.stages["coyote"].stages["coyotepup"].ageToGrow = 4 * 30; -- 4 months
AnimalDefinitions.stages["coyote"].stages["coyotepup"].nextStage = "coyotefemale";
AnimalDefinitions.stages["coyote"].stages["coyotepup"].nextStageMale = "coyotemale";
--AnimalDefinitions.stages["coyote"].stages["coyotepup"].minWeight = 0.1;
--AnimalDefinitions.stages["coyote"].stages["coyotepup"].maxWeight = 0.25;
AnimalDefinitions.stages["coyote"].stages["coyotefemale"] = {};
AnimalDefinitions.stages["coyote"].stages["coyotefemale"].ageToGrow = 2 * 30;
--AnimalDefinitions.stages["coyote"].stages["coyotefemale"].minWeight = 0.25;
--AnimalDefinitions.stages["coyote"].stages["coyotefemale"].maxWeight = 0.5;
AnimalDefinitions.stages["coyote"].stages["coyotemale"] = {}
AnimalDefinitions.stages["coyote"].stages["coyotemale"].ageToGrow = 2 * 30;
--AnimalDefinitions.stages["coyote"].stages["coyotemale"].minWeight = 0.25;
--AnimalDefinitions.stages["coyote"].stages["coyotemale"].maxWeight = 0.5;

-- genome
AnimalDefinitions.genome = AnimalDefinitions.genome or {};
AnimalDefinitions.genome["coyote"] = {};
AnimalDefinitions.genome["coyote"].genes = {};
AnimalDefinitions.genome["coyote"].genes["maxSize"] = "maxSize";
AnimalDefinitions.genome["coyote"].genes["meatRatio"] = "meatRatio";
AnimalDefinitions.genome["coyote"].genes["maxWeight"] = "maxWeight";
AnimalDefinitions.genome["coyote"].genes["lifeExpectancy"] = "lifeExpectancy";
AnimalDefinitions.genome["coyote"].genes["resistance"] = "resistance";
AnimalDefinitions.genome["coyote"].genes["strength"] = "strength";
AnimalDefinitions.genome["coyote"].genes["hungerResistance"] = "hungerResistance";
AnimalDefinitions.genome["coyote"].genes["thirstResistance"] = "thirstResistance";
AnimalDefinitions.genome["coyote"].genes["aggressiveness"] = "aggressiveness";
AnimalDefinitions.genome["coyote"].genes["ageToGrow"] = "ageToGrow";
AnimalDefinitions.genome["coyote"].genes["fertility"] = "fertility"
AnimalDefinitions.genome["coyote"].genes["stress"] = "stress";

-- breeds
AnimalDefinitions.breeds = AnimalDefinitions.breeds or {};
AnimalDefinitions.breeds["coyote"] = {};
AnimalDefinitions.breeds["coyote"].breeds = {};
AnimalDefinitions.breeds["coyote"].breeds["eastern"] = {};
AnimalDefinitions.breeds["coyote"].breeds["eastern"].name = "eastern";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].texture = "Coyote";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].textureMale = "Coyote";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].rottenTexture = "Coyote_Rotting";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].textureBaby = "CoyotePup";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconMale = "media/textures/Item_Coyote_Pup.png";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconFemale = "media/textures/Item_Coyote_Pup.png";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconBaby = "media/textures/Item_Coyote_Pup.png";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconMaleDead = "Item_Coyote_Dead";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconFemaleDead = "Item_Coyote_Dead";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconBabyDead = "Item_Coyote_Pup_Dead";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconMaleSkel = "Item_Skeleton_Coyote";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconFemaleSkel = "Item_Skeleton_Coyote";
AnimalDefinitions.breeds["coyote"].breeds["eastern"].invIconBabySkel = "Item_Skeleton_Coyote_Pup";

-- animals
AnimalDefinitions.animals = AnimalDefinitions.animals or {};

AnimalDefinitions.animals["coyotepup"] = { };
AnimalDefinitions.animals["coyotepup"].bodyModel = "CoyoteMod.CoyotePup";
AnimalDefinitions.animals["coyotepup"].bodyModelSkel = "CoyoteMod.CoyotePup_Skeleton";
AnimalDefinitions.animals["coyotepup"].textureSkeleton = "Coyote_Skeleton";
AnimalDefinitions.animals["coyotepup"].textureSkeletonBloody = "Coyote_Skeleton_Butchered";
AnimalDefinitions.animals["coyotepup"].bodyModelSkelNoHead = "CoyoteMod.CoyotePup_Skeleton_NoHead";
AnimalDefinitions.animals["coyotepup"].animset = "fawn";
AnimalDefinitions.animals["coyotepup"].animalSize = 0.1;
AnimalDefinitions.animals["coyotepup"].modelscript = "CoyoteMod.CoyotePup";
AnimalDefinitions.animals["coyotepup"].shadoww = 0.4;
AnimalDefinitions.animals["coyotepup"].shadowfm = 1;
AnimalDefinitions.animals["coyotepup"].shadowbm = 1;
AnimalDefinitions.animals["coyotepup"].wanderMul = 300;
AnimalDefinitions.animals["coyotepup"].breeds = copyTable(AnimalDefinitions.breeds["coyote"].breeds);
AnimalDefinitions.animals["coyotepup"].stages = AnimalDefinitions.stages["coyote"].stages;
AnimalDefinitions.animals["coyotepup"].genes = AnimalDefinitions.genome["coyote"].genes;
AnimalDefinitions.animals["coyotepup"].minSize = 0.85;
AnimalDefinitions.animals["coyotepup"].maxSize = 1.2;
AnimalDefinitions.animals["coyotepup"].sitRandomly = true;
AnimalDefinitions.animals["coyotepup"].idleTypeNbr = 3;
AnimalDefinitions.animals["coyotepup"].wild = true; -- wild animal will have some other behavior, they don't require to eat/drink and will always flee humans
AnimalDefinitions.animals["coyotepup"].spottingDist = 15; -- distance at which the animal will spot a human/zombie
AnimalDefinitions.animals["coyotepup"].group = "coyote";
AnimalDefinitions.animals["coyotepup"].canBeAlerted = true;
AnimalDefinitions.animals["coyotepup"].canBeDomesticated = false;
AnimalDefinitions.animals["coyotepup"].canThump = false;
AnimalDefinitions.animals["coyotepup"].corpseSize = 1.5;
AnimalDefinitions.animals["coyotepup"].minBlood = 200;
AnimalDefinitions.animals["coyotepup"].maxBlood = 600;
AnimalDefinitions.animals["coyotepup"].trailerBaseSize = 100;
AnimalDefinitions.animals["coyotepup"].minWeight = 15;
AnimalDefinitions.animals["coyotepup"].maxWeight = 100;
AnimalDefinitions.animals["coyotepup"].wildFleeTimeUntilDeadTimer = 300; -- this will be used as a random timer to make the animal drop dead once you shot him, he'll flee and drop lots of blood before dropping dead, it's lowered by the aiming skill
AnimalDefinitions.animals["coyotepup"].feedByHandAnim = "AnimalLureLow";

AnimalDefinitions.animals["coyotefemale"] = {};
AnimalDefinitions.animals["coyotefemale"].bodyModel = "CoyoteMod.Coyote";
AnimalDefinitions.animals["coyotefemale"].bodyModelSkel = "CoyoteMod.Coyote_Skeleton";
AnimalDefinitions.animals["coyotefemale"].textureSkeleton = "Coyote_Skeleton";
AnimalDefinitions.animals["coyotefemale"].textureSkeletonBloody = "Coyote_Skeleton_Butchered";
AnimalDefinitions.animals["coyotefemale"].bodyModelSkelNoHead = "CoyoteMod.Coyote_Skeleton_NoHead";
AnimalDefinitions.animals["coyotefemale"].animset = "buck";
AnimalDefinitions.animals["coyotefemale"].modelscript = "CoyoteMod.Coyote";
AnimalDefinitions.animals["coyotefemale"].bodyModelHeadless = "CoyoteMod.Coyote_Headless";
AnimalDefinitions.animals["coyotefemale"].textureSkinned = "Coyote_Skinned";
AnimalDefinitions.animals["coyotefemale"].shadoww = 0.7;
AnimalDefinitions.animals["coyotefemale"].shadowfm = 1.5;
AnimalDefinitions.animals["coyotefemale"].shadowbm = 1.5;
AnimalDefinitions.animals["coyotefemale"].minSize = 0.85;
AnimalDefinitions.animals["coyotefemale"].maxSize = 1.2;
AnimalDefinitions.animals["coyotefemale"].animalSize = 0.3;
AnimalDefinitions.animals["coyotefemale"].breeds = AnimalDefinitions.breeds["coyote"].breeds;
AnimalDefinitions.animals["coyotefemale"].stages = AnimalDefinitions.stages["coyote"].stages;
AnimalDefinitions.animals["coyotefemale"].genes = AnimalDefinitions.genome["coyote"].genes;
AnimalDefinitions.animals["coyotefemale"].mate = "coyotemale";
AnimalDefinitions.animals["coyotefemale"].minAge = AnimalDefinitions.stages["coyote"].stages["coyotepup"].ageToGrow;
AnimalDefinitions.animals["coyotefemale"].maxAgeGeriatric = 19 * 30;
AnimalDefinitions.animals["coyotefemale"].minAgeForBaby = 10;
AnimalDefinitions.animals["coyotefemale"].pregnantPeriod = 1;
AnimalDefinitions.animals["coyotefemale"].babyType = "coyotepup";
AnimalDefinitions.animals["coyotefemale"].wanderMul = 500;
AnimalDefinitions.animals["coyotefemale"].sitRandomly = true;
AnimalDefinitions.animals["coyotefemale"].idleTypeNbr = 3;
AnimalDefinitions.animals["coyotefemale"].wild = true;
AnimalDefinitions.animals["coyotefemale"].spottingDist = 19;
AnimalDefinitions.animals["coyotefemale"].group = "coyote";
AnimalDefinitions.animals["coyotefemale"].canBeAlerted = true; -- can play the "alerted" animation before running away when spot a player
AnimalDefinitions.animals["coyotefemale"].canBeDomesticated = false;
AnimalDefinitions.animals["coyotefemale"].canThump = false;
AnimalDefinitions.animals["coyotefemale"].corpseSize = 2.5;
AnimalDefinitions.animals["coyotefemale"].minBlood = 800;
AnimalDefinitions.animals["coyotefemale"].maxBlood = 2500;
AnimalDefinitions.animals["coyotefemale"].female = true;
AnimalDefinitions.animals["coyotefemale"].trailerBaseSize = 300;
AnimalDefinitions.animals["coyotefemale"].minWeight = 110;
AnimalDefinitions.animals["coyotefemale"].maxWeight = 200;
AnimalDefinitions.animals["coyotefemale"].wildFleeTimeUntilDeadTimer = 700;
AnimalDefinitions.animals["coyotefemale"].feedByHandAnim = "AnimalLureHigh";

AnimalDefinitions.animals["coyotemale"] = {};
AnimalDefinitions.animals["coyotemale"].bodyModel = "CoyoteMod.Coyote";
AnimalDefinitions.animals["coyotemale"].bodyModelSkel = "CoyoteMod.Coyote_Skeleton";
AnimalDefinitions.animals["coyotemale"].textureSkeleton = "Coyote_Skeleton";
AnimalDefinitions.animals["coyotemale"].textureSkeletonBloody = "Coyote_Skeleton_Butchered";
AnimalDefinitions.animals["coyotemale"].bodyModelSkelNoHead = "CoyoteMod.Coyote_Skeleton_NoHead";
AnimalDefinitions.animals["coyotemale"].animset = "buck";
AnimalDefinitions.animals["coyotemale"].modelscript = "CoyoteMod.Coyote";
AnimalDefinitions.animals["coyotemale"].bodyModelHeadless = "CoyoteMod.Coyote_Headless";
AnimalDefinitions.animals["coyotemale"].textureSkinned = "Coyote_Skinned";
AnimalDefinitions.animals["coyotemale"].shadoww = 0.7;
AnimalDefinitions.animals["coyotemale"].shadowfm = 1.5;
AnimalDefinitions.animals["coyotemale"].shadowbm = 1.5;
AnimalDefinitions.animals["coyotemale"].minSize = 0.85;
AnimalDefinitions.animals["coyotemale"].maxSize = 1.2;
AnimalDefinitions.animals["coyotemale"].animalSize = 0.3;
AnimalDefinitions.animals["coyotemale"].breeds = copyTable(AnimalDefinitions.breeds["coyote"].breeds);
AnimalDefinitions.animals["coyotemale"].stages = AnimalDefinitions.stages["coyote"].stages;
AnimalDefinitions.animals["coyotemale"].genes = AnimalDefinitions.genome["coyote"].genes;
AnimalDefinitions.animals["coyotemale"].mate = "coyotefemale";
AnimalDefinitions.animals["coyotemale"].minAge = AnimalDefinitions.stages["coyote"].stages["coyotepup"].ageToGrow;
AnimalDefinitions.animals["coyotemale"].maxAgeGeriatric = 19 * 30;
AnimalDefinitions.animals["coyotemale"].minAgeForBaby = 10;
AnimalDefinitions.animals["coyotemale"].babyType = AnimalDefinitions.animals["coyotefemale"].babyType;
AnimalDefinitions.animals["coyotemale"].wanderMul = 500;
AnimalDefinitions.animals["coyotemale"].sitRandomly = true;
AnimalDefinitions.animals["coyotemale"].idleTypeNbr = 3;
AnimalDefinitions.animals["coyotemale"].wild = true;
AnimalDefinitions.animals["coyotemale"].spottingDist = AnimalDefinitions.animals["coyotefemale"].spottingDist;
AnimalDefinitions.animals["coyotemale"].group = "coyote";
AnimalDefinitions.animals["coyotemale"].canBeAlerted = true;
AnimalDefinitions.animals["coyotemale"].canBeDomesticated = false;
AnimalDefinitions.animals["coyotemale"].canThump = false;
AnimalDefinitions.animals["coyotemale"].corpseSize = AnimalDefinitions.animals["coyotefemale"].corpseSize;
AnimalDefinitions.animals["coyotemale"].minBlood = 800;
AnimalDefinitions.animals["coyotemale"].maxBlood = 2500;
AnimalDefinitions.animals["coyotemale"].male = true;
AnimalDefinitions.animals["coyotemale"].trailerBaseSize = 300;
AnimalDefinitions.animals["coyotemale"].minWeight = 110;
AnimalDefinitions.animals["coyotemale"].maxWeight = 200;
AnimalDefinitions.animals["coyotemale"].wildFleeTimeUntilDeadTimer = 800;
AnimalDefinitions.animals["coyotemale"].feedByHandAnim = AnimalDefinitions.animals["coyotefemale"].feedByHandAnim;

local coyotepup_sounds = {
	death = { name = "AnimalVoiceBabyRaccoonDeath", slot = "voice", priority = 100 },
	fallover = { name = "AnimalFoleyBabyRaccoonBodyfall" },
	idle = { name = "AnimalVoiceBabyRaccoonIdle", intervalMin = 10, intervalMax = 20, slot = "voice" },
	pain = { name = "AnimalVoiceBabyRaccoonPain", slot = "voice", priority = 50 },
	pick_up = { name = "PickUpAnimalBabyRaccoon", slot = "voice", priority = 1 },
	pick_up_corpse = { name = "PickUpAnimalDeadBabyRaccoon" },
	put_down = { name = "PutDownAnimalBabyRacoon", slot = "voice", priority = 1 },
	put_down_corpse = { name = "PutDownAnimalDeadBabyRaccoon" },
	runloop = { name = "AnimalFootstepsBabyRaccoonRun", slot = "runloop" },
	stressed = { name = "AnimalVoiceBabyRaccoonStressed", intervalMin = 5, intervalMax = 10, slot = "voice" },
	walkBack = { name = "AnimalFootstepsBabyRaccoonWalkBack" },
	walkFront = { name = "AnimalFootstepsBabyRaccoonWalkFront" },
}

AnimalDefinitions.animals["coyotepup"].breeds["eastern"].sounds = coyotepup_sounds

local coyotefemale_sounds = {
	death = { name = "AnimalVoiceRaccoonDeath", slot = "voice", priority = 100 },
	fallover = { name = "AnimalFoleyRaccoonBodyfall" },
	idle = { name = "AnimalVoiceRaccoonIdle", intervalMin = 10, intervalMax = 20, slot = "voice" },
	pain = { name = "AnimalVoiceRaccoonPain", slot = "voice", priority = 50 },
	pick_up = { name = "PickUpAnimalRaccoon", slot = "voice", priority = 1 },
	pick_up_corpse = { name = "PickUpAnimalDeadRaccoon" },
	put_down = { name = "PutDownAnimalRaccoon", slot = "voice", priority = 1 },
	put_down_corpse = { name = "PutDownAnimalDeadRaccoon" },
	runloop = { name = "AnimalFootstepsRaccoonRun", slot = "runloop" },
	stressed = { name = "AnimalVoiceRaccoonStressed", intervalMin = 5, intervalMax = 10, slot = "voice" },
	walkBack = { name = "AnimalFootstepsRaccoonWalkBack" },
	walkFront = { name = "AnimalFootstepsRaccoonWalkFront" },
}

AnimalDefinitions.animals["coyotefemale"].breeds["eastern"].sounds = coyotefemale_sounds

AnimalDefinitions.animals["coyotemale"].breeds["eastern"].sounds = coyotefemale_sounds