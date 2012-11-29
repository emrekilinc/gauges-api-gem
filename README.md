# gauges-api-gem

A very simplistic, usable ruby gem for using the Gauges API.

## Usage

In order to use gauges-api you need to create an API key from 
gaug.es website. With that gauges-api is really very easy to
get up and running.

```
require 'gauges_api'

client = new Gauges::Client.new "YOUR TOKEN HERE"

# Get user informations
client.me

# Get account's API clients
client.clients

# Gets gauges list
client.gauges
# Additionally you can pass a page number
client.gauges 2

# Get gauges' share list
client.shares "GAUGE ID"

# Get gauges' top contents
client.content "GAUGE ID"
# Optionally you can pass date or page variable
client.content "GAUGE ID", Date.today, 4

# Get gauges' referrers
client.referrers "GAUGE ID"
# Optionally you can pass date or page variable

# Get gauges' traffic data
client.traffic "GAUGE ID"
# Optionally you can pass date variable
client.traffic "GAUGE ID", Date.today

# Get gauges' screen resolution statistics
client.resolutions "GAUGE ID"
# Optionally you can pass date variable
client.resolutions "GAUGE ID", Date.today

# Get gauges' technology statistics, including browser and operating system
information
client.technology "GAUGE ID"
# Optionally you can pass date variable
client.technology "GAUGE ID", Date.today

# Get gauges' top search terms
client.terms "GAUGE ID"
# Optionally you can pass date or page variable
client.terms "GAUGE ID", Date.today, 4

# Get gauges' search engine statistics
client.engines "GAUGE ID"
# Optionally you can pass date variable
client.engines "GAUGE ID", Date.today

# Get gauges' location statistics
client.locations "GAUGE ID"
# Optionally you can pass date variable
client.locations "GAUGE ID", Date.today
```

Right now, gauges-api uses open-uri for network communication. In short
term i'm planning to switch to 'net/http'. When i switched to net/http,
i will also add functionality for updating user information, creating and
deleting new api clients, creating, updating and deleting guages.

## COPYRIGHT
See LICENCE for details.

&copy; 2012
