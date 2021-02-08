//FUNCTIONS
import 'dart:io';
import 'package:dart_planets/dart_planets.dart';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {
  PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasPlanets) {
      travel(promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Aw, there are no planets to explore.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore.');
    return;
  }

  void printIntroduction(String name) {
    print(
        'Nice to meet you, $name. My name is Pat. I\'m an old friend of Alexa.');
    return;
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I didn\'t get that');
      }
    }
    return false;
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }

  void travelTo(Planet planet) {
    print('Traveling to ${planet.name}');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travel(bool randomDestination) {
    Planet planet;
    if (randomDestination) {
      //travel to a random planet
      planet = planetarySystem.randomPlanet();
    }
    //else: user selected their own planet, check if our planet list includes that name
    else {
      planet = planetarySystem.planetWithName(
          responseToPrompt('Name the planet you would like to visit.'));
    }
    travelTo(planet);
  }
}
