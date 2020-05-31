import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './brandSelector.dart';
import './FadeAnimation.dart';
import './Shoes.dart';
import './Cart.dart';

class CameraScreen extends StatefulWidget {
  

  CameraScreen();

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      controller =
        new CameraController(value[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    });
    
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return  Scaffold(
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                print("Pressed");
                return Cart();
              }));
            },
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
          child: new AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: new CameraPreview(controller),
          ),
        ),
        // BrandSelector(brands: ["Shoes","Pants","Shirts"]),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: null,
      backgroundColor: Colors.black,
      child: Icon(Icons.photo_camera),
      ),
    );
    
  }
}
