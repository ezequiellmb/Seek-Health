import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Adm.dart';
import 'package:seekhealth/pages/Detail.dart';
import 'package:seekhealth/pages/GeraRel.dart';
import 'package:seekhealth/pages/ListRelatEsp.dart';
import 'package:seekhealth/pages/ListRelatUs.dart';
import 'package:seekhealth/pages/ListaUsuario.dart';
import 'package:seekhealth/pages/Perfil.dart';
import 'package:seekhealth/pages/Relatorio.dart';
import 'package:seekhealth/pages/Un_saude/Delete.dart';
import 'package:seekhealth/pages/Un_saude/Lista.dart';
import 'package:seekhealth/pages/Mapa.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/RecSenha.dart';
import 'package:seekhealth/pages/User.dart';
import 'package:seekhealth/pages/registro.dart';
import 'package:seekhealth/pages/AddUser.dart';





void main() => runApp(MyApp());

String nome='';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      title: 'Seek Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: new Login(),
      routes: <String,WidgetBuilder>{
        '/mapa': (BuildContext context)=> new Mapa(),
        '/login': (BuildContext context)=> new Login(),
        '/add': (BuildContext context)=> new Add(),
        '/lista': (BuildContext context)=> new ListaUser(),
        '/rsenha': (BuildContext context)=> new RecSenha(),
        '/adm': (BuildContext context)=> new Adm(),
        '/listaUs': (BuildContext context)=> new Lista(),
        '/delete': (BuildContext context)=> new Delete(),
        '/detail': (BuildContext context)=> new Detail(),
        '/user': (BuildContext context)=> new User(),
        '/perfil': (BuildContext context)=> new Perfil(),
        '/Relat': (BuildContext context)=> new Relatorio(),
        '/GeraRelat': (BuildContext context)=> new GeraRel(),
        '/AddUser': (BuildContext context)=> new AddUser(),
        '/relatorioUs': (BuildContext context)=> new ListRelatUs(),
        '/relatorioEsp': (BuildContext context)=> new ListRelatEsp(),
      }
  );
  }
}


class Login extends StatefulWidget {
    @override 
    _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();

  String mensagem = '';

  Future<List> _login() async{
    
    final response = await http.post("http://192.168.2.7/seekhealth/login.php", body: {
    "email": controllerEmail.text,
    "senha": controllerSenha.text,
    });
  
  
  var datauser = json.decode(response.body);

  if(datauser.length == 0){
      setState(() {
        mensagem = 'usuario ou senha incorreto';
      });
  } else{
      if(datauser[0]['tipo']=='admin'){
      Navigator.pushReplacementNamed(context, '/adm');
      } else if(datauser[0]['tipo']=='user'){
      Navigator.pushReplacementNamed(context, '/user');
      } else {
        Navigator.pushNamed(context, '/login');
      }
      

    setState(() {
          nome= datauser[0]['nome'];
        });

  }

  return datauser;
} 

bool _showPassword = false;
  
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        
          body: new Container(
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
                        width: 300.0,
                        height: 300.0,
                        image: new AssetImage('assets/log1.png'),
                      ),
                    ),
                    width: 200.0,//Tamanho da imagem 
                    height: 200.0,
                  ),
                  Text(mensagem,style: TextStyle(fontSize: 20.0,color: Colors.red),
                  textAlign: TextAlign.center,),
                  Divider(),
                  TextField(
                    controller: controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),
                  Divider(),
                  TextField(
                    controller: controllerSenha,
                    obscureText: !_showPassword,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 15,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                    child: Text(
                    "Esqueci a senha",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                        // Navigator.pushNamed(context, "/rsenha");
                        onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context)=> new RecSenha(),
                          ));
                      },
                     ),
                  ),
                  Padding(
                     padding: EdgeInsets.fromLTRB(70, 16, 70, 2),//Distancia borda 
                      child: RaisedButton(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),//Distancia da escrita       
                      onPressed: (){
                        _login();
                      },
                      // Borda do botão circular
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
                      Padding(
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                      child: RaisedButton(
                      child: Text(
                        "EMERGÊNCIA",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
                      onPressed: (){
                       Navigator.pushNamed(context, "/mapa");
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                    ),
                    Divider(),
                    Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: FlatButton(
                    child: Text(
                    "Não tem conta? Cadastre-se!",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    textAlign: TextAlign.center,
                    ),
                  onPressed: (){
                        Navigator.pushNamed(context, "/add");
                      },
                     ),
                  ),
                ],  
              ),
            ),
          ),
        ),
        
      );
      
    }
  }








