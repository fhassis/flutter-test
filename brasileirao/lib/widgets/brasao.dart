import 'package:flutter/material.dart';

class Brasao extends StatelessWidget {
  final String image;
  final double width;

  const Brasao({
    Key? key,
    required this.image,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: image,
        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
