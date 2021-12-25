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
  final List<List<String>> products = [
    [
      'assets/images/w1.jpeg',
      'watch name super'
          '19 \$'
    ],
    [
      'assets/images/w2.jpeg',
      'watch name super'
          '19 \$'
    ],
    [
      'assets/images/w3.jpeg',
      'watch name super'
          '19 \$'
    ],
  ];
  int currentIndex = 0;
  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _preve();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: Container(
                height: 550,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(products[currentIndex][0]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                        Colors.grey[700]!.withOpacity(.9),
                        Colors.grey.withOpacity(.0)
                      ])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
