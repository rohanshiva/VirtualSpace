class User{
  String id;
  String email;
  String imageUrl;


  User(String i, String e, String im){
    this.id = i;
    this.email = e;
    this.imageUrl = im;
  }

  serialize(){
    return {
      'id': this.id,
      'email': this.email,
      'imageUrl': this.imageUrl
    };
  }
}