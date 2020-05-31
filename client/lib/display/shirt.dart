import './display.dart';
import "package:flutter/material.dart";
import "../service/core.dart";

class ShirtsDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShirtDisplay(),
    );
  }
}

class ShirtDisplay extends StatefulWidget{

  _ShirtDisplayState createState()=> _ShirtDisplayState();
}

class _ShirtDisplayState extends State<ShirtDisplay>{
  Widget build(BuildContext context){
    return Display(
      loadShirts
    );
  }
}