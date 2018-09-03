import 'package:flutter/material.dart';
import 'package:reply/ui/ListItem.dart';

final items = List<ListItem>.generate(
  25,
  (i) => i % 6 == 0
      ? HeadingItem("Heading $i")
      : MessageItem("Sender $i", "Message body $i"),
);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      shape: CircularNotchedRectangle(),
    );
  }

  Widget fabUI() {
    return FloatingActionButton(
      backgroundColor: Colors.amberAccent,
      child: const Icon(
        Icons.edit,
        color: Colors.blueGrey,
      ),
      onPressed: () {},
    );
  }

  Widget getListViewUI() {
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
      },
    );
  }

  modalBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.blueGrey,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
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
                ListTile(
                  leading: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down),
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
                ),
              ],
            ),
          );
        });
  }
}
