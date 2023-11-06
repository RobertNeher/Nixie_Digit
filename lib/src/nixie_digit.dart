import 'dart:math';

import 'package:flutter/material.dart';

class NixieDigit extends StatefulWidget {
  final Color anodeColor;
  final Color digitColor;
  final int number;

  const NixieDigit(
      {Key? key,
      required this.number,
      this.anodeColor = Colors.grey,
      this.digitColor = Colors.deepOrange})
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
    size = MediaQuery.of(context).size;

    return CustomPaint(
      painter: DigitPainter(
          number: widget.number,
          anode: false,
          anodeColor: widget.anodeColor,
          digitColor: widget.digitColor),
      foregroundPainter: DigitPainter(
          number: widget.number,
          anode: true,
          anodeColor: widget.anodeColor,
          digitColor: widget.digitColor),
      child: Container(),
    );
  }
}

class DigitPainter extends CustomPainter {
  final bool anode;
  final int number;
  final Color anodeColor;
  final Color digitColor;
  DigitPainter(
      {required this.number,
      this.anode = false,
      this.anodeColor = Colors.transparent,
      this.digitColor = Colors.transparent});

  @override
  void paint(canvas, size) {
    Size _size = Size(size.height * 2 / 3, size.height);
    Paint paint = Paint()
      ..color = anode ? anodeColor : digitColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = anode ? 4 : _size.height / 40;
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
      // canvas.drawLine(Offset(_size.width * 0.5, _size.height * 0.15),
      //     Offset(_size.width * 0.45, _size.height * 0.2), paint);
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
