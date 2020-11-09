import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/ListaUsuario.dart';
import 'package:seekhealth/pages/edita.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<void> delet() async {
    var url = "http://192.168.2.7/seekhealth/delete.php";
    http.post(url, body: {'idUsuario': widget.list[widget.index]['idUsuario']});
  }

  void Confirmar() {
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Colors.white,
      content: new Text(
        "   Excluir ${widget.list[widget.index]['nome']}?",
        style: new TextStyle(color: Colors.black, fontSize: 16.0),
      ),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              "Sim",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.green[800],
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              delet();
              Navigator.of(context).pushNamedAndRemoveUntil('/lista', ModalRoute.withName('/adm'));
            }),
        new RaisedButton(
          child: new Text(
            "Cancelar",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.red[900],
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
          title: new Text("${widget.list[widget.index]['nome']}"),
          backgroundColor: Colors.indigo[900],
        ),
        body: new Container(
          color: Colors.black12,
          height: 700,
          padding: const EdgeInsets.all(10.0),
          child: new Card(
            color: Colors.blue[50],
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  new Text(
                    widget.list[widget.index]['nome'],
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Divider(),
                  new Text(
                    "${widget.list[widget.index]['endereco']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  new Text(
                    "${widget.list[widget.index]['email']}",
                    style: new TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text(
                          "Editar",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        color: Colors.blue[900],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Edit(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                      VerticalDivider(),
                      new RaisedButton(
                        child: new Text(
                          "Excluir",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        color: Colors.red[900],
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => Confirmar(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
