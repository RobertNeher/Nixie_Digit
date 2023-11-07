import 'dart:async';

import 'package:flutter/material.dart';

import 'package:nixie_digit/src/nixie_digit.dart';
import 'package:nixie_digit/src/tube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nixie Tube Digit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nixie Tube Digit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  Timer timer = Timer(const Duration(days: 1), () {});

  @override
  void initState() {
    number = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      number++;
      if (number > 9) number = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NixieDigit(
        number: number,
        dimmedColor: Colors.blueGrey,
        cathodeColor: Colors.black26,
        glowingColor: Colors.deepOrange,
      ),
    );
  }
}
