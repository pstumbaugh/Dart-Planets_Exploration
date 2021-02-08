//Patrick Stumbaugh

//Import
import 'package:dart_planets/dart_planets.dart';

//Take an argument (planetarySystem.json)
void main(List<String> arguments) {
  //assign our file to a variable (arguments at 0 index will be planetarySystem.json)
  var filename = arguments[0];
  //file name is the pathname for our planetarySystem.json file

  //create a file variable, read as a String, returns as a future<String>
  var futurePlanets = File(filename).readAsString();

  //unpack our futurePlanets as a String in jsonData, apply it to the fromMap function
  futurePlanets.then((String jsonData) {
    SpaceAdventure(
            planetarySystem: PlanetarySystem.fromMap(jsonDecode(jsonData)))
        .start();
  });
}
