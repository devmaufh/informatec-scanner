import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:informatec_scanner/api/apiProvider.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _animation = "scan";  
  FlareControls _controls = FlareControls();
  @override
  void initState() { 
    Timer.periodic(Duration(seconds: 10), (timer){
      setState(() {
        _controls.play('scan');
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Informa-Tec Scanner", style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
              child: Center(
          child: Container(
            height: size.height * 0.9,
            width: size.width * 0.9,
            child: FlareActor(
              'assets/qrcode.flr',
              animation: _animation,
              controller: _controls,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Escanear"),
        backgroundColor: Colors.purple,
        icon: Icon(Icons.center_focus_weak),
        hoverColor: Colors.purpleAccent,
        tooltip: "Escanear código",
        onPressed: (){
          _scanCode();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );  
  }
  _scanCode()async{
    String data = "";
    try{
      data = await QRCodeReader().scan();
      final apiResponse = await ApiRepository().checkIfUserExists(data);
      Navigator.pushNamed(context, 'result',arguments: apiResponse);
    } catch(e){
      data ="";
    }    
  }
}