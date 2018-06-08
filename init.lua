-- connect to WiFi access point

emoji = {}
emoji.degrees = "°"
emoji.moon_last_quarter = "🌜"
emoji.cloud = "☁"

ssid_name = string.format("%d%s %s %s", 17, emoji.degrees, emoji.cloud, emoji.moon_last_quarter)
print(ssid_name)

wifi.setmode(wifi.STATIONAP)
wifi.ap.config({ssid=ssid_name, auth=wifi.OPEN})
wifi.ap.setip({ip="192.168.1.1", netmask="255.255.255.0", gateway="192.168.1.1"})
wifi.ap.dhcp.config({start="192.168.1.100"})
wifi.ap.dhcp.start()
-- wifi.sta.config({ssid="RUGGERI"})
