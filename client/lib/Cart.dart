import 'package:flutter/material.dart';
import 'dart:math';
import './FadeAnimation.dart';
import './Shoes.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => new _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.sort, color: Colors.black),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'Cart',
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: "Montserrat", fontSize: 32),
            ),
          ),
          FadeAnimation(
              1.5,
              makeItem(
                  image: 'assets/images/one.jpg',
                  tag: 'red',
                  context: context)),
          FadeAnimation(
              1.6,
              makeItem(
                  image: 'assets/images/two.jpg',
                  tag: 'blue',
                  context: context)),
          FadeAnimation(
              1.7,
              makeItem(
                  image: 'assets/images/three.jpg',
                  tag: 'white',
                  context: context)),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 10),
            child: RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: () {},
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Shoes(
                        image: image,
                      )));
        },
        child: Container(
          height: 111,
          width: 320,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20, left: 2, right: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Sneakers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.1,
                            Text(
                              "Nike",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                 
                ],
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    "100\$",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
