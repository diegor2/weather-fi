local icon = require "icon"
local secrets = require "secrets"
local weather = require "weather"

local function config_dns()
    net.dns.setdnsserver(secrets.dns.primary, 0)
    net.dns.setdnsserver(secrets.dns.secondary, 1)
end

local function config_broadcast(ssid_name)
    wifi.ap.config({
        ssid = ssid_name, 
        pwd = secrets.station.password,
        auth = wifi.WPA2_PSK
    })

    print("Broadcasting SSID: " .. ssid_name)
end

local function on_weather_data(data)
    if (data ~= nil) then
        print("icon: " , data.weather[1].icon)
        print("name: " , data.name)
        print("temp: " , data.main.temp)

        emoji = icon.by_code[data.weather[1].icon]

        print("emoji: ", emoji)

        ssid = string.format("%s %d° %s", data.name, data.main.temp, emoji)
        config_broadcast(ssid)
        print(ssid)
    end
end

local function on_got_ip(ip)
    print("Connected as: " .. ip) 
    config_dns()
    weather.fetch(on_weather_data)
end

local function init_wifi()
    wifi.setmode(wifi.STATIONAP)
    wifi.eventmon.register(
        wifi.eventmon.STA_GOT_IP, 
        function (event) on_got_ip(event.IP) end
    )
end

local function connect_station()
    wifi.sta.config({
        ssid = secrets.station.ssid,
        pwd = secrets.station.password,
        save = false
    })
end

print("Starting...")

init_wifi()
connect_station()
