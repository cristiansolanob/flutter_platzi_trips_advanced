import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  const TitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'lato',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
