import 'package:flutter/cupertino.dart';

class RectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    /* path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);*/

    /*path.moveTo(size.width / 2, 0.0);
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height);*/
    path.lineTo(0.0, size.height);
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RectangleClipper oldClipper) => false;
}
