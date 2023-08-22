import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final primaryColor = Colors.lightGreen;
  List<int> diceList = [1, 1];

  int get totalPoint => diceList[0] + diceList[1];

  void randomDice() {
    for (var i = 0; i < 2; i++) {
      final random = Random();
      diceList[i] = random.nextInt(6) + 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Dice To Win"),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/newbackground.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beat your friends',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/dice${diceList[0]}.png",
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  "assets/images/dice${diceList[1]}.png",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Total: ${totalPoint}',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                color: primaryColor,
                child: Text(
                  "Go",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  randomDice();
                })
          ],
        ),
      ),
    );
  }
}
