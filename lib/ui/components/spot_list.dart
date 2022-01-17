import 'package:flutter/material.dart';
import 'package:iem_2022_spot_discovery/core/model/spot.dart';
import 'package:iem_2022_spot_discovery/ui/components/image_placeholder.dart';
import 'package:iem_2022_spot_discovery/ui/spot_detail.dart';

class SpotList extends StatelessWidget {
  final List<Spot> spots;

  const SpotList(this.spots, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        Spot spot = spots[position];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SpotDetail.route,
                arguments: SpotDetailArguments(spot: spot));
          },
          child: Row(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    spot.imageThumbnail ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, child, stack) {
                      return const ImagePlaceholder();
                    },
                  )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spot.title ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("Catégorie : ${spot.mainCategory?.name ?? 'Inconnue'}")
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: spots.length,
    );
  }
}