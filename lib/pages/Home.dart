import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController _controllerNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('HOME', textAlign: TextAlign.end),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: Text("Recuperar Senha", textAlign: TextAlign.left)),
                new RaisedButton(
                  child: new Text("Lista"),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, "/lista");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
