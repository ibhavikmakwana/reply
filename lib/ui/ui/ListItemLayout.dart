import 'package:flutter/material.dart';
import 'package:reply/ui/model/ListItemModel.dart';
import 'package:reply/ui/ui/detail.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItemWithoutImages extends StatefulWidget {
  final ListItemModel item;

  ListItemWithoutImages({this.item});

  @override
  ListItemWithoutImagesState createState() {
    return new ListItemWithoutImagesState();
  }
}

class ListItemWithoutImagesState extends State<ListItemWithoutImages> {
  void setSelectedItem({ListItemModel listItemModel}) {
    setState(() {
      listItemModel.isSelected = !listItemModel.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      delegate: SlidableScrollDelegate(),
      actionExtentRatio: 0.50,
      closeOnScroll: true,
      secondaryActions: <Widget>[
        IconSlideAction(
          icon: Icons.archive,
          color: Colors.blueGrey,
        ),
      ],
      child: Card(
        elevation: 2.0,
        shape: BeveledRectangleBorder(),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailView(listItemModel: widget.item);
            }));
          },
          onLongPress: () {
            setSelectedItem();
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
                          widget.item.userName + " - " + widget.item.time,
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                        Text(
                          widget.item.title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      child: widget.item.isSelected
                          ? Container(
                        color: Colors.yellow,
                        child: Icon(
                          Icons.check,
                        ),
                      )
                          : Image.network(
                        widget.item.profilePic,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Visibility(
                      child: Icon(Icons.attachment),
                      visible: widget.item.doesHaveAttachment,
                    ),
                    Expanded(
                      child: Text(
                        widget.item.description,
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
      ),
    );
  }
}

class ListItemWithImages extends StatefulWidget {
  /*final bool hasAttachment;
  final List<ImageData> imagesData;
  final String userName, time, title, description, profilePic;*/
  final ListItemModel item;

  ListItemWithImages({
    this.item,
  });

  @override
  ListItemWithImagesState createState() {
    return new ListItemWithImagesState();
  }
}

class ListItemWithImagesState extends State<ListItemWithImages> {
  void setSelectedItem({ListItemModel listItemModel}) {
    setState(() {
      listItemModel.isSelected = !listItemModel.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      delegate: SlidableDrawerDelegate(),
      actionExtentRatio: 0.50,
      secondaryActions: <Widget>[
        IconSlideAction(
          icon: Icons.archive,
          color: Colors.blueGrey,
        ),
      ],
      child: Card(
        elevation: 1.0,
        shape: BeveledRectangleBorder(),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailView(listItemModel: widget.item);
                },
              ),
            );
          },
          onLongPress: () {
            setSelectedItem();
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
                          widget.item.userName + " - " + widget.item.time,
                          style: Theme
                              .of(context)
                              .textTheme
                              .body1,
                        ),
                        Text(
                          widget.item.title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      child: widget.item.isSelected
                          ? Container(
                        color: Colors.yellow,
                        child: Icon(
                          Icons.check,
                        ),
                      )
                          : Image.network(
                        widget.item.profilePic,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Visibility(
                      child: Icon(Icons.attachment),
                      visible: widget.item.doesHaveAttachment,
                    ),
                    Expanded(
                      child: Text(
                        widget.item.description,
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
                        child: Image.network(
                            widget.item.imagesData[index].imageUrl),
                      );
                    },
                    itemCount: widget.item.imagesData?.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
