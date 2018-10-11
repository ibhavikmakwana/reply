class ListItemModel {
  String userName;
  String time;
  String title;
  bool doesHaveAttachment;
  String description;
  String profilePic;
  List<ImageData> imagesData;
  bool isSelected = false;

  ListItemModel({this.userName,
    this.time,
    this.title,
    this.doesHaveAttachment,
    this.description,
    this.imagesData,
    this.profilePic,
    this.isSelected});
}

class ImageData {
  String imageUrl;

  ImageData({
    this.imageUrl,
  });
}
