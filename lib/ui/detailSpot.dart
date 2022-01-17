
import 'package:flutter/material.dart';

import 'package:iem_2022_spot_discovery/core/model/spot.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.spot}) : super(key: key);

  final Spot spot;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.spot.title.toString()),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Image.network("${widget.spot.imageFullsize}"),
              Text("${widget.spot.address}"),
              Text("${widget.spot.trainStation ?? "Pas de station"}"),
              if(widget.spot.isRecommended == true)...[
                const Text("Recommandé"),
              ],

              if(widget.spot.isClosed == true)...[
const Text("Fermé"),
              ]else...[
                const Text("ouvert"),
              ],

              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.spot.tagsCategory?.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: ListTile(
                                title: Text(
                                    '${widget.spot.tagsCategory?[index]?.name}')));
                      })),
            ]),
          ),
        ));
  }
}
