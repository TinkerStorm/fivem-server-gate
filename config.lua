Config = {
	AllowAce = "servergate.whitelist", -- add_ace <group> % allow
    AllowGuests = true, -- for \/, otherwise refuse
	Guests = {
        -- "steam:1234567890abcdef",
        -- "license:1234567890abcdef1234567890abcdef",
        -- "xbl:???????????????",
        -- "live:???????????????",
        -- "discord:12345678901234567890",
        -- "ip:127.0.0.1",
        "steam:1100001026cba0c", -- Cobra
        "steam:110000111344e28", -- Techman
        "steam:1100001030a852d", -- Mek
        "steam:110000115fcf277", -- Timo
        "steam:110000104218f24", -- Lazlo
    },
    LogLevel = "DEBUG",
    LogColors = {
        ["DEBUG"] = 6,
        ["INFO"] = 4,
        ["WARN"] = 3,
        ["ERROR"] = 1,
    },
    Messages = {
        AceCheck = "^3Checking^7 ace permissions against ^9%s [%s]^7.", -- log:debug :: name, source
        AceAccept = "^2Accepted^7 ace permissions on ^9%s [%s]^7.", -- log:info :: name, source
        GuestCheck = "^3Checking^7 identifiers on ^9%s [%s]^7 for ^5guest access^7.", -- log:info :: name, source
        GuestIdentifier = "^4Found^7 identifier on ^9%s [%s]^7 for ^6%s^7 (^3%s^7)", -- log:debug :: name, source, service, identifier
		GuestAccept = "^2Accepted^7 ^9%s [%s]^7 as guest for identifier on ^6%s^7.", -- log:info :: name, source, service
        DeclineLog = "^1Declined^7 access to ^9%s [%s]^7. (^3%s^7)", -- log:warn :: name, source, types(, )
        DeclineReason = "[DECLINED] You are not permitted to join this server." -- setReason(reason) - no variables
    }
}