import 'package:flutter/material.dart';
import 'dart:math';
import './display/pants.dart';
import './display/shirt.dart';
import './display/shoe.dart';

class BrandSelector extends StatefulWidget {
  final List<String> brands;
  BrandSelector({@required this.brands});
  @override
  _BrandSelectorState createState() => new _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  int _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildShoesBrands() {
    return widget.brands.map((brand) {
      var index = widget.brands.indexOf(brand);
      _isSelected = _currentIndex == index;
      return Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
            print(widget.brands[_currentIndex]);
            switch(widget.brands[_currentIndex]) {
              case "Shoes" : { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return ShoeDisplayScreen();
                }));}
                break;
               
               case "Pants" : { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return PantsDisplayScreen();
                }));}
                break;
              default:
                 { Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return ShirtsDisplayScreen();
                }));}
                break;
            }
          },
          child: Text(
            brand,
            style: TextStyle(
              color: _isSelected ? Colors.black : Colors.grey,
              fontSize: _isSelected ? 22 : 16,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildShoesBrands(),
    );
  }
}
