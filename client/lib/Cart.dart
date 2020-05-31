import 'package:flutter/material.dart';
import 'dart:math';
import './FadeAnimation.dart';
import './Shoes.dart';
import './global/global.dart';
import './thankYou.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => new _CartState();

}

class _CartState extends State<Cart> {

  List<Widget> getCartItems(){
      List<Map> data = Global.cart;
      List<Widget> widgets = [];
      widgets.add(Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'Cart',
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: "Montserrat", fontSize: 32),
            ),
          ),);
         data.forEach((e) {
          widgets.add(FadeAnimation(
              1.5,
              makeItem(
                  image: e["imageUrl"],
                  tag: 'red',
                  context: context,
                  brand: e["brand"],
                  name: e["name"],
                  price: e["price"],
                  id: e["id"],
                  data: e)));
            
 });
    widgets.add(Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 10),
            child: RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                print("Pressed");
                return ThankYou();
              }));},
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
            ),
          ),);
          return widgets;
  }

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
        children: getCartItems()
      ),
    );
  }

  Widget makeItem({image, tag, context, brand, name, price, id, data}) {
    return Hero(
      tag: id,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Shoes(
                        image: image,
                        id: id,
                        data: data,
                      )));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
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
                              name,
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
                              brand,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.2,
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ))
                ],
              ),
              FadeAnimation(
                  1.2,
                  Text(
                    "${price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
