AddEventHandler("playerConnecting", function(name, setReason)
	log("DEBUG", Config.Messages.AceCheck, name, source)

	if IsPlayerAceAllowed(source, Config.AllowAce) then
		log("INFO", Config.Messages.AceAccept, name, source)
		return
	end

	-- A list of unique entries to be collected from the connecting user.
	-- This used if they fail to connect as part of the warning further down.
	local services = {}

	if Config.AllowGuests then
		local identifiers = GetPlayerIdentifiers(source)
		log("INFO", Config.Messages.GuestCheck, name, source)

		for index = 1, #identifiers do
			local service, identifier = splitIdentifier(identifiers[index])
			log("DEBUG", Config.Messages.GuestIdentifier, name, source, service, identifier)

			if table.includes(Config.Guests, identifiers[index]) then
				log("INFO", Config.Messages.GuestAccept, name, source, service)
				return
			end

			if not table.includes(services, service) then
				services[#services + 1] = service
			end
		end
	end

	log("WARN", Config.Messages.DeclineLog, name, source, table.concat(services, ", "))
	setReason(Config.Messages.DeclineReason)
	CancelEvent()
end)

LogLevels = {
	["DEBUG"] = 1,
	["INFO"] = 2,
	["WARN"] = 3,
	["ERROR"] = 4
}

function log(level, ...)
	-- if nil, don't log anything (equivalent to NONE if it were still a log level)
	if LogLevels[Config.LogLevel] == nil then return end
	if (LogLevels[Config.LogLevel] or LogLevels["WARN"]) <= LogLevels[level] then
  	local prefix = "^" .. (Config.LogColors[level] or 7) .. "[" .. level .. "]^7"
		print(prefix, string.format(...))
	end
end

function table.includes(array, value)
	for index = 1, #array do
		if array[index] == value then
	 		return true
		end
	end

	return false
end

function splitIdentifier(fragment)
	local index, _ = string.find(fragment, ":")
    
    local service = string.sub(fragment, 0, index - 1)
    local identifier = string.sub(fragment, index + 1, #fragment)
    
	return service, identifier
end