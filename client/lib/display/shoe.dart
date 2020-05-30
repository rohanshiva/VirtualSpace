
import './display.dart';
import "package:flutter/material.dart";
import "../service/core.dart";

class ShoeDisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoeDisplay(),
    );
  }
}

class ShoeDisplay extends StatefulWidget{


  _ShoeDisplayState createState()=> _ShoeDisplayState();
}

class _ShoeDisplayState extends State<ShoeDisplay>{
  Widget build(BuildContext context){
    return Display(
      loadShoes
    );
  }
}
