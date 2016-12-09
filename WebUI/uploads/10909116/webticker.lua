-- get webpages and display 
function get_data()
setServer("IP","192.168.0.4")
setServer("NAME","alpha")
setServer("SUBDIR","shares/")
REQ="GetPage01.php" -- page ID
sendReq()           -- GET PAGE
end
-- check connected, ifnot then connect
ipAddr = wifi.sta.getip()
if ( ( ipAddr == nil ) or ( ipAddr == "0.0.0.0" ) ) then
   tmr.alarm( 1 , 200 , 0 , function() dofile("checkwifi.lua") end)
end
dofile("webclient.lua") -- load web page fetch routines 
-- allow sufficient time for wifi to start, then fire server
tmr.alarm( 2, 3000 , 0 , function() dofile("dualserver.lua"); end)
-- and get web feed
tmr.alarm( 6 , 5000 , 0 , function() get_data(); end )
tmr.alarm( 3 , 6000 , 0 , function() dofile("display.lua"); end)

