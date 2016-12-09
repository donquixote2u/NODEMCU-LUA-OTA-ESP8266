function checkWIFI()
  CONNECTED = false   -- reset wifi connect attempt status  
  if ( wifiTrys > NUMWIFITRYS ) then
    print("Sorry. Not able to connect")
  else
    ipAddr = wifi.sta.getip()
    if ( ( ipAddr == nil ) or ( ipAddr == "0.0.0.0" ) )then
     -- Reset alarm again
      tmr.alarm( 1 , 2500 , 0 , checkWIFI)
      print("Configuring WIFI....")
      wifi.setmode( wifi.STATION )
      wifi.sta.config( SSID , APPWD)
      wifi.sleeptype(wifi.MODEM_SLEEP)
      print("Checking WIFI..." .. wifiTrys)
      wifiTrys = wifiTrys + 1
    else 
     print("Wifi STA connected. IP:")
     print(wifi.sta.getip())
     wifiTrys=0
     tmr.stop(1)
     CONNECTED = true   -- set wifi connect attempt status
    end
  end
end
-- Wifi initialisation
tmr.alarm( 1 , 50, 0 , checkWIFI)

  
