import 'package:client/global/context.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../shop/cart.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen();

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  bool _isCameraOn = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      controller = new CameraController(value[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          _isCameraOn = true;
        });
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget getBottomSelections() {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;

    Function getWidget = ({Function onClick, Map data}) {
      Widget child = Container();
      if (data.keys.length > 0) {
        child = Image.network(
          data["imageUrl"],
        );
      }
      return GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          width: sW * 0.2,
          child: child,
        ),
      );
    };

    Map tryingItems = Shop.of(context).tryingItems;
    return Container(
      height: sH * 0.1,
      child: (Row(
        children: <Widget>[
          Container(
            width: sW * 0.2,
          ),
          getWidget(
              onClick: () {
                Navigator.of(context).pop();
              },
              data: tryingItems["Shoe"]),
          Container(
            width: sW * 0.2,
          ),
          getWidget(
              onClick: () {
                Navigator.of(context).pop();
              },
              data: tryingItems["Shirt"]),
          Container(
            width: sW * 0.2,
          ),
        ],
      )),
    );
  }

  Widget getBody() {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    if (!_isCameraOn) {
      return Center(child: Text("Loading Camera..."));
    } else {
      return Column(
        children: <Widget>[
          Container(
            height: sH * 0.75,
            child: new AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: new CameraPreview(controller),
            ),
          ),
          getBottomSelections()
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    if (!_isCameraOn) {
      return new Container();
    }
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
        actions: <Widget>[CartButton()],
      ),
      body: getBody(),
    );
  }
}
