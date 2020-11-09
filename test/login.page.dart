// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;


 

// class Login extends StatefulWidget {
//     @override 
//     _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login>{

//   TextEditingController nome = new TextEditingController();
//   TextEditingController senha = new TextEditingController();

//   String mensagem = '';
//   String nomes;

//   Future<List> _login() async{
    
//     final response = await http.post("http://192.168.0.16/seekhealth/login.php", body: {
//     "nome": nome.text,
//     "senha": senha.text,
//     });
  
//   var datauser = json.decode(response.body);

//   if(datauser.length == 0){
//       setState(() {
//         mensagem = 'usuario ou senha incorretos';
//       });
//   } else{
//       if(datauser[0]['tipo'] == 'admin'){
//       Navigator.pushReplacementNamed(context, '/add');
//       } else if(datauser[0]['tipo'] == 'user'){
//       Navigator.pushReplacementNamed(context, '/rsenha');
//       } 
      

//     setState(() {
//           nomes= datauser[0]['nome'];
//         });

//   }

//   return datauser;
// }  
//     @override
//     Widget build(BuildContext context) {
//       return new Scaffold(
        
//           body: new Container(
//             decoration: BoxDecoration(
//             image: DecorationImage(
//             image: AssetImage("assets/blueee.png"),
//             fit: BoxFit.cover,
//               ),
//             ),
            
            
//           padding: EdgeInsets.all(16),
//           child:  Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   new Container(
//                     padding: EdgeInsets.only(top:45.0),
//                     child: new CircleAvatar(
//                       backgroundColor: Colors.black,
//                       child: new Image(
//                         width: 135.0,
//                         height: 135.0,
//                         image: new AssetImage('assets/logo.png'),
//                       ),
//                     ),
//                     width: 177.0,//Tamanho da imagem 
//                     height: 177.0,
//                   ),
//                   Divider(),
//                   TextField(
//                     controller: nome,
//                     autofocus: true,
//                     keyboardType: TextInputType.emailAddress,
//                     style: TextStyle(fontSize:20),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
//                       hintText: "Nome",
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                       )
//                     ),
//                   ),
//                   Divider(),
//                   TextField(
//                     controller: senha,
//                     obscureText: true,
//                     keyboardType: TextInputType.emailAddress,
//                     style: TextStyle(fontSize:20),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
//                       hintText: "Senha",
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                       )
//                     ),
//                   ),
//                   Divider(),
//                   Container(
//                     height: 15,
//                     alignment: Alignment.centerRight,
//                     child: FlatButton(
//                     child: Text(
//                     "Esqueci a senha",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                     ),
//                   onPressed: (){
//                         Navigator.pushNamed(context, "/rsenha");
//                       },
//                      ),
//                   ),
//                   Padding(
//                      padding: EdgeInsets.fromLTRB(70, 16, 70, 2),//Distancia borda 
//                       child: RaisedButton(
//                       child: Text(
//                         "ENTRAR",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       color: Colors.blue,
//                       padding: EdgeInsets.fromLTRB(70, 16, 70, 16),//Distancia da escrita
//                       onPressed: (){
//                         _login();
                        
//                       },
//                       // Borda do botão circular
//                         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//                     ),

//                   ),

//                       Padding(
//                       padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
//                       child: RaisedButton(
//                       child: Text(
//                         "EMERGÊNCIA",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       color: Colors.red,
//                       padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
//                       onPressed: (){
//                         Navigator.pushNamed(context, "/mapa");
//                       },
//                       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
//                     ),
//                     ),
//                     Divider(),
//                     Container(
//                     height: 20,
//                     alignment: Alignment.center,
//                     child: FlatButton(
//                     child: Text(
//                     "Não tem conta? Cadastre-se!",
//                     style: TextStyle(color: Colors.black, fontSize: 15),
//                     textAlign: TextAlign.center,
//                     ),
//                   onPressed: (){
//                         Navigator.pushNamed(context, "/add");
//                       },
//                      ),
//                   ),
//                   Text(mensagem,style: TextStyle(fontSize: 20.0,color: Colors.red),)
//                 ],  
//               ),
//             ),
//           ),
//         ),
        
//       );
      
//     }
//   }
