import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String animationFile = 'cool.flr';
    String animationName = 'idle';
    bool data = ModalRoute.of(context).settings.arguments;
    if (!data) {
      animationName = 'Untitled';
      animationFile = 'error.flr';
    }
    print(data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Estatus",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: FlareActor(
          "assets/$animationFile",
          animation: animationName,
          callback: (animation){
            print("Animacion termianda");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
