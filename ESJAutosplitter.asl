state("ElectronicSuperJoy") {
	int level : 0x00182004, 0x0;
}

startup {
	settings.Add("start", true, "Start on entering first level.");
	settings.Add("worlds", true, "Split for each world.");
	settings.Add("all_levels", false, "Split for every level.");
}

start {
	if (old.level == 63 && current.level == 1) {
		return settings["start"];
	}
}

split {
	// Level variable changes by the following list:
	// 1 2 3 5 4 6 8 7 9 from there the levels increment by 1, up to 50 being the end
	// Non-levels (not on menu): 2, 4, 7, 15, 17
	// World transitions: 19-20, 34-35, 49-50
	if (old.level == 2 && current.level == 3) {
		return settings["all_levels"];
	}
	if (old.level == 3 && current.level == 5) {
		return settings["all_levels"];
	}
	if (old.level == 5 && current.level == 4) {
		return settings["all_levels"];
	}
	if (old.level == 6 && current.level == 8) {
		return settings["all_levels"];
	}
	if (old.level == 8 && current.level == 7) {
		return settings["all_levels"];
	}
	if (old.level >= 9 && old.level <= 13 && current.level == old.level + 1) {
		return settings["all_levels"];
	}
	if (old.level == 14 && current.level == 15) {
		return settings["all_levels"];
	}
	if (old.level == 17 && current.level == 18) {
		return settings["all_levels"];
	}
	if (old.level >= 18 && old.level <= 50 && current.level == old.level + 1) {
		if (old.level == 19 || old.level == 34 || old.level == 49) {
			return settings["worlds"] || settings["all_levels"];
		}
		else {
			return settings["all_levels"];
		}
	}
}
