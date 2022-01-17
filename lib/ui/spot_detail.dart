import 'package:flutter/material.dart';
import 'package:iem_2022_spot_discovery/core/model/spot.dart';

class SpotDetailArguments {
  Spot spot;

  SpotDetailArguments({required this.spot});
}

class SpotDetail extends StatefulWidget {
  static const route = "/spot";

  final Spot spot;

  const SpotDetail(this.spot, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SpotDetailState();
}

class _SpotDetailState extends State<SpotDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.spot.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.network(
                      widget.spot.imageFullsize ?? '',
                      fit: BoxFit.cover,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    widget.spot.isRecommended == true
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: Colors.green),
                            child: const Text(
                              "Recommandé",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 8,
                    ),
                    widget.spot.isClosed == true
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: Colors.red),
                            child: const Text("Fermé",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)))
                        : Container()
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.spot.title ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        String? tag = widget.spot.tagsCategory?[position].name;
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                              child: Text(
                            tag ?? '',
                            style: const TextStyle(color: Colors.white),
                          )),
                        );
                      },
                      itemCount: widget.spot.tagsCategory?.length ?? 0,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Adresse : ${widget.spot.address}"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                      "Gare la plus proche : ${widget.spot.trainStation ?? "inconnue"}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
