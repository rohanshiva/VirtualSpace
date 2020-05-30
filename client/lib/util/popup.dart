import "package:flutter/material.dart";

class SingleActionPopup extends StatelessWidget {
  String _message;
  String _header;
  Color _color;

  SingleActionPopup(String message, String header, Color color) {
    this._header = header;
    this._message = message;
    this._color = color;
  }
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
    double pW = 411.42857142857144;
    double pH = 683.4285714285714;
  
    return AlertDialog(
            title: Text(_header,
                style: TextStyle(color: _color, fontSize: 26 * sW / pW)),
            content: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                child: Column(
                  children: <Widget>[
                    Text(_message, style: TextStyle(fontSize: 16 * sW / pW)),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.blue, fontSize: 24 * sW / pW),
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
  }
}