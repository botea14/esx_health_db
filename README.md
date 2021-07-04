# esx_health_db
ESX Script that allows you to save the players health on the database.
This is not my creation, just a change to esx_armour_db script. Didn't even changed functions name, only changed to save health.
Did this because I needed it for my server and ppl were asking money for this, so here is for free and for everyone.
Enjoy. Support me by joining on my [discord server](https://discord.gg/inewb)

# stop ESX to do health regen
This script also disables ESX function of health regeneration.
If you already got this working by another script, you should disable lines 3-8 from esx_health_db/client/client.lua

# Requirements

* [es_extended](https://github.com/ESX-Org/es_extended)
* [mysql-async](https://github.com/brouznouf/fivem-mysql-async)

# Install
1. Put esx_health_db folder inside resources folder of your srv.
2. Import health.sql into db
3. add esx_health_db into server.cfg (add as last esx resource)
4. Enjoy!