import 'package:flutter/material.dart';
import 'package:reply/ui/model/ListItemModel.dart';
import 'package:reply/ui/ui/detail.dart';

class ListItemWithoutImages extends StatelessWidget {
  final ListItemModel item;

  ListItemWithoutImages({this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: BeveledRectangleBorder(),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailView(listItemModel: item);
          }));
        },
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
                        item.userName + " - " + item.time,
                        style: Theme
                            .of(context)
                            .textTheme
                            .body1,
                      ),
                      Text(
                        item.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subhead,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Image.network(
                      item.profilePic,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    child: Icon(Icons.attachment),
                    visible: item.doesHaveAttachment,
                  ),
                  Expanded(
                    child: Text(
                      item.description,
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
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemWithImages extends StatelessWidget {
  /*final bool hasAttachment;
  final List<ImageData> imagesData;
  final String userName, time, title, description, profilePic;*/
  final ListItemModel item;

  ListItemWithImages({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: BeveledRectangleBorder(),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetailView(listItemModel: item);
          }));
        },
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
                        item.userName + " - " + item.time,
                        style: Theme
                            .of(context)
                            .textTheme
                            .body1,
                      ),
                      Text(
                        item.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subhead,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Image.network(
                      item.profilePic,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    child: Icon(Icons.attachment),
                    visible: item.doesHaveAttachment,
                  ),
                  Expanded(
                    child: Text(
                      item.description,
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
                      child: Image.network(item.imagesData[index].imageUrl),
                    );
                  },
                  itemCount: item.imagesData?.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
