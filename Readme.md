# Q_eggs
Custom eggs for [pterodactyl.io](https://pterodactyl.io). 
Some of them work on ARM and also ARM form Oracle Free Tier

| Service | file* | AMD64 | ARM64 | ARM Oracle | More info |
|--|--|--|--|--|--|
| Gogs | [egg-gogs.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-gogs.json) | ✅ | ✅ | ✅ | Not ssl ready and on ARM use native ARM version
| Mumble server 1.3 | [egg-mumble-server1.3.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-mumble-server1.3.json) | ✅ | ❌ | ❌ |
| Mumble server 1.4| [egg-mumble-server1.4.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-mumble-server1.4.json) | ✅ | ❌ | ❌ |
| TeamSpeak3| [egg-teamspeak3-server-ARM64.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-teamspeak3-server-ARM64.json) | ❌ | ✅ | ✅ |
| Terraria Vanilla| [egg-terraria-vanilla-ARM64.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-terraria-vanilla-ARM64.json) | ❌ | ✅ | ✅ |
| Bedrock Vanilla| [egg-vanilla-bedrock.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-vanilla-bedrock.json) | ❌ | ✅ | ✅ | Works but slow startup |
| Terraria tShock| [egg-tshock-ARM64.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-tshock-ARM64.json) | ✅ | ✅ | ✅ | running with mono |
| beamMP| [egg-beamMP-servers-ARM64.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-beamMP-servers-ARM64.json) | ✅ | ✅ | ✅ | **Currently only version v3.0.1 and v3.0.2 work and in the  config.yml of the wings under installer_limites: memory must be at least 2048 anc cpu 125!!**  |
| Among Us - Impostor Server | [egg-among-us--impostor-server.json](https://raw.githubusercontent.com/QuintenQVD0/Q_eggs/main/egg-among-us--impostor-server.json) | ✅ | ✅ | ✅ | You MUST use Port 22023 for the Master Server. To host multiple servers, please read [Impostor Multiple Servers Documentation](https://github.com/Impostor/Impostor/blob/master/docs/Running-the-server.md#multiple-servers). 

*Right click and click save  
✅ - Working (Normal ARM was tested on Raspberry Pi)  
❔- Not tested yet but should work  
❌ - Don't work 
