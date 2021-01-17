# Weather-fi

Broadcast the weather as wifi ssid on a ESP8266

![Demo](demo.jpg)

## How to run

- Plug an nodeMCU devkit or a ESP8266 with serial adapter on the USB
- This requires the nodeMCU lua interpreter with `http` and `sjson` modules, so you may need to [build](https://nodemcu.readthedocs.io/en/release/build/) and [flash](https://nodemcu.readthedocs.io/en/release/flash/) it
- Create a `secrets.lua` file based on `secrets.sample.lua` with the correct settings.

```shell
npm install -g nodemcu-tool
nodemcu-tool init
nodemcu-tool upload *.lua
nodemcu-tool reset
```
