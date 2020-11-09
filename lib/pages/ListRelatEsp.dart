import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListRelatEsp extends StatefulWidget {
  @override
  _ListRelatEspState createState() => _ListRelatEspState();
}

class _ListRelatEspState extends State<ListRelatEsp> {
  Future<List> relat_espget() async {
    final response =
        await http.get("http://192.168.2.7/seekhealth/relat_userGet.php");
    return json.decode(response.body);
  }
  bool isPesquisaR = false;
  void Sair() {
        AlertDialog alertDialog = new AlertDialog(
          backgroundColor: Colors.white,
          content: new Text(
            "   Sair do aplicativo?",
            style: new TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          actions: <Widget>[
            new RaisedButton(
                child: new Text(
                  "Sim",
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                color: Colors.green[200],
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: ()  => Navigator.of(context).pushNamedAndRemoveUntil ('/login',(Route <dynamic> route) => false),
                ),
            new RaisedButton(
              child: new Text(
                "Cancelar",
                style: new TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              color: Colors.red[200],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () => Navigator.pop(context),
        )
      ],
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: new Text(
          "Relatório Gerado",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/seek2.png'))),
              accountEmail: new Text("ezequiel@gmail.com",
                  style: TextStyle(color: Colors.black)),
              accountName: new Text("Ezequiel Mioranza",
                  style: TextStyle(color: Colors.black)),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  radius: 2000,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/dcc.png"),
                ),
                onTap: () => print("This is your current account."),
              ),
            ),
           ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
              title: Text('Home',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
              title: Text('Meu Perfil',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              onTap: () => {Navigator.pushNamed(context, '/perfil')},
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
              title: Text('Relatório',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              onTap: () => {Navigator.pushNamed(context, '/Relat')},
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
              title: Text('Feedback',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
              title: Text('Sugerir Unidade',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(
              height: 155,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black, size: 25),
              title: Text('Logout',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
                  onTap: () => Sair(),
        
            ),
          ],
        ),
     ),
      body: new FutureBuilder<List>(
        future: relat_espget(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemListUs(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
    
  }
}

  class ItemListUs extends StatelessWidget {
  final List list;
  ItemListUs({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(8.0),
              child: new Card(
                color: Colors.blue[50],
                child: new ListTile(
                  title: new Text(
                    list[i]['especialidade_relat'],
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  leading:
                      new Icon(Icons.person, size: 55.0, color: Colors.black),
                  subtitle: new Text(
                    "${list[i]['COUNT(id)']} buscas",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  
                ),
              ),
          );
        }
        );
  }
}