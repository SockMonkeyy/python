from unicodedata import name
import pandas
import folium
import os

data = pandas.read_csv("/home/sockmonkeyy/Desktop/repos/python/Mapping/Volcanoes.txt")
cityPop = pandas.read_json('/home/sockmonkeyy/Desktop/repos/python/Mapping/citypop.json')
long = list(data["LON"])
lat = list(data["LAT"])
elev = list(data["ELEV"])
loc = list(data["LOCATION"])
volcName= list(data["NAME"])
longpop = list(cityPop['longitude'])
latpop = list(cityPop['latitude'])
pop = list(cityPop['population'])
citypop = list(cityPop['city'])
statepop = list(cityPop['state'])
rank = list(cityPop['rank'])



def iconColor(elevation):
    if elevation < 1000: 
        return "blue"
    if elevation < 2000: 
        return "green"
    elif 2000 < elevation <= 3000:
        return "red"
    elif 3000 < elevation < 4000:
        return "orange"
    else:
        return "black"     


def CityPop(pop):
    if pop < 50000: 
        return "green"
    if pop < 75000: 
        return "orange"
    elif 75000 < pop <= 150000:
        return "red"
    elif 150000 < pop < 300000:
        return "purple"
    else:
        return "black"   

def icon(elevation):
    if elevation < 1000: 
        return "circle"
    if elevation < 2000: 
        return "info"
    elif 2000 < elevation <= 3000:
        return "info"
    elif 3000 < elevation < 4000:
        return "cloud"
    else:
        return "star"



m = folium.Map(location=[44.6917992, -121.8010025], tiles="OpenStreetMap", zoom_start=8)
tooltip = "Learn More"

fgp = folium.FeatureGroup(name="Population")
fgv = folium.FeatureGroup(name="Volcanoes")
fgpop = folium.FeatureGroup(name="Population by City")

fgp.add_child(folium.GeoJson(data=open('/home/sockmonkeyy/Desktop/repos/python/Mapping/world.json', 'r', encoding='utf-8-sig').read(),
style_function=lambda x: {'fillColor':'green' if x['properties'] ['POP2005'] < 10000000
 else 'orange' if 10000000 <= x['properties']['POP2005'] < 20000000 else 'red'}))



for lt, ln, lo, el, nme in zip(lat, long, loc, elev, volcName ):
  
    fgv.add_child(folium.Marker(
    [lt, ln], icon=folium.Icon(color=iconColor(el), prefix='fa', icon=icon(el)), popup="Name: "+(nme) + " " +"Elevation: "+str((el))+" Mtrs"  + " "+"Location: "+ str(lo), tooltip=tooltip,
))

for lt, ln, popu, city, state, ran in zip(latpop, longpop, pop, citypop, statepop, rank ):
  
    fgpop.add_child(folium.Marker(
    [lt, ln], icon=folium.Icon(color=CityPop(popu), prefix='fa', icon="home"), popup="City: "+(city)+' '+'State: ' +(state) + " " +"Population: "+str((popu))+' '+'Population Rank: ' +str((ran)), tooltip=tooltip,
))

    
m.add_child(fgv)
m.add_child(fgp)
m.add_child(fgpop)
m.add_child(folium.LayerControl())
m.save("testMap.html")




