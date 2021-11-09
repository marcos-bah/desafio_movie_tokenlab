import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomGeneralWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  // ignore: use_key_in_widget_constructors
  const CustomGeneralWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();

  // ignore: use_key_in_widget_constructors
  const CustomGeneralWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.black,
        child: Container(
          color: Colors.white12,
          child: Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.white24,
            direction: ShimmerDirection.rtl,
            period: const Duration(seconds: 2),
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Colors.white10,
              ),
            ),
          ),
        ),
      );
}
