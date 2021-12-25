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
    ['assets/images/w1.jpeg', 'watch name super', '19 \$'],
    ['assets/images/w2.jpeg', 'watch name super', '19 \$'],
    ['assets/images/w3.jpeg', 'watch name super', '19 \$'],
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
                          Colors.grey[700]!.withOpacity(.9),
                          Colors.grey.withOpacity(.0)
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 90,
                          margin: EdgeInsets.only(bottom: 60),
                          child: Row(
                            children: _buildIndicator(),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -40),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[currentIndex][1],
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indecator(bool isActiv) {
    return Expanded(
        child: Container(
      height: 4,
      margin: EdgeInsets.only(
        right: 5,
      ),
      decoration:
          BoxDecoration(color: isActiv ? Colors.grey[800] : Colors.white),
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
