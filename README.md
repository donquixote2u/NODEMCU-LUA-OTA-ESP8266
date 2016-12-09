# ESPLoader v3 -  INCOMPLETE - IN DEVELOPMENT 10/12/16!

This is a cut-down version of the ESP8266 OTA system extended by Lukas Koval 
https://github.com/kovi44/NODEMCU-LUA-OTA-ESP8266
from a basic core by Roland Durden  - https://github.com/RoboDurden/ESPLoad

I have removed his initial config using the ESP8266 as a server, and the relevant lua code from the ESP8266 manifest; so my version requires
the s.txt config file resident on the ESP8266 to be initialise correctly when loaded onto the ESP8266.

The following documentation is  retained pretty much verbatim from Rolands version, apart from ESP8266 init steps which are no longer used; instead, edit s.txt appropriately.


![alt tag](https://raw.githubusercontent.com/kovi44/NODEMCU-LUA-OTA-ESP8266/master/screenshots/gui_edit.png)


The main goal was to update ESP8266 with nodemcu firmware easily using my server.
Basic description how it works:

0. Enter all required fields such as essid, password, host, domain, path and update interval (minutes) in file s.txt.
1. Save all necessary files to ESP  
4. ESP will boot , find the config as s.txt load all variables and find that no scripts were downloaded yet, so it start the client to download it from server
5. client script will be run. it will connect to server, get the list of files to be downloaded and then download each of them, compile
6. After succesfull download the esp will restart and start the downloaded script and also check periodically for new update.

How to install it:
Using ESPlorer or another tool upload init.lua, client.lua and s.txt to the esp
You should configure a webserver and create there a folder /esp/ and copy all files from folder WebUI to that folder. Import sql database to your mysql server (folder sql, filename: esp.sql). Edit config.php and insert your db credentials.
If everything is OK you should be able to access management UI http://ip_of_your_server/esp/ There one can find a sample configuration. 

parametrs are stored in s.txt and it includes

host=   -ip of your webserver

path=   -folder where you place the server php scripts (in my case it's esp folder)

ssid=   -your AP essid

pwd=	-pasword to your wifi

err=	-used for error log

boot=   -define which file must be executed 

domain=	-your webserver domain

update= -define the period of time when the esp will check for new upgrade files (defined in minutes)


Sample config (do it via web gui in AP mode)
host=192.168.0.1
path=esp
ssid=my_wifi
pwd=my_pass123
err=
boot=
domain=mydomain.com
update=60

As soon as you configure basic configuration to your esp8266, open management UI on your server, create a new node, use the chipid you copy and add some files you can you use simple script2.lua stored in WebUI_MNG/uploads/script2.lua Please note that you should mark the file with boot flag (if not then first file will be used as bootscript(it's a lua script which will be start automatically)). 
Using the UI you are able also edit script files and also do remote upgrade. To upgrade the esp just use UPDATE button. Heartbeat info show you the timestamp of last update check of your esp. If Update is marked as Yes, then next time the esp will be updated.

There still a lot of work to do, bugfix, optimize the code, .... 

Hope you will enjoy it

For more details your emails are welcome - esp_ota(a)k0val.sk

