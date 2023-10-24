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
      ..strokeWidth = anode ? 2 : _size.height / 40;

    if (number == 0) {
      canvas.drawOval(
          Rect.fromCenter(
              center: Offset(_size.width * 0.5, _size.height * 0.5),
              width: _size.height * 0.5,
              height: _size.height * 0.85),
          paint);
    } else if (number == 1) {
      canvas.drawLine(Offset(_size.width * 0.5, _size.height * 0.1),
          Offset(_size.width * 0.5, _size.height * 0.9), paint);
    } else if (number == 4) {
      canvas.drawLine(Offset(_size.width * 0.1, _size.height * 0.5),
          Offset(_size.width * 0.9, _size.height * 0.5), paint);
      canvas.drawLine(Offset(_size.width * 0.5, _size.height * 0.2),
          Offset(_size.width * 0.5, _size.height * 0.8), paint);
      canvas.drawLine(Offset(_size.width * 0.2, _size.height * 0.5),
          Offset(_size.width * 0.5, _size.height * 0.2), paint);
    } else if (number == 7) {
      canvas.drawLine(Offset(_size.width * 0, _size.height * 0.25),
          Offset(_size.width * 0.65, _size.height * 0.25), paint);
      canvas.drawLine(Offset(_size.width * 0.65, _size.height * 0.25),
          Offset(_size.width * 0.65, _size.height * 0.65), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
