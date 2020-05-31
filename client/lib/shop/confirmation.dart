import 'package:client/util/transition.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class ThankYou extends StatefulWidget {


  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {

  double _width = 100;
  double _height = 100;


  double _updateState() {
      setState(() {
        _width = 200;
        _height= 200;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             RaisedButton(onPressed: (){_updateState();},
                color: Colors.white,
                child: Text('Thank You for the order', style: TextStyle(fontFamily: "Montserrat", fontSize: 16),),
             ),
             AnimatedContainer(
               duration: Duration(milliseconds: 400),
               curve: Curves.bounceIn,
               width: _width,
               height: _height,
               child: Image.asset('assets/images/check.png'),
             ),
             Container(child: 
             RaisedButton(
               color: Colors.white,
                child: Text('Back to Explore', style: TextStyle(fontFamily: "Montserrat", fontSize: 16),),
               onPressed: (){
               Navigator.of(context).push(NoTransition(builder: (BuildContext context){
                 return HomePage();
               }));
             },),)
           ],
         ),
       ),
    );
  }
}