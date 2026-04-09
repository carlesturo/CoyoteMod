--[ Used to define the animals parts you'll get when butchering it. --]

AnimalPartsDefinitions = AnimalPartsDefinitions or {};
AnimalPartsDefinitions.animals = AnimalPartsDefinitions.animals or {};

local coyotepupparts = {};
table.insert(coyotepupparts, {item = "CoyoteMod.Coyote_Steak", minNb = 2, maxNb = 4})
table.insert(coyotepupparts, {item = "CoyoteMod.Coyote_Loin", minNb = 0, maxNb = 1})
table.insert(coyotepupparts, {item = "Base.AnimalSinew", minNb = 1, maxNb = 2})

local coyoteparts = {};
table.insert(coyoteparts, {item = "CoyoteMod.Coyote_Steak", minNb = 4, maxNb = 8})
table.insert(coyoteparts, {item = "CoyoteMod.Coyote_Loin", minNb = 2, maxNb = 4})
table.insert(coyoteparts, {item = "Base.AnimalSinew", minNb = 3, maxNb = 5})

--- EASTERN
local coyotefemaleeastern = AnimalPartsDefinitions.animals["coyotefemaleeastern"] or {};
coyotefemaleeastern.parts = coyotefemaleeastern.parts or coyoteparts;
coyotefemaleeastern.bones = coyotefemaleeastern.bones or {};
table.insert(coyotefemaleeastern.bones, {item = "Base.SmallAnimalBone", minNb = 2, maxNb = 4})
table.insert(coyotefemaleeastern.bones, {item = "Base.AnimalBone", minNb = 3, maxNb = 7})
table.insert(coyotefemaleeastern.bones, {item = "Base.LargeAnimalBone", minNb = 1, maxNb = 2})
coyotefemaleeastern.leather = "CoyoteMod.CoyoteLeather_Full";
coyotefemaleeastern.head = "CoyoteMod.CoyoteFemale_Head";
coyotefemaleeastern.skull = "CoyoteMod.CoyoteFemale_Skull";
coyotefemaleeastern.xpPerItem = 10;
AnimalPartsDefinitions.animals["coyotefemaleeastern"] = coyotefemaleeastern;

local coyotemaleeastern = AnimalPartsDefinitions.animals["coyotemaleeastern"] or {};
coyotemaleeastern.parts = coyotemaleeastern.parts or coyoteparts;
coyotemaleeastern.bones = coyotemaleeastern.bones or {};
table.insert(coyotemaleeastern.bones, {item = "Base.SmallAnimalBone", minNb = 2, maxNb = 4})
table.insert(coyotemaleeastern.bones, {item = "Base.AnimalBone", minNb = 3, maxNb = 7})
table.insert(coyotemaleeastern.bones, {item = "Base.LargeAnimalBone", minNb = 1, maxNb = 2})
coyotemaleeastern.leather = "CoyoteMod.CoyoteLeather_Full";
coyotemaleeastern.head = "CoyoteMod.CoyoteMale_Head";
coyotemaleeastern.skull = "CoyoteMod.CoyoteMale_Skull";
coyotemaleeastern.xpPerItem = 10;
AnimalPartsDefinitions.animals["coyotemaleeastern"] = coyotemaleeastern;

local coyotepupeastern = AnimalPartsDefinitions.animals["coyotepupeastern"] or {};
coyotepupeastern.parts = coyotepupeastern.parts or coyotepupparts;
coyotepupeastern.bones = coyotepupeastern.bones or {};
table.insert(coyotepupeastern.bones, {item = "Base.SmallAnimalBone", minNb = 5, maxNb = 10})
table.insert(coyotepupeastern.bones, {item = "Base.AnimalBone", minNb = 0, maxNb = 2})
coyotepupeastern.leather = "CoyoteMod.CoyotePupLeather_Full";
coyotepupeastern.head = "CoyoteMod.CoyotePup_Head";
coyotepupeastern.skull = "CoyoteMod.CoyotePup_Skull";
coyotepupeastern.xpPerItem = 6;
AnimalPartsDefinitions.animals["coyotepupeastern"] = coyotepupeastern;

----- This is used to alter the meat given by the animals
----- So we can give more or less "prime" meat depending on skills/animal stats
--- the order has an importance here, the first of the list will be checked first, some maths to explain:
--- * the total % is 100, if we roll to give 20 meats, we first check the first in the list, if the baseChance is 10% (i'm not adding the skill/animal stats to simplify here) you'll have 2 of the first meat (prime cut)
--- * the remaining is then 90%, the remaining meat is 18, we roll the 2nd item, if the baseChance is 30, we'll give 90/30 = 2.7, which means in term of number of meat: 18*0.27 = 4.86 (5) meats of the 2nd category (medium cut)
--- * we have then 20 - 2 - 5 = 13 meat to give (poor cut)
--- item = the item that'll be given (it's always the same so we can simplify all the cooking recipes)
--- baseChance = the base chance of having this item given, it'll be multiplied by butchering skill and stats of the animal
--- hungerBoost = we take the base hunger of the given item and multiply it by this number (also influenced by animal stats)
--- baseName = will be the first name of the item, that + extraName will give something like Beef (Prime Cut) (Beef being baseName, extraName being (Prime Cut)
--- extraName = will be added to the item name, the full name is found in IGUI_AnimalMeat
--[[
AnimalPartsDefinitions.meat = AnimalPartsDefinitions.meat or {};
AnimalPartsDefinitions.meat["Base.Beef"] = AnimalPartsDefinitions.meat["Base.Beef"] or {};
AnimalPartsDefinitions.meat["Base.Beef"].variants = AnimalPartsDefinitions.meat["Base.Beef"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.Beef"].variants, {item = "Base.Beef", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Beef", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Beef"].variants, {item = "Base.Beef", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Beef", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Beef"].variants, {item = "Base.Beef", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Beef", extraName = "IGUI_AnimalMeat_PoorCut"}) -- no need baseChance here as it's the last

AnimalPartsDefinitions.meat["Base.Steak"] = AnimalPartsDefinitions.meat["Base.Steak"] or {};
AnimalPartsDefinitions.meat["Base.Steak"].variants = AnimalPartsDefinitions.meat["Base.Steak"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.Steak"].variants, {item = "Base.Steak", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Steak", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Steak"].variants, {item = "Base.Steak", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Steak", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Steak"].variants, {item = "Base.Steak", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Steak", extraName = "IGUI_AnimalMeat_PoorCut"}) -- no need baseChance here as it's the last

AnimalPartsDefinitions.meat["Base.Pork"] = AnimalPartsDefinitions.meat["Base.Pork"] or {};
AnimalPartsDefinitions.meat["Base.Pork"].variants = AnimalPartsDefinitions.meat["Base.Pork"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.Pork"].variants, {item = "Base.Pork", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Pork", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Pork"].variants, {item = "Base.Pork", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Pork", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Pork"].variants, {item = "Base.Pork", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Pork", extraName = "IGUI_AnimalMeat_PoorCut"}) -- no need baseChance here as it's the last

AnimalPartsDefinitions.meat["Base.PorkChop"] = AnimalPartsDefinitions.meat["Base.PorkChop"] or {};
AnimalPartsDefinitions.meat["Base.PorkChop"].variants = AnimalPartsDefinitions.meat["Base.PorkChop"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.PorkChop"].variants, {item = "Base.PorkChop", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_PorkChop", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.PorkChop"].variants, {item = "Base.PorkChop", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_PorkChop", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.PorkChop"].variants, {item = "Base.PorkChop", hungerBoost = 1, baseName = "IGUI_AnimalMeat_PorkChop", extraName = "IGUI_AnimalMeat_PoorCut"}) -- no need baseChance here as it's the last

AnimalPartsDefinitions.meat["Base.MuttonChop"] = AnimalPartsDefinitions.meat["Base.MuttonChop"] or {};
AnimalPartsDefinitions.meat["Base.MuttonChop"].variants = AnimalPartsDefinitions.meat["Base.MuttonChop"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.MuttonChop"].variants, {item = "Base.MuttonChop", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Mutton", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.MuttonChop"].variants, {item = "Base.MuttonChop", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Mutton", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.MuttonChop"].variants, {item = "Base.MuttonChop", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Mutton", extraName = "IGUI_AnimalMeat_PoorCut"})

AnimalPartsDefinitions.meat["Base.Rabbitmeat"] = AnimalPartsDefinitions.meat["Base.Rabbitmeat"] or {};
AnimalPartsDefinitions.meat["Base.Rabbitmeat"].variants = AnimalPartsDefinitions.meat["Base.Rabbitmeat"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.Rabbitmeat"].variants, {item = "Base.Rabbitmeat", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Rabbit", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Rabbitmeat"].variants, {item = "Base.Rabbitmeat", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Rabbit", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Rabbitmeat"].variants, {item = "Base.Rabbitmeat", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Rabbit", extraName = "IGUI_AnimalMeat_PoorCut"})

AnimalPartsDefinitions.meat["Base.Venison"] = AnimalPartsDefinitions.meat["Base.Venison"] or {};
AnimalPartsDefinitions.meat["Base.Venison"].variants = AnimalPartsDefinitions.meat["Base.Venison"].variants or {};
table.insert(AnimalPartsDefinitions.meat["Base.Venison"].variants, {item = "Base.Venison", baseChance = 20, hungerBoost = 3, baseName = "IGUI_AnimalMeat_Venison", extraName = "IGUI_AnimalMeat_PrimeCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Venison"].variants, {item = "Base.Venison", baseChance = 50, hungerBoost = 2, baseName = "IGUI_AnimalMeat_Venison", extraName = "IGUI_AnimalMeat_MediumCut"})
table.insert(AnimalPartsDefinitions.meat["Base.Venison"].variants, {item = "Base.Venison", hungerBoost = 1, baseName = "IGUI_AnimalMeat_Venison", extraName = "IGUI_AnimalMeat_PoorCut"}) -- no need baseChance here as it's the last
--]]