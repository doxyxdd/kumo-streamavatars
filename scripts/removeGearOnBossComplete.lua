function removeGearOnBossComplete(users, boss_name, difficulty, result)
	log('Entering removeGearOnBossComplete for boss ' .. boss_name, "Users type: " .. type(users))
	if users == nil then
			return;
	end

	for i,user in pairs(users) do
		log('Clearing temporary gear for user ' .. user.displayName)
		user.clearAllTemporarySelections();
	end
end

return function()
	addEvent('bossBattleOutcome', 'removeGearOnBossComplete')
	keepAlive();
end
