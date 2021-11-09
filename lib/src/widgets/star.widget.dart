import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final double voteAverage;
  final Color color;
  const StarWidget({
    Key? key,
    required this.voteAverage,
    this.color = Colors.yellowAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numStar = voteAverage.toInt();
    List<Widget> star = [];
    for (var i = 0; i < numStar; i++) {
      star.add(
        Icon(
          Icons.star,
          color: color,
        ),
      );
    }

    if (voteAverage > numStar) {
      star.add(
        Icon(
          Icons.star_half_sharp,
          color: color,
        ),
      );
    }

    star.add(const SizedBox(
      width: 10,
    ));

    star.add(Text(
      voteAverage.toStringAsFixed(1),
      style: const TextStyle(color: Colors.white),
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: star,
    );
  }
}
