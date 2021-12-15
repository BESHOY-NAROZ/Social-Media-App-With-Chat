class PostModel {
  String name;
  String image;
  String postText;
  String postImage;
  String postDate;
  String elementID;

  PostModel({
    this.name,
    this.image,
    this.postText,
    this.postImage,
    this.postDate,
    this.elementID,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    postText = json['postText'];
    postImage = json['postImage'];
    postDate = json['postDate'];
    elementID = json['elementID'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'postText': postText,
      'postImage': postImage,
      'postDate': postDate,
      'elementID': elementID,
    };
  }
}
