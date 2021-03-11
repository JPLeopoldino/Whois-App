import 'package:flutter/material.dart';

import 'package:whois/ui/home_page.dart';
import 'package:whois/ui/search_page.dart';
import 'package:whois/ui/domains_list_page.dart';

void main() async {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Who.is"),
          centerTitle: true,
        ),
        //---Insert Drawer
        backgroundColor: Colors.white,
        body: HomePage()
      ),
    );
  }
}

// drawer: Drawer(
// child: ListView(
// padding: EdgeInsets.zero,
// children: <Widget>[
// DrawerHeader(
// decoration: BoxDecoration(
// color: Colors.blue,
// ),
// padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 0.0),
// child: Text(
// 'Cabeçalho',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 25.0,
// color: Colors.white,
// letterSpacing: 1.5,
// ),
// ),
// ),
// ListTile(
// leading: Icon(Icons.change_history),
// title: Text('Item 1'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// leading: Icon(Icons.account_circle),
// title: Text('Item 2'),
// onTap: () {},
// ),
// ListTile(
// leading: Icon(Icons.account_circle),
// title: Text('Item 3'),
// onTap: () {},
// ),
// SizedBox(
// height: 330.0,
// ),
// AboutListTile(
// applicationName: "Who.is",
// applicationVersion: "0.1",
// icon: Icon(Icons.info_outline),
// dense: true,
// )
// ],
// ),
// ),
