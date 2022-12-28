class FaceBookUser {
  String? email;
  int? id;
  String? name;
  PictureData? pictureData;
  FaceBookUser.fromMap(Map<String, dynamic> userMap) {
    email = userMap['email'];
    id = int.parse(userMap['id']);
    name = userMap['name'];
    pictureData = PictureData.fromMap(userMap['picture']['data']);
  }
}

class PictureData {
  double? height;
  double? width;
  bool? isSilhouette;
  String? url;

  PictureData.fromMap(Map<String, dynamic> picture) {
    height = double.parse(picture['height'].toString());
    width = double.parse(picture['width'].toString());
    isSilhouette = picture['is_silhouette'] == 0;
    url = picture['url'];
  }
}
