import 'package:flutter/material.dart';
import 'package:reply/ui/data/ListData.dart';
import 'package:reply/ui/ui/ListItemLayout.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        key: _scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: fabUI(),
        bottomNavigationBar: bottomAppBarUI(),
        body: getListViewUI(),
      ),
    );
  }

  Widget bottomAppBarUI() {
    IconData _arrowUp = Icons.arrow_drop_up;

    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(_arrowUp),
                color: Colors.white,
                onPressed: () {
                  modalBottomSheet();
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      color: Colors.blueGrey,
      notchMargin: isFabVisible ? 4.0 : 0.0,
      shape: CircularNotchedRectangle(),
    );
  }

  Widget fabUI() {
    return Visibility(
      visible: isFabVisible,
      child: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),
        onPressed: () {},
      ),
    );
  }

  /*
  Build the list view
   */
  Widget getListViewUI() {
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: itemsModel.length,
      shrinkWrap: true,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = itemsModel[index];
        if (item.imagesData != null) {
          return ListItemWithImages(
            userName: item.userName,
            title: item.title,
            time: item.time,
            hasAttachment: item.doesHaveAttachment,
            description: item.description,
            imagesData: item.imagesData,
            profilePic: item.profilePic,
          );
        } else {
          return ListItemWithoutImages(
            userName: item.userName,
            title: item.title,
            time: item.time,
            hasAttachment: item.doesHaveAttachment,
            description: item.description,
            profilePic: item.profilePic,
          );
        }
      },
    );
  }

  modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      new ListTile(
                        leading: new Icon(Icons.inbox),
                        title: new Text('Inbox'),
                        onTap: () => null,
                      ),
                      new ListTile(
                        leading: new Icon(Icons.star_border),
                        title: new Text('Starred'),
                        onTap: () => null,
                      ),
                      new ListTile(
                        leading: new Icon(Icons.send),
                        title: new Text('Sent'),
                        onTap: () => null,
                      ),
                      new ListTile(
                        leading: new Icon(Icons.delete),
                        title: new Text('Trash'),
                        onTap: () => null,
                      ),
                      new ListTile(
                        leading: new Icon(Icons.error_outline),
                        title: new Text('Spam'),
                        onTap: () => null,
                      ),
                      new ListTile(
                        leading: new Icon(Icons.drafts),
                        title: new Text('Drafts'),
                        onTap: () => null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
