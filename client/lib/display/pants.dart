import './display.dart';
import "package:flutter/material.dart";
import "../service/core.dart";

class PantsDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PantsDisplay(),
    );
  }
}

class PantsDisplay extends StatefulWidget{

  _PantsDisplayState createState()=> _PantsDisplayState();
}

class _PantsDisplayState extends State<PantsDisplay>{
  Widget build(BuildContext context){
    return Display(
      loadPants
    );
  }
}

