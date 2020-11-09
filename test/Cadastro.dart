import 'package:flutter/material.dart';
import 'package:seekhealth/model/Usuario.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Cadastro extends StatefulWidget {
  
  @override
  _CadastroState createState() => _CadastroState();
}


class _CadastroState extends State<Cadastro> {
  
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool _tipoUsuario = false;
  String _msgErro = "";

  _validaCampo(){
    var __controllerNome;
        String nome = __controllerNome.text;
    var __controllerEmail;
        String email = __controllerEmail.text;
    var __controllerSenha;
        String senha = __controllerSenha.text;

    if(nome.isNotEmpty){
      if(email.isNotEmpty && email.contains("@")){
        if(senha.isNotEmpty && senha.length > 6){
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          usuario.tipoUsuario = usuario.vrTipoUser(_tipoUsuario);



        }else{
          setState(() {
        _msgErro = "Preencha a senha! Digite mais de 6 caracteres";
      });
        }

      }else{
      setState(() {
        _msgErro = "Preencha um email válido";
      });

    }
    }else{
      setState(() {
        _msgErro = "Preencha o nome";
      });

    }

  }
  //  _cadastraUser( Usuario usuario ){
  //    FirebaseAuth auth = FirebaseAuth.instance;
  //    Firestore db = Firestore.instance;

  //   auth.createUserWithEmailAndPassword(
  //     email: usuario.email,
  //     password: usuario.senha
  //     ).then((firebaseUser){

  //       db.collection "usuarios")
  //       .document( firebaseUser.user.uid )
  //       .setData(  )

  // });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("CADASTRO"),
        backgroundColor: Colors.red),
        body: Container(
          padding: EdgeInsets.all(16),
          child:  Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  Divider(),
                  TextField(
                    controller: _controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  Divider(),
                  TextField(
                    controller: _controllerSenha,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                      Text("Usuário"),
                      Switch(
                        value: _tipoUsuario,
                        onChanged: (bool valor){
                          setState((){
                            _tipoUsuario = valor;
                          });
                        },
                      ),
                      Text("Administrador"),

                    ],)
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 10),
                    child: RaisedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: (){
                        _validaCampo();
                      }
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          _msgErro,
                          style: TextStyle(color: Colors.redAccent, fontSize: 20),
                        ),
                        ),
                        )
                ],  
              )
            ) )
        ),
      );
  }
}