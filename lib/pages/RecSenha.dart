import 'package:flutter/material.dart';
import 'package:seekhealth/pages/RecSenha.dart';

class RecSenha extends StatefulWidget {
  @override
  _RecSenhaState createState() => _RecSenhaState();
}

class _RecSenhaState extends State<RecSenha> {
  TextEditingController _controllerRSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ESQUECI MINHA SENHA"), backgroundColor: Colors.blue),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blueee.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Text(
                    "Para recuperar a sua senha, informe o seu email de cadastro no formulário e clique em Enviar.\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                TextField(
                  controller: _controllerRSenha,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                  child: RaisedButton(
                      child: Text(
                        "Enviar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: (){
                        Navigator.pushNamed(context, "/login");
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
  }
}
