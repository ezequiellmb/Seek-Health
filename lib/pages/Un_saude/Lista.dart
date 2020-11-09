import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:seekhealth/pages/Un_saude/Delete.dart';
import 'package:seekhealth/pages/Un_saude/Add.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  Future<List> usget() async {
    final response =
        await http.get("http://192.168.2.7/seekhealth/us_get.php");
    return json.decode(response.body);
  }

  bool isPesquisa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isPesquisa
            ? Text("Unidades Cadastradas")
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Buscar Unidades",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isPesquisa = !this.isPesquisa;
              });
            },
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.person_add),
          backgroundColor: Colors.green[700],
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Add(),
            ));
          }),
      body: new FutureBuilder<List>(
        future: usget(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
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

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Delete(
                          list: list,
                          index: i,
                        )),
              ),
              child: new Card(
                color: Colors.blue[50],
                child: new ListTile(
                  title: new Text(
                    list[i]['us_nome'],
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  leading:
                      new Icon(Icons.person, size: 55.0, color: Colors.black),
                  subtitle: new Text(
                    "${list[i]['us_endereco']}",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        }
        );
  }
}
