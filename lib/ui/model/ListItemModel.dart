class ListItemModel {
  String userName;
  String time;
  String title;
  bool doesHaveAttachment;
  String description;
  String profilePic;
  List<ImageData> imagesData;

  ListItemModel({
    this.userName,
    this.time,
    this.title,
    this.doesHaveAttachment,
    this.description,
    this.imagesData,
    this.profilePic,
  });
}

class ImageData {
  String imageUrl;

  ImageData({
    this.imageUrl,
  });
}
