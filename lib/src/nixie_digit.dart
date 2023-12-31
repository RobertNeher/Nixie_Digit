import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nixie_digit/src/cathode.dart';
import 'package:nixie_digit/src/tube.dart';

class NixieDigit extends StatefulWidget {
  final Color dimmedColor;
  final Color glowingColor;
  final Color cathodeColor;
  final int number;

  const NixieDigit(
      {Key? key,
      required this.number,
      this.dimmedColor = Colors.grey,
      this.glowingColor = Colors.deepOrange,
      this.cathodeColor = Colors.blueAccent})
      : super(key: key);

  @override
  State<NixieDigit> createState() => _NixieDigitState();
}

class _NixieDigitState extends State<NixieDigit> {
  late Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> digitStack = [];
    size = MediaQuery.of(context).size;

    for (int i = 0; i <= 9; i++) {
      digitStack.add(CustomPaint(
        painter: DigitPainter(
            number: i,
            glowingNumber: i == widget.number,
            dimmedColor: widget.dimmedColor,
            glowingColor: widget.glowingColor),
        child: Container(),
      ));
    }
    digitStack.add(const Cathode(
      cathodeColor: Colors.blueGrey,
    ));
    digitStack.add(NixieTube(size: size));

    return Stack(
        fit: StackFit.loose, alignment: Alignment.center, children: digitStack);
  }
}

class DigitPainter extends CustomPainter {
  final bool glowingNumber;
  final int number;
  final Color dimmedColor;
  final Color glowingColor;
  DigitPainter(
      {required this.number,
      this.glowingNumber = true,
      this.dimmedColor = Colors.transparent,
      this.glowingColor = Colors.transparent});

  @override
  void paint(canvas, size) {
    Size _size = Size(size.height * 2 / 3, size.height);
    Paint paint = Paint()
      ..color = glowingNumber ? glowingColor : dimmedColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = glowingNumber ? _size.height / 40 : 4;
    Path path = Path();

    if (number == 0) {
      canvas.drawArc(
          Rect.fromLTWH(_size.width * 0.175, _size.height * 0.15,
              _size.width * 0.6, _size.height * 0.4),
          0,
          -pi,
          false,
          paint);
      canvas.drawArc(
          Rect.fromLTWH(_size.width * 0.175, _size.height * 0.4,
              _size.width * 0.6, _size.height * 0.4),
          0,
          pi,
          false,
          paint);
      canvas.drawLine(Offset(_size.width * 0.175, _size.height * 0.35),
          Offset(_size.width * 0.175, _size.height * 0.6), paint);
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.35),
          Offset(_size.width * 0.775, _size.height * 0.6), paint);
    } else if (number == 1) {
      canvas.drawLine(Offset(_size.width * 0.5, _size.height * 0.15),
          Offset(_size.width * 0.5, _size.height * 0.8), paint);
    } else if (number == 2) {
      canvas.drawArc(
          Rect.fromLTWH(_size.width * 0.175, _size.height * 0.15,
              _size.width * 0.6, _size.height * 0.4),
          0,
          -pi,
          false,
          paint);
      canvas.drawLine(Offset(_size.width * 0.175, _size.height * 0.8),
          Offset(_size.width * 0.8, _size.height * 0.8), paint);
      path.moveTo(_size.width * 0.775, _size.height * 0.36);
      path.cubicTo(_size.width * 0.75, _size.height * 0.5, _size.width * 0.2,
          _size.height * 0.5, _size.width * 0.175, _size.height * 0.8);
      canvas.drawPath(path, paint);
    } else if (number == 3) {
      canvas.drawLine(Offset(_size.width * 0.175, _size.height * 0.15),
          Offset(_size.width * 0.775, _size.height * 0.15), paint);
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.15),
          Offset(_size.width * 0.47, _size.height * 0.4), paint);
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.6),
              radius: _size.width * 0.3),
          -pi / 2,
          1.4 * pi,
          false,
          paint);
    } else if (number == 4) {
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.15),
          Offset(_size.width * 0.775, _size.height * 0.8), paint);
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.15),
          Offset(_size.width * 0.165, _size.height * 0.6), paint);
      canvas.drawLine(Offset(_size.width * 0.165, _size.height * 0.6),
          Offset(_size.width * 0.165, _size.height * 0.63), paint);
      canvas.drawLine(Offset(_size.width * 0.165, _size.height * 0.63),
          Offset(_size.width * 0.775, _size.height * 0.63), paint);
    } else if (number == 5) {
      canvas.drawLine(Offset(_size.width * 0.35, _size.height * 0.15),
          Offset(_size.width * 0.775, _size.height * 0.15), paint);
      canvas.drawLine(Offset(_size.width * 0.35, _size.height * 0.15),
          Offset(_size.width * 0.29, _size.height * 0.43), paint);
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.6),
              radius: _size.width * 0.3),
          -pi / 1.4,
          1.6 * pi,
          false,
          paint);
    } else if (number == 6) {
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.6),
              radius: _size.width * 0.3),
          0,
          2 * pi,
          false,
          paint);
      canvas.drawLine(Offset(_size.width * 0.2, _size.height * 0.52),
          Offset(_size.width * 0.5, _size.height * 0.15), paint);
    } else if (number == 7) {
      canvas.drawLine(Offset(_size.width * 0.175, _size.height * 0.15),
          Offset(_size.width * 0.775, _size.height * 0.15), paint);
      canvas.drawLine(Offset(_size.width * 0.175, _size.height * 0.15),
          Offset(_size.width * 0.175, _size.height * 0.18), paint);
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.15),
          Offset(_size.width * 0.775, _size.height * 0.18), paint);
      canvas.drawLine(Offset(_size.width * 0.775, _size.height * 0.18),
          Offset(_size.width * 0.5, _size.height * 0.8), paint);
    } else if (number == 8) {
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.6),
              radius: _size.width * 0.3),
          0,
          2 * pi,
          false,
          paint);
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.28),
              radius: _size.width * 0.18),
          0,
          2 * pi,
          false,
          paint);
    } else if (number == 9) {
      canvas.drawArc(
          Rect.fromCircle(
              center: Offset(_size.width * 0.47, _size.height * 0.35),
              radius: _size.width * 0.3),
          0,
          2 * pi,
          false,
          paint);
      // canvas.drawLine(Offset(_size.width * 0.8, _size.height * 0.52),
      //     Offset(_size.width * 0.5, _size.height * 0.8), paint);
      canvas.drawLine(Offset(_size.width * 0.76, _size.height * 0.4),
          Offset(_size.width * 0.5, _size.height * 0.8), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
