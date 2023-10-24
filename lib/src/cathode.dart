import 'package:flutter/material.dart';

class Cathode extends StatefulWidget {
  final Color cathodeColor;
  const Cathode({Key? key, this.cathodeColor = Colors.black38})
      : super(key: key);

  @override
  State<Cathode> createState() => _CathodeState();
}

class _CathodeState extends State<Cathode> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    Size size = Size(MediaQuery.of(context).size.width - 10,
        MediaQuery.of(context).size.height - 10);

    return SizedBox(
      height: size.height,
      width: size.width,
      child: CustomPaint(
        painter: CathodePainter(cathodeColor: widget.cathodeColor, size: size),
        child: Container(),
      ),
    );
  }
}

class CathodePainter extends CustomPainter {
  static const Offset digitOffset = Offset(10, 10);
  static const double elementSize = 20;

  final Size size;
  final Color cathodeColor;
  CathodePainter({this.cathodeColor = Colors.black38, this.size = Size.zero});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = cathodeColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    for (int x = 0; x < (size.height * 2 / 3 / elementSize).floor() - 1; x++) {
      for (int y = 0; y < (size.height / elementSize).floor() - 1; y++) {
        canvas.drawCircle(
            Offset((x * elementSize) + digitOffset.dx,
                (y * elementSize) + digitOffset.dy),
            elementSize / 2,
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
