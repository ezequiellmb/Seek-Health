

import 'package:flutter/material.dart';


  


class Adm extends StatefulWidget {
  @override
  _AdmState createState() => _AdmState();
}


class _AdmState extends State<Adm> {
  TextEditingController _controllerRSenha = TextEditingController();
  
  void Sair() {
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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        // title: Text("ADMINISTRADOR"),
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

      body: Container(
        color: Colors.blue[200],
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image: AssetImage("assets/blueee.png"),
        // fit: BoxFit.cover,
        // ),
        // ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
                  child: RaisedButton(
                      child: Text(
                        "Lista de Usuários",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/lista');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: RaisedButton(
                      child: Text(
                        "Lista de Unidades",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/listaUs');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
              ],
            ),
          ),
        ),
      ),
    );

      // body: Container(
      //     decoration: BoxDecoration(
      //     image: DecorationImage(
      //     image: AssetImage("assets/blueee.png"),
      //     fit: BoxFit.cover,
      //     ),
      //     ),
      //   padding: EdgeInsets.all(16),
      //   child:  Center(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: <Widget>[
      //           Container(
      //             child: Text(
      //             "Para recuperar a sua senha, informe o seu email de cadastro no formulário e clique em Enviar.\n",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(color: Colors.black, fontSize: 17),
      //             ),
      //           ),
      //           TextField(
      //             controller: _controllerRSenha,
      //             autofocus: true,
      //             keyboardType: TextInputType.text,
      //             style: TextStyle(fontSize:20),
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
      //               hintText: "Email",
      //               filled: true,
      //               fillColor: Colors.white,
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(10)
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
      //             child: RaisedButton(
      //               child: Text(
      //                 "Enviar",
      //                 style: TextStyle(color: Colors.white, fontSize: 20),
      //               ),
      //               color: Colors.pink,
      //               padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
      //               onPressed: (){

      //               },
      //               shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      //             ),
      //             ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    
  }
}
