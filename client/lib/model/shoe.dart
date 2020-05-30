class Shoe{

  String id;  
  String name;
  String brand;
  num price;
  List<String> colors;
  List<String> sizes;
  String group;

  
  
  Shoe.fromJson(Map shoe){
    this.id = shoe['id'];
    this.name = shoe['name'];
    this.brand = shoe['brand'];
    this.price = shoe['price'];
    this.colors = shoe['color'];
    this.sizes = shoe["size"];
    this.group = shoe['group'];
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