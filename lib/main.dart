import 'package:flutter/material.dart';
import 'package:pokedex_try1/Pages/HomePage.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title , theme
      home: HomePage(),
    );
  }
}
