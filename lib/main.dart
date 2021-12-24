import 'package:flutter/material.dart';

void main() => runApp((const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )));

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
