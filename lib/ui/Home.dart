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
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: fabUI(),
        bottomNavigationBar: bottomAppBarUI(),
        body: getListViewUI(),
      ),
    );
  }

  Widget bottomAppBarUI() {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
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
        child: const Icon(
          Icons.edit,
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
      controller: _scrollController,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = itemsModel[index];
        if (item.imagesData != null) {
          return ListItemWithImages(
            item: item,
          );
        } else {
          return ListItemWithoutImages(
            item: item,
          );
        }
      },
    );
  }

  modalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          Container(
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                color: Color(0xFF17262A),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(),
                  Expanded(
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color(0xFF304049),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(16.0),
                          topRight: const Radius.circular(16.0),
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          new ListTile(
                            leading: new Icon(
                              Icons.inbox,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Inbox',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                          new ListTile(
                            leading: new Icon(
                              Icons.star_border,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Starred',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                          new ListTile(
                            leading: new Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Sent',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                          new ListTile(
                            leading: new Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Trash',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                          new ListTile(
                            leading: new Icon(
                              Icons.error_outline,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Spam',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                          new ListTile(
                            leading: new Icon(
                              Icons.drafts,
                              color: Colors.white,
                            ),
                            title: new Text(
                              'Drafts',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () => null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
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
                ],
              ),
            ),
          ),
    );
  }
}
