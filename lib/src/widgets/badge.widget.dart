import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String title;
  final Color color;
  const BadgeWidget({Key? key, required this.title, this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 30,
      width: 100,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
