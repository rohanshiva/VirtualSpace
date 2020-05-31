
import 'package:flutter/material.dart';

class ShopState extends State<Shop> {

  Map tryingItems = {"Shoe": {}, "Shirt": {}, "Pants": {}}; 
  Map cart = {};

  void changeShoe(Map shoe){
    Map temp = tryingItems;
    temp["Shoe"] = shoe;
    setState((){
      tryingItems = temp;
    });
  }

  void changeShirt(Map shirt){
    Map temp = tryingItems;
    temp["Shirt"] = shirt;
    setState((){
      tryingItems = temp;
    });
  }

  void changePants(Map pants){
     Map temp = tryingItems;
    temp["Pants"] = pants;
    setState((){
      tryingItems = temp;
    });
  }

  void addToCart(Map data){
    Map tempCart = cart;
    if(!tempCart.containsKey(data['id'])){
      tempCart[data['id']] = data;
    }
    setState((){
      cart = tempCart;
    });
  }

  void removeFromCart(Map data){
    Map tempCart = cart;
    tempCart.remove(data['id']);
    setState((){
      cart = tempCart;
    });
  }

  void onPurchase(){
    setState((){
      cart = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedShop(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedShop extends InheritedWidget {
  // Data is your entire state. In our case just 'User'
  final ShopState data;

  // You must pass through a child and your state.
  _InheritedShop({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);


  @override
  bool updateShouldNotify(_InheritedShop old) => true;
}

class Shop extends StatefulWidget {
  // You must pass through a child.
  final Widget child;
  final Map cart;
  final Map tryingItems;

  Shop(
      {@required this.child,
      this.cart,
      this.tryingItems,
      });


  static ShopState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedShop)
            as _InheritedShop)
        .data;
  }

  @override
  ShopState createState() => ShopState();
}