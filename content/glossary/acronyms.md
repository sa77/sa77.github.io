+++
title = "Acronyms"
slug = "acronyms"
layout = "page.html"
date = 2021-04-11
draft = false
[taxonomies]
tags = []
+++

## Data
- **BLOB** - Binary Large OBject - Data Type - collection of binary data stored as a single entity. Usually used to store images, audio, etc. Also used by some databases like PostgreSQL, MongoDB to store persitent values.

- **SRID** - Spatial Reference IDentifier - It defines what coordinate system you want to use. There are many SRIDs used for different geographies around the world. To perform geospatial functions on the same data, it has to be on the same SRID. A common one is SRID 4326 (maps to WGS84). You can store SRID data in different formats: WKT (commonly used), WKB, HEX
  - WKT (Well Known Text) is a text markup language used by Open Geo Consortium

## Date/Time
- **DST** - Daylight Savings Time - happens when a country/region decides to wind their clocks forward one hour to make most of the available sunlight.

- **UTC** - Universal Time Coordinated - coordinated time scale maintained universally. Also known as "Z time" or "Zulu Time". It refers to time on the zero or Greenwich meridian, which is not adjusted to reflect changes either to or from Daylight Saving Time. So, the switch to daylight saving time does not affect UTC. Prior to 1972, this time was called Greenwich Mean Time (GMT). Always use UTC to store, pass around datetime objects.
