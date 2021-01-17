local settings = require "settings"

local q = settings.openweathermap.location
local k = settings.openweathermap.key
local u = settings.openweathermap.units
local l = settings.openweathermap.language

local url = "http://api.openweathermap.org/data/2.5/weather?q=" .. q .. "&appid=" .. k .. "&units=" .. u .. "&lang=" .. l

local function fetch(on_weather_data)
    http.get(url, nil, function(code, data)
            if code < 0 then
                print("HTTP request failed")
            else
                response = sjson.decode(data)
                on_weather_data(response)
            end
        end
    )
end

return {
    fetch = fetch
}
