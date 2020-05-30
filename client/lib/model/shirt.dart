class Shirt{
  String id;  
  String name;
  String brand;
  num price;
  List<String> colors;
  List<String> sizes;
  String group;
  
  Shirt.fromJson(Map shirt){
    this.id = shirt['id'];
    this.name = shirt['name'];
    this.brand = shirt['brand'];
    this.price = shirt['price'];
    this.colors = shirt['color'];
    this.sizes = shirt["size"];
    this.group = shirt['group'];
  }


  Map serialize(){
    return 
      {
        "id": this.id,
        "name": this.name,
        "brand": this.brand,
        "price": this.price,
        "colors": this.colors,
        "sizes": this.sizes,
        "group": this.group
      };
  }
}