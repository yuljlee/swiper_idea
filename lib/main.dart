
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:swiper_idea/model/word.dart';



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

  List<String> korWord = [
    "사과",
    "바나나",
    "포도",
    "배",
    "자두",
    '수박'
  ];

  List<String> engWord = [
    "APPLE",
    "BANANA",
    "GRAPE",
    "PEAR",
    "PLUM",
    'WATER MELON'
  ];

  final FlutterTts flutterTts = FlutterTts();

  //var word = new Word();
   final Word word = Word();



  @override
  Widget build(BuildContext context) {

    Future _speak(String text) async {
      //print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('ko-KR');
      //await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SafeArea(child: Swiper(        
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                color: Colors.red,
                elevation: 10,
                child: Container(
                  height: 300,
                  child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      speed: 500,
                      front:
                        Center(
                          child: Text(
                            korWord[index],

                            style: TextStyle(color: Colors.white, fontSize: 70),),
                        ),
                                    
                          // RaisedButton(onPressed: () => _speak(korWord[index]),
                          // ),                             
                      back: Card(
                        color: Colors.deepPurple,
                        elevation: 10,
                        child: Center(
                          child: Text(
                            engWord[index],

                            style: TextStyle(color: Colors.white, fontSize: 70),),
                        ),
                      ),
                    ),)
                
                ),   
                Card(
                  color: Colors.blue,
                  elevation: 10,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Text(
                          engWord[index],

                          style: TextStyle(color: Colors.white, fontSize: 70),),)
                
                ),   
            ],
          );
          
          

        },
        itemCount: 5,
        viewportFraction: 0.8,
        
        scale: 0.8,
        onIndexChanged: (index) {
            print(index);
        }
        
      ),
      )
      
    );
  }
}
