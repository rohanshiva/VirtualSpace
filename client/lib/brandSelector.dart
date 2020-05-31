import 'package:flutter/material.dart';
import 'dart:math';
import './FadeAnimation.dart';
import './Shoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandSelector extends StatefulWidget {
  final List<String> brands;
  BrandSelector({@required this.brands});
  @override
  _BrandSelectorState createState() => new _BrandSelectorState();
}

class _BrandSelectorState extends State<BrandSelector> {
  int _currentIndex = 0;
  bool _isSelected;
  Map data = {"Shoes": [], "Shirts": []};
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchData().then((data) {
        setState(() {
          this.data = data;
        });
      });
    }
  }

  Future<Map> fetchData() async {
    Map<String, dynamic> data = {"Shoes": [], "Shirts": []};
    QuerySnapshot shoeData =
        await Firestore.instance.collection("Shoe").getDocuments();
    shoeData.documents.forEach((DocumentSnapshot snapshot) {
      data['Shoes'].add(snapshot.data);
    });
    QuerySnapshot shirtData =
        await Firestore.instance.collection("Shirt").getDocuments();
    shirtData.documents.forEach((DocumentSnapshot snapshot) {
      data['Shirts'].add(snapshot.data);
    });
    return data;
  }
  List<Widget> getList(List data) {
    return data.map((e) {
      return FadeAnimation(
              1.5,
              makeItem(
                  image: e["imageUrl"],
                  tag: 'red',
                  context: context,
                  brand: e["brand"],
                  name: e["name"],
                  price: e["price"],
                  id: e["id"],
                  data: e)
          );
    }).toList() as List<Widget>;
  }
    Widget products(int index) {
      return Column(
        children: getList(data[widget.brands[_currentIndex]])
      );
  }

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
    return Column(
      children: <Widget>[
        Row(
          children: _buildShoesBrands(),
        ),
        SizedBox(
          height: 20,
        ),
        products(_currentIndex),
      ],
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
                        data:data,
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
