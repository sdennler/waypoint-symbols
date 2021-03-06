#!/bin/bash

block=(Markers Outdoors Hunting Marine Civil Transportation Navaids Signs "Points of interest" Custom)
sym=(\
 "Flag, Blue" "Flag, Green" "Flag, Red" "Civil"\
 "Pin, Blue" "Pin, Green" "Pin, Red" "Golf Course"\
 "Block, Blue" "Block, Green" "Block, Red" "Stadium"\
 "Navaid, Blue" "Navaid, Green" "Navaid, Red" "Navaid, White"\
 "Navaid, Amber" "Navaid, Black" "Navaid, Orange" "Navaid, Violet"\
 "City (Small)" "City (Medium)" "City (Large)" "Crossing"\
 "Residence" "Fishing Hot Spot Facility" "Lodge" "Museum"\

 "Campground" "Trail Head" "Park" "Forest"\
 "Summit" "Fishing Area" "Geocache" "Geocache Found"\
 "Picnic Area" "Restroom" "Shower" "Beach"\
 "RV Park" "Scenic Area" "Ski Resort" "Swimming Area"\
 "Skiing Area" "Golf Course" "Bike Trail" "Drinking Water"\
 "Tunnel" "Parachute Area" "Glider Area" "Ultralight Area"\
 "X" "X" "X" "X"\

 "Upland Game" "Waterfowl" "Furbearer" "Big Game"\
 "Small Game" "Covey" "Cover" "Treed Quarry"\
 "Water Source" "Food Source" "Animal Tracks" "Blood Trail"\
 "Truck" "ATV" "Lodge" "Campground"\
 "Blind" "X" "X" "X"\
 "X" "X" "X" "X"\
 "X" "X" "X" "X"\

 "Anchor" "Fishing Area" "Man Overboard" "Diver Down Flag 1"\
 "Diver Down Flag 2" "Beach" "Skull and Crossbones" "Light"\
 "Buoy, White" "Shipwreck" "Radio Beacon" "Horn"\
 "Controlled Area" "Restricted Area" "Danger Area" "Restaurant"\
 "Bridge" "Dam" "Swimming Area" "Boat Ramp"\
 "Skiing Area" "Restroom" "Gas Station" "Campground"\
 "X" "X" "X" "X"\

 "Residence" "Fishing Hot Spot Facility" "Building" "Church"\
 "Cemetery" "Horn" "Tall Tower" "Short Tower"\
 "Radio Beacon" "Oil Field" "Mine" "Drinking Water"\
 "School" "Crossing" "Civil" "Bridge"\
 "Police Station" "Bell" "X" "X"\
 "X" "X" "X" "X"\
 "X" "X" "X" "X"\

 "Car" "Car Rental" "Car Repair" "Gas Station"\
 "Convenience Store" "Scales" "Airport" "School"\
 "Truck Stop" "Wrecker" "Tunnel" "Toll Booth"\
 "Restroom" "Restaurant" "Lodging" "Crossing"\
 "Bridge" "Parking Area" "X" "X"\
 "X" "X" "X" "X"\
 "X" "X" "X" "X"\

 "Navaid, Amber" "Navaid, Black" "Navaid, Blue" "Navaid, Green/White"\
 "Navaid, Green" "Navaid, Green/Red" "Navaid, Orange" "Navaid, Red/Green"\
 "Navaid, Red/White" "Navaid, Red" "Navaid, Violet" "Navaid, White"\
 "Navaid, White/Green" "Navaid, White/Red" "Buoy, White" "Radio Beacon"\
 "Horn" "Light" "X" "X"\
 "X" "X" "X" "X"\
 "X" "X" "X" "X"\

 "Shopping Center" "Picnic Area" "Telephone" "Airport"\
 "Restroom" "Information" "Restaurant" "Lodging"\
 "Shower" "Boat Ramp" "Skiing Area" "Swimming Area"\
 "Fitness Center" "Ice Skating" "Medical Facility" "Pharmacy"\
 "Parking Area" "Crossing" "Trail Head" "Bike Trail"\
 "Skull and Crossbones" "Ski Resort" "Bridge" "Dam"\
 "X" "X" "X" "X"\

 "Gas Station" "Convenience Store" "Bank" "Bar"\
 "Department Store" "Movie Theater" "Fast Food" "Pizza"\
 "Restaurant" "Lodging" "Shopping Center" "Airport"\
 "Fitness Center" "Live Theater" "Medical Facility" "Pharmacy"\
 "Post Office" "Museum" "Golf Course" "Ball Park"\
 "Bowling" "Amusement Park" "Stadium" "Zoo"\
 "X" "X" "X" "X"\

 "Closed Bug Marker" "Open Bug Marker" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
)

echo '<?xml version="1.0" encoding="UTF-8"?>
<gpx
  version="1.0"
  creator="GPSBabel - http://www.gpsbabel.org"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://www.topografix.com/GPX/1/0"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd http://www.garmin.com/xmlschemas/WaypointExtension/v1 http://www.garmin.com/xmlschemas/WaypointExtensionv1.xsd http://www.qlandkarte.org/xmlschemas/v1.1 http://www.qlandkarte.org/xmlschemas/v1.1/ql-extensions.xsd">'

symi=0
for (( b = 0; b <= 9; b++ ))
 do

 # Symbol Block
 echo "<wpt lat=\"3.11\" lon=\"101.1${b}15\">"
 echo "  <name>Block $b ${block[$b]}</name>"
 echo "  <sym>Waypoint</sym>"
 echo "</wpt>"

 for (( x = 0; x <= 6; x++ ))
  do
   for (( y = 0; y <= 3; y++ ))
    do
     let lat=9-$x
     let lon=$y
     #echo -n "$lat:$lon "
     if [ "X" != "${sym[$symi]}" ]; then
      echo "<wpt lat=\"3.10$lat\" lon=\"101.1$b$lon\">"
      echo "  <name>XT $b:$x:$y ${sym[$symi]}</name>"
      echo "  <sym>${sym[$symi]}</sym>"
      echo "</wpt>"
     fi
     let symi++
    done
    #echo
  done
 done

echo '</gpx>'
