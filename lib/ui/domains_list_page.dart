import 'package:flutter/material.dart';

class DomainsPage extends StatelessWidget {

  List _DomainsList = ["google.com", "wab.com.br"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: _DomainsList.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_DomainsList[index]),
            );
          },
        ),
      ),
    );
  }
}
