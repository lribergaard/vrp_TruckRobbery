resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'VRP Truck Robbery'

client_scripts {
    'lib/Proxy.lua',
	'lib/Tunnel.lua',
	'config.lua',
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
	'config.lua',
    'server.lua'
}
