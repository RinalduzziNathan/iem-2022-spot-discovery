import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iem_2022_spot_discovery/core/model/spot.dart';

class SpotManager {
  List<Spot>? spots;

  static final SpotManager _instance = SpotManager._internal();

  factory SpotManager() => _instance;

  SpotManager._internal();

  int get _spotListLength => spots?.length ?? 0;

  /// Charge et renvoie la liste complète de spots depuis le fichier json local
  Future<List<Spot>?> loadSpots(BuildContext context) async {
    // Opening json file
    var jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/json/spots.json");
    // Decoding json
    var json = jsonDecode(jsonString);
    // Mapping data
    spots = List<Map<String, dynamic>>.from(json["data"])
        .map((json) => Spot.fromJson(json))
        .toList();
    return spots;
  }

  /// Renvoie un spot aléatoire de la liste pré-chargée
  Spot? getRandomSpot() {
    if (spots?.isNotEmpty ?? false) {
      var random = Random();
      int randomIndex = random.nextInt(_spotListLength - 1);
      return spots?[randomIndex];
    }
    return null;
  }
  ///revoie le spot recherché entré en param
  Spot? getSpotByName(name) {
    if (spots?.isNotEmpty ?? false) {
      Spot? searchedSpot = null;
     spots?.forEach((element) {

       if(element.title!.contains(name.toString())) {
         searchedSpot = element;

       }
     });

      return searchedSpot;
    }
    return null;
  }

  /// Renvoie les spots de l'interval défini
  /// [startIndex] est l'index de début de l'interval
  /// [endIndex] est l'index de fin de l'interval
  List<Spot>? getSomeSpots({int startIndex = 0, int endIndex = 15}) {
    if ((spots?.isNotEmpty ?? false) &&
        startIndex < _spotListLength &&
        startIndex < endIndex) {
      if (endIndex > _spotListLength) {
        endIndex = _spotListLength;
      }
      return spots?.getRange(startIndex, endIndex).toList();
    }
    return null;
  }
}