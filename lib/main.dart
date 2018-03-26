import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new Main());

class Main extends StatelessWidget {

  final _iosTheme = new ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    brightness: Brightness.dark  
  );

  final _androidTheme = new ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    accentColor: Colors.amberAccent
  );


  @override
  Widget build(BuildContext context) => new MaterialApp(
    theme: defaultTargetPlatform == TargetPlatform.iOS ? _iosTheme : _androidTheme,
    home: new Homescreen(),
    title: 'Mad Meetuop',
  );
}


class Homescreen extends StatefulWidget {

  @override
  HomescreenState createState() => new HomescreenState();  

}

class HomescreenState extends State<Homescreen>{

  @override
  Widget build(context) => new Scaffold(
     backgroundColor: Colors.white,
    appBar: new AppBar(
      title: new Text('Mad Meetup'),
      centerTitle: defaultTargetPlatform == TargetPlatform.iOS ? true : false,
    ),

    body: new Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
      alignment: Alignment.center,
      child: new ListView(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: new Center(
              child: new Hero(
                tag: 'mad_image',
                child: new Image.network('https://madmeetup.com/img/logo.png'),
              ),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (_) {
                  return new SecondScreen();
                }
              ));
            },
            child: new Text('Ope next screen'),
          )
        ],
      )
    ),
  );
} 

class SecondScreen extends StatelessWidget {

  @override
  Widget build(context) => new Scaffold(
    body: new Center(
      child: new Hero(
        tag: 'mad_image',
        child: new Image.network('https://madmeetup.com/img/logo.png'),
      ),
    ),
  );
}