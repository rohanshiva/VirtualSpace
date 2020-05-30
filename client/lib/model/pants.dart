class Pants{
  String id;  
  String name;
  String brand;
  num price;
  List<String> colors;
  List<String> sizes;
  String group;
  
  Pants.fromJson(Map pants){
    this.id = pants['id'];
    this.name = pants['name'];
    this.brand = pants['brand'];
    this.price = pants['price'];
    this.colors = pants['color'];
    this.sizes = pants["size"];
    this.group = pants['group'];
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