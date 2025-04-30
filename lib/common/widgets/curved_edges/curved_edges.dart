
import 'package:flutter/cupertino.dart';

class CustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height-20);
    final LastCurve = Offset(30, size.height-20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, LastCurve.dx, LastCurve.dy);


    final SecondirstCurve = Offset(0, size.height-20);
    final SecondLastCurve = Offset(size.width - 30, size.height-20);

    path.quadraticBezierTo(SecondirstCurve.dx, SecondirstCurve.dy, SecondLastCurve.dx, SecondLastCurve.dy);

    final ThirdirstCurve = Offset(size.width, size.height-20);
    final ThirdLastCurve = Offset(size.width , size.height);

    path.quadraticBezierTo(ThirdirstCurve.dx, ThirdirstCurve.dy, ThirdLastCurve.dx, ThirdLastCurve.dy);


    path.lineTo(size.width , 0);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;

  }

}
