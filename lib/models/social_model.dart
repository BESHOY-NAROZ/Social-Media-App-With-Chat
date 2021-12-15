class SocialModel {
  String name;
  String email;
  String phone;
  String bio;
  String image;
  String cover;
  String uID;

  SocialModel(
      {this.name,
      this.email,
      this.phone,
      this.bio,
      this.image,
      this.cover,
      this.uID});

  SocialModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];
    uID = json['uID'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'bio': bio,
      'image': image,
      'cover': cover,
      'uID': uID,
    };
  }
}
