local icon = require "icon"
local settings = require "settings"
local weather = require "weather"

local function config_dns()
    net.dns.setdnsserver(settings.dns.primary, 0)
    net.dns.setdnsserver(settings.dns.secondary, 1)
end

local function config_broadcast(ssid_name)
    wifi.setmode(wifi.SOFTAP)
    wifi.ap.config({ssid = ssid_name})

    print("Broadcasting SSID: " .. ssid_name)
end

local function on_weather_data(data)
    if data ~= nil then
        code = data.weather[1].icon
        emoji = icon.by_code[code]

        name = data.name
        if #name > 20 then name = name.sub(0, 20) end

        temp = data.main.temp

        ssid = string.format("%s %d° %s", name, temp, emoji)

        config_broadcast(ssid)
    end
end

local function on_got_ip(ip)
    print("Connected as: " .. ip)
    config_dns()
    weather.fetch(on_weather_data)
end

local function init_wifi()
    wifi.setmode(wifi.STATION)
    wifi.eventmon.register(
        wifi.eventmon.STA_GOT_IP,
        function (event) on_got_ip(event.IP) end
    )
end

local function connect_station()
    wifi.sta.config({
        ssid = settings.station.ssid,
        pwd = settings.station.password,
        save = false
    })
end

print("Starting...")

init_wifi()
connect_station()

tmr.softwd(settings.watch_dog)
