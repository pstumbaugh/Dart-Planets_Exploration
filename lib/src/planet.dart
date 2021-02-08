//planet class with name and description

class Planet {
  final String name;
  final String description;

  Planet({this.name, this.description});

//if no planets, insert a null planet object in it's place
  Planet.nullPlanet(String userPlanetName)
      : name = userPlanetName,
        description = 'This an unknown planet! How exciting!';

  //transforming the list of planets in json file to List<Planet>
  //new method called fromMaps, takes Iterable planetMaps
  static List<Planet> fromMaps(Iterable planetMaps) {
    return List<Planet>.from(planetMaps.map((item) =>
        Planet(name: item['name'], description: item['description'])));
  }
}
