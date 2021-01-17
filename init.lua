-- weather emojis

local emoji = {
    
    degrees = "°",

    -- day
    
    day_clear_sky = "☀️",
    day_few_clouds = "☀️☁️",
    
    -- night
    
    night_clear_sky = "🌙",
    night_few_clouds = "🌙☁️",
    
    -- generic
    
    scattered_clouds = "☁️",
    broken_clouds = "☁️☁️",
    shower_rain = "🌧️",
    rain = "☔",
    thunderstorm = "⚡",
    snow = "❄️",
    mist = "🌫️",

}

-- weather icon codes
-- https://openweathermap.org/weather-conditions

local code = {

    -- day

    ['01d'] = emoji.day_clear_sky,
    ['02d'] = emoji.day_few_clouds,
    ['03d'] = emoji.scattered_clouds,
    ['04d'] = emoji.broken_clouds,
    ['09d'] = emoji.shower_rain,
    ['10d'] = emoji.rain,
    ['11d'] = emoji.thunderstorm,
    ['13d'] = emoji.snow,
    ['50d'] = emoji.mist,

    -- night

    ['01n'] = emoji.night_clear_sky,
    ['02n'] = emoji.night_few_clouds,
    ['03n'] = emoji.scattered_clouds,
    ['04n'] = emoji.broken_clouds,
    ['09n'] = emoji.shower_rain,
    ['10n'] = emoji.rain,
    ['11n'] = emoji.thunderstorm,
    ['13n'] = emoji.snow,
    ['50n'] = emoji.mist,

}

-- iterate over whole table to get all keys
local keyset = {}
for k in pairs(code) do
    table.insert(keyset, k)
end
-- now you can reliably return a random key
character = code[keyset[math.random(#keyset)]]

ssid_name = string.format("%d%s %s", math.random(40), emoji.degrees, character)
print(ssid_name)

wifi.setmode(wifi.STATIONAP)
wifi.ap.config({ssid=ssid_name, auth=wifi.OPEN})
wifi.ap.setip({ip="192.168.1.1", netmask="255.255.255.0", gateway="192.168.1.1"})
wifi.ap.dhcp.config({start="192.168.1.100"})
wifi.ap.dhcp.start()

