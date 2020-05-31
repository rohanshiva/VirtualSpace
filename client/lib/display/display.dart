import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Display extends StatefulWidget{
  Function _loadFunc;
  Display(loadFunc){
    this._loadFunc = loadFunc;
  }

  _DisplayState createState()=> _DisplayState();
}

class _DisplayState extends State<Display>{

  List _persisted = [];
  List _data = [];
  TextEditingController _query = TextEditingController(text: "");
  bool isLoading = true;
  ScrollController _listScroller = ScrollController();


  @override
  void initState(){
    super.initState();
    if(mounted){
      widget._loadFunc((error){print(error);}).then((List data){
      setState((){
        this._persisted = data;
        this._data = data;
        this.isLoading = false;
      });
      _query.addListener(() {
        setState(() {
          this._data = runQuery(this._query.text);
        });
        _listScroller.jumpTo(0.0);
      });
    });
    }
  }

  List<Map> runQuery(String query){
   return  _persisted.where((element){
      String name = element['name'];
      return name.startsWith(query);
    }).toList();
  } 


  @override
  void dispose(){
    _listScroller.dispose();
    _query.dispose();
    super.dispose();
  }




  Widget createTile(Map data){
    return ListTile(
            leading: Icon(Icons.shop, color: Colors.black),
            title: Text(
             data['name']
            ,style: TextStyle(
              fontSize: 18),
            ),
        );
  }




  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
          child: Container(
            width: screenWidth * .9,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _query,
                        onTap: () {
                          _listScroller.jumpTo(0.0);
                        },
                        decoration: InputDecoration(labelText: "SName"),
                      ),
                    ),
                  ),
                ])),
                ListView.builder(
                  controller: _listScroller,
                  itemCount: _data.length,
                  shrinkWrap: true,
                  itemBuilder:(context, i){
                    return createTile(_data[i]);
                  },
                   )
              ]
              )));
  }
}


Future<Map> fetchData() async {
  Map<String, dynamic> data = {"Shoes":[], "Shirts":[]};
 QuerySnapshot shoeData = await Firestore.instance.collection("Shoe").getDocuments();
 shoeData.documents.forEach((DocumentSnapshot snapshot){
   data['Shoes'].add(snapshot.data);
 });
 QuerySnapshot shirtData = await Firestore.instance.collection("Shirt").getDocuments();
 shirtData.documents.forEach((DocumentSnapshot snapshot){
   data['Shirt'].add(snapshot.data);
 });
  return data;
}