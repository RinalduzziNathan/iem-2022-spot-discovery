import 'package:flutter/material.dart';
import 'package:iem_2022_spot_discovery/core/model/spot.dart';
import 'package:iem_2022_spot_discovery/ui/home.dart';
import 'package:iem_2022_spot_discovery/ui/detailSpot.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot Discovery',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const HomePage(title: 'Spot Discovery'),
    );
  }
}
