import 'package:flutter/material.dart';

class NixieTube extends StatefulWidget {
  final Size size;
  NixieTube({Key? key, this.size = Size.zero}) : super(key: key);

  @override
  State<NixieTube> createState() => _NixieTubeState();
}

class _NixieTubeState extends State<NixieTube> {
  @override
  Widget build(BuildContext context) {
    final Size size = Size(widget.size.width, widget.size.height);

    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.hardLight,
          gradient: LinearGradient(colors: [
            Colors.black26.withOpacity(0.5),
            Colors.white38.withOpacity(0.5),
            Colors.black26.withOpacity(0.5)
          ])),
    );
  }
}
