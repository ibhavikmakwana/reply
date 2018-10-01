import 'package:flutter/material.dart';
import 'package:reply/ui/model/ListItemModel.dart';
import 'package:reply/ui/utils/text.dart';

class DetailView extends StatelessWidget {
  final ListItemModel listItemModel;

  DetailView({this.listItemModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    titleView(context),
                    aboutView(context),
                    description(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*
  Title view
   */
  titleView(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Hero(
            tag: listItemModel.title,
            child: Text(
              "High school reunion",
              softWrap: true,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            radius: 24.0,
            borderRadius: BorderRadius.circular(24.0),
            onTap: () {},
            child: Icon(
              Icons.keyboard_arrow_down,
            ),
          ),
        ),
      ],
    );
  }

  aboutView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text("vbetrb"),
            Text("vbetrb"),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: FlutterLogo(
            size: 24.0,
          ),
        )
      ],
    );
  }

  description() {
    return Container(
      child: Text(loremIpsum),
      margin: EdgeInsets.only(top: 8.0),
    );
  }
}
