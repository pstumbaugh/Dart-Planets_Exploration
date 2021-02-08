import 'dart:math';
import 'planet.dart';

class PlanetarySystem {
  final String name;
  final List<Planet> planets;
  final _random =
      Random(); //picks a random number (seed) for our planet choosing

  PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  static PlanetarySystem fromMap(Map<String, dynamic> jsonMap) {
    return PlanetarySystem(
        name: jsonMap['name'], planets: Planet.fromMaps(jsonMap['planets']));
  }

//getters for PlanetarySystem class
  int get numberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

//randomly select a planet to return to our program (returns 1 planet name and description)
  Planet randomPlanet() {
    if (!hasPlanets) {
      var name = 'Unknown';
      //our list doesn't have planets, return null planet
      return Planet.nullPlanet(name);
    }
    //else choose a random number from our planets list length, then use that as our planet to return
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name) {
    //look for firstWhere object, or else return null planet
    return planets.firstWhere((planet) => planet.name == name,
        orElse: () => Planet.nullPlanet(name));
  }
}
