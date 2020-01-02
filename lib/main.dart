import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  theme: ThemeData(
    primarySwatch: Colors.green,
  ),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Brew Crew",
          style: TextStyle( 
            letterSpacing: 1,
          )
          ),
        centerTitle: true,
      ),
    );
  }
}
