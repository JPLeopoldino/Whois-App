import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:core';

Future<dynamic> _postData(Map<String, dynamic> body) async {
  const url = "http://wabstore.com.br/whois/api.php";
  var dio = Dio();
  try {
    FormData formData = new FormData.fromMap(body);
    var response = await dio.post(url, data: formData);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class SearchPage extends StatelessWidget {
  final String _searchUrl;

  SearchPage(this._searchUrl);

  String teste = '"Olá\noii"';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _postData({"domain": "$_searchUrl"}),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        strokeWidth: 5.0,
                      ),
                    ),
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Erro"),
                  );
                } else {
                  String returnString = snapshot.data;

                  return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      child: Icon(Icons.save_outlined),
                      onPressed: (){},
                    ),
                    appBar: AppBar(
                      title: Text("${_searchUrl.toLowerCase()}"),
                      centerTitle: true,

                    ),
                    //---Insert Drawer
                    backgroundColor: Colors.white,
                    body: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                          child: Text(
                            '$returnString',
                            style: TextStyle(color: Colors.blueGrey[800], fontSize: 15.0, height: 1.8),
                          ),
                        ),
                      ),
                    ),
                  );
                }
            }
          }),
    );
  }
}

// var apiUrl = Uri.parse("http://wabstore.com.br/whois/api.php");

// postData({"domain": "wab.com.br"});

// Future<String> getData() async {
//   var uri = Uri.parse('http://wabstore.com.br/whois/api.php');
//   var request = http.MultipartRequest('POST', uri);
//   request.fields['domain'] = 'wab.com.br';
//   var response = await request.send();
//   print('response code: ${response.statusCode}');
//
//   final respStr = response.stream.bytesToString();
//   return jsonDecode(respStr);
// }

// postData({"domain": "wab.com.br"});

// var response = await http.post(apiUrl, body: {'name': 'doodle', 'color': 'blue'});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

// String jsonString;
// print(response.stream.toString());
// await response.stream.transform(UTF8.decoder).listen((value) {
//   jsonString = value;
// });

// var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
// request.fields['domain'] = 'wab.com.br';
//
// // http.Response response = await http.post(apiUrl, body: {"key": "domain", "value": "wab.com.br"});
// print(request.fields);

// final uri = 'http://wabstore.com.br/whois/api.php';
// var map = new Map<String, dynamic>();
// map['domain'] = 'wab.com.br';
//
// http.Response response = await http.post(
//   uri,
//   body: map,
// );
//
// print(response.body);
