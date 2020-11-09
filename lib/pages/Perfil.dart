import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {


  void SairUser() {
        AlertDialog alertDialog = new AlertDialog(
          backgroundColor: Colors.white,
          content: new Text(
            "   Deseja realmente sair do aplicativo?",
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          actions: <Widget>[
            new RaisedButton(
                child: new Text(
                  "Sim",
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                color: Colors.green[500],
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: ()  => Navigator.of(context).pushNamedAndRemoveUntil ('/login',(Route <dynamic> route) => false),
                ),
            new RaisedButton(
              child: new Text(
                "Cancelar",
                style: new TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              color: Colors.red[500],
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
                  onTap: () => SairUser(),
            ),
          ],
        ),
     ),
     body: Form(
        child: Container( 
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/blueee.png"),
            fit: BoxFit.cover,
              ),
            ),

           padding: EdgeInsets.all(16),
          child:  Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                   new Container(
                    padding: EdgeInsets.only(top:15.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.white, 
                      child: new Image(
                        width: 200.0,
                        height: 200.0,
                        image: new AssetImage('assets/dcc.png'),
                      ),
                    ),
                    width: 200.0,//Tamanho da imagem 
                    height: 200.0,
                  ),
                  /*new Container(
                    padding: EdgeInsets.only(top:15.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                     /* child: new Image(
                        width: 300.0,
                        height: 300.0,
                        image: new AssetImage(''),
                      ),*/
                  ),
                  width: 200.0,//Tamanho da imagem 
                  height: 200.0,
                  ),*/
                  new Container(
                    height: 70,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                    "Nome: Ezequiel Mioranza Bomfim",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: Colors.black),
                  new Container(
                    height: 35,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                    "Data de nascimento: 25/01/2002",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: Colors.black),
                  new Container(
                    height: 35, 
                    alignment: Alignment.bottomLeft,
                    child: Text("Email: ezequielmioranza@gmailcom",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: Colors.black),
                   new Container(
                    height: 35, 
                    alignment: Alignment.bottomLeft,
                    child: Text("Telefone: +55 41 99999-9999",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: Colors.black),
                   new Container(
                    height: 35, 
                    alignment: Alignment.bottomLeft,
                    child: Text("Endereço: Rua das Rosas, 151",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(color: Colors.black),
                  Padding(
                     padding: EdgeInsets.fromLTRB(85, 16, 85, 2),//Distancia borda 
                      child: RaisedButton(
                      child: Text(
                        "Editar Dados",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(45, 16, 45, 16),//Distancia da escrita
                      onPressed: (){
                        
                      },
                      // Borda do botão circular
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),

                ]
            ),
          ),
    )
    ),
     ),
  );

  }
}