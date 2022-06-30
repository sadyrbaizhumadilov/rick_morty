import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonCacheImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  const PersonCacheImage(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
