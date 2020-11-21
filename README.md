# Godot OWO Integration

This is a Godot 3.2 addon (https://godotengine.org/) that implements the OWO Game API/Protocol and allows to send sensations to an OWO Server.

OWO is the developer of a haptic suite for gaming: [https://owogame.com/](https://owogame.com/)

# Usage

## Included Demo

This repository included a small demo application that you can use to test the connection. By default it connects to localhost and you can test it with the OWOSimulator application that is part of the OWO SDK.

# Use in your own application

Copy the addons folder into your project and add the `Feature_OWO.tscn` as a node into your scene tree. To start the connection call

```
connect_to_owo_server(ip_address)
```

on the node.
