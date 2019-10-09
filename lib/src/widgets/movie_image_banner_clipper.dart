import 'package:flutter/material.dart';

class MovieImageBannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 40);

    var centerPoint = Offset(size.width / 2, size.height + 40.0);
    var endPoint = Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(centerPoint.dx, centerPoint.dy,
        endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}