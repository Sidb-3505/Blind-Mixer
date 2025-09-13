import 'package:flutter/material.dart';

class BlindDateIllustration extends StatelessWidget {
  const BlindDateIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder illustration (can replace with SVG/image asset)
    return Center(
      child: Icon(
        Icons.favorite,
        size: 200,
        color: Colors.pinkAccent.withOpacity(0.5),
      ),
    );
  }
}
