local gear_set = "class loadout";

-- class_name -> gear_name
local gear = {
	cohost = "radio host",
	["stitch-doctor"] = "stitch doctor",
  scrapper = "scrapper",
	["mojave-scout"] = "mojave scout",
	gardener = "gardener",
	["lantern-keeper"] = "lanternkeeper",
	["shrine-maiden"] = "shrine maiden"
};

-- Temp gear should be cleared at the end of the battle,
-- but this is a backup time limit just in case it doesn't.
local maxTempGearDurationSeconds = 60 * 20;


function temporaryGearEquipOnBossJoin(user, class_name)
	log('entering temporaryGearEquipOnBoss for class:' .. class_name);

	if class_name == nil or user == nil then
		return;
	end

	if gear[class_name] ~= nil then
		log('setting gear ' .. gear[class_name] .. ' for class ' .. class_name)
		user.setTemporaryGear(gear_set, gear[class_name], maxTempGearDurationSeconds);
	end

	log('boss player: ' .. user.displayName .. ' has joined as ' .. class_name);
end

return function()
  addEvent('bossBattlePlayerJoined', 'temporaryGearEquipOnBossJoin');
  keepAlive();
end
