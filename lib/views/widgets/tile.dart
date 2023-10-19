import 'package:flutter/material.dart';
import 'package:labhouse_radio/data/models/stations_model.dart';
import 'package:labhouse_radio/views/themes/theme.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.station
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final StationsModel station;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.thirdColor,
        border: Border.all(color: AppTheme.secondaryColor),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      height: extent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: (station.favicon != "" && station.favicon != null)
              ? Image.network(
                station.favicon!, 
                fit: BoxFit.contain,
                height: 30, 
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.radio_rounded, color: Colors.black54))
                : const Icon(Icons.radio_rounded, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(station.name!, overflow: TextOverflow.ellipsis, softWrap: false),
          )
        ],
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}