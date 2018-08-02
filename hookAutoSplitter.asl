// Level variable does some weird stuff, possibly level assignments planned
// somewhat poorly. 15 and 13 are swapped, and starting at level 33 everything
// just gets out of hand.

// Also please ignore my horrible coding thanks.

state("Hook") {
	int level : 0x00182004, 0x0;
}

startup {
	settings.Add("level_2", true, "Start on entering level 2.");
	for (int i = 3; i <= 50; i++) {
		settings.Add("level_"+i, true, "Split on entering level "+i+".");
	}
	settings.Add("finish", true, "Split on end screen.");
}

start {
	if (old.level == 1 && current.level == 2) {
		return settings["level_2"];
	}
}

split {
	// Full order in memory:
	// 1 2 3 4 5 6 7 8 9 10 11 12 15 14 13 16 17 18 19 20 21 22 23 24 25 26 27
	// 28 29 30 31 32 34 35 36 37 38 39 42 45 50 43 44 52 40 46 48 51 49 47 53

	if (current.level <= 12) {
		// levels 2 through 12
		if (old.level + 1 == current.level && old.level != 1) {
			return settings["level_"+current.level];
		}
	}
	if (current.level == 15 && old.level == 12) {
		// level 13
		return settings["level_13"];
	}
	if (current.level == 14 && old.level == 15) {
		// level 14
		return settings["level_14"];
	}
	if (current.level == 13 && old.level == 14) {
		// level 15
		return settings["level_15"];
	}
	if (current.level == 16 && old.level == 13) {
		// level 16
		return settings["level_16"];
	}
	if (current.level >= 17 && current.level <= 32) {
		// levels 17 through 32
		if (old.level + 1 == current.level && old.level != 1) {
			return settings["level_"+current.level];
		}
	}
	if (current.level == 34 && old.level == 32) {
		// level 33
		return settings["level_33"];
	}
	if (current.level >= 35 && current.level <= 39) {
		// levels 34 through 38
		if (old.level + 1 == current.level && old.level != 1) {
			return settings["level_"+(current.level+1)];
		}
	}
	if (current.level == 42 && old.level == 39) {
		// level 39
		return settings["level_39"];
	}
	if (current.level == 45 && old.level == 42) {
		// level 40
		return settings["level_40"];
	}
	if (current.level == 50 && old.level == 45) {
		// level 41
		return settings["level_41"];
	}
	if (current.level == 43 && old.level == 50) {
		// level 42
		return settings["level_42"];
	}
	if (current.level == 44 && old.level == 43) {
		// level 43
		return settings["level_43"];
	}
	if (current.level == 52 && old.level == 44) {
		// level 44
		return settings["level_44"];
	}
	if (current.level == 40 && old.level == 52) {
		// level 45
		return settings["level_45"];
	}
	if (current.level == 46 && old.level == 40) {
		// level 46
		return settings["level_46"];
	}
	if (current.level == 48 && old.level == 46) {
		// level 47
		return settings["level_47"];
	}
	if (current.level == 51 && old.level == 48) {
		// level 48
		return settings["level_48"];
	}
	if (current.level == 49 && old.level == 51) {
		// level 49
		return settings["level_49"];
	}
	if (current.level == 47 && old.level == 49) {
		// level 50
		return settings["level_50"];
	}
	if (current.level == 53 && old.level == 47) {
		// game finish
		return settings["finish"];
	}
}