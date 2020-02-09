
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiper Idea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Swiper Idea'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          front: Container(
            //  decoration: BoxDecoration(
            //  color: Colors.deepOrange,
            //  borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //  ),
            child: Card(
              color: Colors.red,
              elevation: 10,
              child: Center(
                child: Text(
                  '사과',
                  style: TextStyle(color: Colors.white, fontSize: 70,),),
              ),
            ),
          ),         
          back: Card(
            color: Colors.deepPurple,
            elevation: 10,
            child: Center(
              child: Text(
                'APPLE',
                style: TextStyle(color: Colors.white, fontSize: 70),),
            ),
          ),
        );
        },
        itemCount: 5,
        viewportFraction: 0.9,
        scale: 0.9,
        onIndexChanged: (index) {
            print(index);
        }
      ),
    );
  }
}
