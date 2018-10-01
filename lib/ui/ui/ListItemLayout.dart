import 'package:flutter/material.dart';
import 'package:reply/ui/model/ListItemModel.dart';
import 'package:reply/ui/ui/detail.dart';

class ListItemWithoutImages extends StatelessWidget {
  final bool hasAttachment;
  final String userName, time, title, description, profilePic;

  ListItemWithoutImages(
      {this.userName,
      this.time,
      this.title,
      this.description,
      this.profilePic,
      this.hasAttachment});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      userName + " - " + time,
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Hero(
                      tag: title,
                      child: Text(
                        title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subhead,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  child: Image.network(
                    profilePic,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Visibility(
                  child: Icon(Icons.attachment),
                  visible: hasAttachment,
                ),
                Expanded(
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.subhead,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemWithImages extends StatelessWidget {
  final bool hasAttachment;
  final List<ImageData> imagesData;
  final String userName, time, title, description, profilePic;

  ListItemWithImages({
    this.userName,
    this.time,
    this.title,
    this.description,
    this.profilePic,
    this.hasAttachment,
    this.imagesData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailView();
        }));
      },
      child: Card(
        shape: BeveledRectangleBorder(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        userName + " - " + time,
                        style: Theme
                            .of(context)
                            .textTheme
                            .body1,
                      ),
                      Hero(
                        tag: title,
                        child: Text(
                          title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Image.network(
                      profilePic,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    child: Icon(Icons.attachment),
                    visible: hasAttachment,
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Container(
                height: 75.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(imagesData[index].imageUrl),
                    );
                  },
                  itemCount: imagesData?.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
