import 'package:client/util/animation.dart';
import 'package:client/util/transition.dart';
import '../display/product.dart';
import 'package:flutter/material.dart';
import 'confirmation.dart';
import "../global/context.dart";


class CartButton extends StatefulWidget{
  @override
  _CartButtonState createState() => new _CartButtonState();
}

class _CartButtonState extends State<CartButton>{

  Widget build(BuildContext context){
    int cartItems = Shop.of(context).cart.keys.length;
     return IconButton(
            onPressed: () {
              Navigator.of(context).push(NoTransition(builder: (context) {
                return Cart();
              }));
            },
            icon: cartItems > 0 ? Stack(
            children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      Positioned(
                        right: 0,
                        top: 10,
                        child: ClipOval(
                          child: Container(
                            width: 13,
                            height: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 11,
                        child: ClipOval(
                          child: Container(
                            width: 11,
                            height: 11,
                            color: Colors.red,
                            child: Text(
                              "$cartItems",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
            ):
        Icon(
        Icons.shopping_cart,
            color: Colors.black,
        ));
   }
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => new _CartState();

}

class _CartState extends State<Cart> {

  Widget getCartItems(){
      Map cart = Shop.of(context).cart;
      List keys = cart.keys.toList();
      if(keys.length == 0){
        return Container(
          child: Text("No Items In Cart",
          style: TextStyle(
            fontSize: 24
          )),
          );
      }
      return ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, i){
          Map value = cart[keys[i]];
          return FadeAnimation(
              1.5,
              makeItem(
                  image: value["imageUrl"],
                  tag: 'red',
                  context: context,
                  brand: value["brand"],
                  name: value["name"],
                  price: value["price"],
                  id: value["id"],
                  data: value)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        brightness: Brightness.light,
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
          Container(
            height: sH * 0.65,
            child: getCartItems()
          ),
          Center(
              child: Container(
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Shop.of(context).onPurchase();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ThankYou();
                }));},
                color: Colors.black,
                textColor: Colors.white,
                child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
              ),
            ),
          )
        ]
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
                  builder: (context) => Product(
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
