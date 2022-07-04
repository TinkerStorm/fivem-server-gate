fx_version "cerulean"
games { "gta4", "gta5", "rdr3" }
-- script has no specific reference to worldspace

name "Server Gate"
description "A resource to handle simple player access upon joining (whitelist / allowlist)."
version "1.0.0"
author "Junior"

github "https://github.com/TinkerStorm/fivem-server-gate"

server_script {
    "main.lua",
    "config.lua"
}