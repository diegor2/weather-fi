return {

    -- Settings for connecting to an existing access point as a station
    station = {

        -- local wifi name
        ssid = "my network",

        -- local wifi password
        password = "password123",

    },

    -- Settings for the weather provider
    openweathermap = {

        -- Get an API key from https://openweathermap.org/home/sign_up
        key = "abc123",

        -- Location to be used as the `q` parameter, as defined in https://openweathermap.org/current#name
        location = "Campinas,SP,BR",

        -- Units of measurement: https://openweathermap.org/current#data
        units = "metric",

        -- Language: https://openweathermap.org/current#multi
        language = "pt_br",
        
    },

    -- Name servers to resolve hostnames
    dns = {
        primary = "8.8.8.8",
        secondary = "8.8.4.4",
    },
    
    -- Update every 15 minutes
    watch_dog = 60 * 15,
}