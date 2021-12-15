class LikeORCommentModel {
  bool isLiked;
  String elementID;
  int likedColor;

  LikeORCommentModel({this.isLiked, this.elementID, this.likedColor});

  LikeORCommentModel.fromJson(Map<String, dynamic> json) {
    isLiked = json['isLiked'];
    elementID = json['elementID'];
    likedColor = json['likedColor'];
  }

  Map<String, dynamic> toMap() {
    return {
      'isLiked': isLiked,
      'elementID': elementID,
      'likedColor': likedColor,
    };
  }
}
