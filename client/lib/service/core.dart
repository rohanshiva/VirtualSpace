import "../model/shoe.dart";
import "../model/shirt.dart";
import "../model/pants.dart";
import "package:cloud_firestore/cloud_firestore.dart";


Future<Shoe> getShoe(String id) async {
  DocumentSnapshot documentSnapshot = await Firestore.instance.collection("Shoe").document(id).get();
  Map<String, dynamic> data  = documentSnapshot.data;
  data['id'] = id;
  Shoe shoe = Shoe.fromJson(data);
  return shoe;
}

Future<Shirt> getShirt(String id) async {
  DocumentSnapshot documentSnapshot = await Firestore.instance.collection("Shirt").document(id).get();
  Map<String, dynamic> data  = documentSnapshot.data;
  data['id'] = id;
  Shirt shirt = Shirt.fromJson(data);
  return shirt;
}

Future<Pants> getPants(String id) async {
  DocumentSnapshot documentSnapshot = await Firestore.instance.collection("Pants").document(id).get();
  Map<String, dynamic> data = documentSnapshot.data;
  data['id'] = id;
  Pants pants = Pants.fromJson(data);
  return pants;
}


Future<List<Map<String, dynamic>>> loadShoes(Function onFail) async {
  try{
    DocumentSnapshot shoeSnap = await Firestore.instance.collection("Metadata").document("Shoe").get();
    Map<String, dynamic> data  = shoeSnap.data;
    List<Map<String, dynamic>> results = [];
    data.forEach((String k, dynamic v){
        results.add({
          'id': v['id'],
          'name': v['name']
        });
    });
    return results;
  } 
  catch(error){
    onFail(error);
    return [];
  }
}

Future<List<Map<String, dynamic>>> loadShirts(Function onFail) async {
  try{
    DocumentSnapshot shirtSnap = await Firestore.instance.collection("Metadata").document("Shirt").get();
    Map<String, dynamic> data  = shirtSnap.data;
    List<Map<String, dynamic>> results = [];
    data.forEach((String k, dynamic v){
        results.add({
          'id': v['id'],
          'name': v['name']
        });
    });
    return results;
  } 
  catch(error){
    onFail(error);
    return [];
  }
}

Future<List<Map<String, dynamic>>> loadPants(Function onFail) async {
  try{
    DocumentSnapshot pantSnap = await Firestore.instance.collection("Metadata").document("Pants").get();
    Map<String, dynamic> data  = pantSnap.data;
    List<Map<String, dynamic>> results = [];
    data.forEach((String k, dynamic v){
        results.add({
          'id': v['id'],
          'name': v['name']
        });
    });
    return results;
  } 
  catch(error){
    onFail(error);
    return [];
  }
}