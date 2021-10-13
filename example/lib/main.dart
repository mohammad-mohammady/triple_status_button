import 'package:flutter/material.dart';
import 'package:triple_status_button/triple_status_button.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
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
      body: Container(
        color: Colors.deepPurpleAccent.shade700,
        child: Center(
          child:  TripleStatusButton(
            height: 40,
            hasIcon: false,
            backgroundColor: const Color(0xffA28DF8).withOpacity(.4),
            circleColor: Colors.white,
            circleAnimState: (state) {
              if (state == CircleAnimState.right) {
                print('right');
              } else if (state == CircleAnimState.middle) {
                print('middle');
              } else if (state == CircleAnimState.left) {
                print('left');
              }
            },
          )
        ),
      ),
    );
  }
}
