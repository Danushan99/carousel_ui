import 'dart:ui';
import 'package:carousel_ui/animations/fadeanimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      (const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      )),
    );

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<List<String>> products = [
    ['assets/images/w1.jpeg', 'Nomos Glashuette', '169 \$'],
    ['assets/images/w2.jpeg', 'Hugo Boss White ', '189 \$'],
    ['assets/images/w3.jpeg', 'Emporio Armani Classic', '199 \$'],
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
      body: Column(
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
              width: double.infinity,
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
                      Colors.grey[900].withOpacity(.9),
                      Colors.grey.withOpacity(.0)
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 90,
                      margin: const EdgeInsets.only(bottom: 60),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1.3,
                      Text(
                        products[currentIndex][1],
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        FadeAnimation(
                            1.4,
                            Text(
                              products[currentIndex][2],
                              style: TextStyle(
                                  color: Colors.yellow[700],
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        FadeAnimation(
                          1.4,
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              Icon(
                                Icons.star_half,
                                size: 20,
                                color: Colors.yellow[700],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    FadeAnimation(
                      1.5,
                      Row(
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            '(4.5/70 Reviews)',
                            style: TextStyle(
                                color: Colors.green[500], fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      1.7,
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow[700],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "ADD TO CARD",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indecator(bool isActiv) {
    return Expanded(
        child: Container(
      height: 4,
      margin: const EdgeInsets.only(
        right: 5,
      ),
      decoration:
          BoxDecoration(color: isActiv ? Colors.yellow[700] : Colors.white),
    ));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indecator(true));
      } else {
        indicators.add(_indecator(false));
      }
    }
    return indicators;
  }
}
