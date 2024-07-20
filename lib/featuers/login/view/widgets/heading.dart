import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String heading;
  const Heading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'PP\n',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: heading,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );

    // Text(
    //   heading,
    //   textAlign: TextAlign.center,
    //   style: const TextStyle(
    //     fontSize: 40,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.teal,
    //   ),
    // );
  }
}
