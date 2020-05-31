import "../model/user.dart";
class Global{
  static User user;
  static List<Map> cart = [];
  static Set<String> itemsInCart = Set();


  static void addToCart(Map data){
    if(!itemsInCart.contains(data["id"])){
      cart.add(data);
      itemsInCart.add(data["id"]);
    }
  }
}