import 'package:flutter/material.dart';
import 'package:whois/ui/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  String searchText (TextEditingController s){
    String resposta = "";
    if(s.text.startsWith("www.")){
      resposta = s.text.replaceRange(0, 4, "");
    } else {
      resposta = s.text;
    }
    return resposta;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Busque seu Domínio',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "Insira um Domínio",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                      ),
                      // style: TextStyle(letterSpacing: 1.0, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
                      ),
                    ),
                    child: Text(
                      'Buscar',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage(searchText(searchController)))
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: SizedBox(),)
        ],
      ),
    );
  }
}

// RaisedButton.icon(
// color: Colors.blue,
// textColor: Colors.white,
// highlightElevation: 4.0,
// onPressed: () {},
// padding:
// EdgeInsets.symmetric(vertical: 15.0, horizontal: 110.0),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(
// Radius.circular(10.0),
// ),
// ),
// label: Text(
// 'Buscar',
// style: TextStyle(fontSize: 20.0),
// ),
// icon: Icon(Icons.search),
// ),


