import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nixie_digit/src/nixie_digit.dart';
import 'package:nixie_digit/src/cathode.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String numberSet = "04";
  int number = 0, index = 0;
  Timer timer = Timer(Duration(days: 1), () {});

  @override
  void initState() {
    index = 0;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      index++;
      if (index >= numberSet.length) index = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      // NixieDigit(number: 0),
      NixieDigit(number: int.parse(numberSet[index])),
      // NixieDigit(number,
      //     anode: true,
      //     anodeColor: Colors.blueGrey,),
      // const Cathode(cathodeColor: Colors.blueGrey),
    ]));
  }
}
