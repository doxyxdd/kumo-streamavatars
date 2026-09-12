local gear = {
	mojave_scout = "mojave-scout",
	gardener = "gardener",
	lantern_keeper = "lantern-keeper",
	radio_cohost = "radio-cohost",
	shrine_maiden = "shrine-maiden"
};


function temporaryGearEquipOnBossJoin(user, class_name)
	log('entering temporaryGearEquipOnBoss for class:' .. class_name);

	if class_name == nil or user == nil then
		return;
	end

	if gear[class_name] ~= nil then
		log('setting gear ' .. gear[class_name] .. ' for class ' .. class_name)
		user.setTemporaryGear('classes', gear[class_name], 1200);
	end

	log('boss player: ' .. user.displayName .. ' has joined as ' .. class_name);
end

return function()
  addEvent('bossBattlePlayerJoined', 'temporaryGearEquipOnBossJoin');
  keepAlive();
end
