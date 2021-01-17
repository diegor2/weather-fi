-- weather emojis
local names = {
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

local codes = {

    -- day

    ['01d'] = names.day_clear_sky,
    ['02d'] = names.day_few_clouds,
    ['03d'] = names.scattered_clouds,
    ['04d'] = names.broken_clouds,
    ['09d'] = names.shower_rain,
    ['10d'] = names.rain,
    ['11d'] = names.thunderstorm,
    ['13d'] = names.snow,
    ['50d'] = names.mist,

    -- night

    ['01n'] = names.night_clear_sky,
    ['02n'] = names.night_few_clouds,
    ['03n'] = names.scattered_clouds,
    ['04n'] = names.broken_clouds,
    ['09n'] = names.shower_rain,
    ['10n'] = names.rain,
    ['11n'] = names.thunderstorm,
    ['13n'] = names.snow,
    ['50n'] = names.mist,

}

return {
    by_name = names,
    by_code = codes
}