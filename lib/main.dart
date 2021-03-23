import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];

  void _previosImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Taller Carrucel'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          image: AssetImage(photos[photoIndex]),
                          fit: BoxFit.cover)),
                  height: 400.0,
                  width: 300.0,
                ),
                Positioned(
                  top: 375.0,
                  left: 25.0,
                  right: 25.0,
                  child: SelectedPhoto(
                      numberofDots: photos.length, photoIndex: photoIndex),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('next'),
                onPressed: _nextImage,
                elevation: 5.0,
                color: Colors.lime,
              ),
              RaisedButton(
                child: Text('Prev'),
                onPressed: _previosImage,
                elevation: 5.0,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberofDots;
  final int photoIndex;

  SelectedPhoto({this.numberofDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
          )),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.0,
                    blurRadius: 2.0,
                  )
                ])),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberofDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
