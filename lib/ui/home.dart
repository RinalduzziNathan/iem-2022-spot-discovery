import 'package:flutter/material.dart';
import 'package:iem_2022_spot_discovery/app/app.dart';
import 'package:iem_2022_spot_discovery/core/manager/spot_manager.dart';
import 'package:iem_2022_spot_discovery/core/model/spot.dart';

import 'detailSpot.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool typing = false;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: typing ? TextBox() : Text("Rechercher"),
        leading: IconButton(
          icon: Icon(typing ? Icons.done : Icons.search),
          onPressed: () {
            setState(() {

              typing = !typing;
              Spot? randomSpot = SpotManager().getSpotByName("Tré");


              Navigator.of(context).push(MaterialPageRoute(builder : (context) =>Detail(spot: randomSpot!,)));
            });
          },
        ),
      ),
      body: FutureBuilder(
        future: SpotManager().loadSpots(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Spot>? spots = SpotManager().getSomeSpots();
            print(spots![0].title);
            return Container(
                child:

                ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: spots.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print("tapped on container : "+ "${spots[index].title}");
                    Navigator.of(context).push(MaterialPageRoute(builder : (context) =>Detail(spot: spots[index],)));
                  },
                  child: Container(
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Image.network('${spots[index].imageThumbnail}'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('${spots[index].title}'),
                                const Spacer(
                                  flex: 1,
                                ),
                                Text('${spots[index].mainCategory?.name}'),
                              ],
                            )

                          ],
                        ),
                      )
                    ]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Spot? randomSpot = SpotManager().getRandomSpot();
         // Spot? randomSpot = SpotManager().getSpotByName("Trévoux");

          Navigator.of(context).push(MaterialPageRoute(builder : (context) =>Detail(spot: randomSpot!,)));
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.all_inclusive),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Rechercher'),
      ),
    );
  }
}