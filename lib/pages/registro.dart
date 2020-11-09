import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// final _UsNumberTextInputFormatter _birthDate =
//     new _UsNumberTextInputFormatter();

// class _UsNumberTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final int newTextLength = newValue.text.length;
//     int selectionIndex = newValue.selection.end;
//     int usedSubstringIndex = 0;
//     final StringBuffer newText = new StringBuffer();
//     if (newTextLength >= 3) {
//       newText.write(newValue.text.substring(4, usedSubstringIndex = 8) + '/');
//       if (newValue.selection.end >= 8) selectionIndex++;
//     }
//     if (newTextLength >= 5) {
//       newText.write(newValue.text.substring(2, usedSubstringIndex = 4) + '/');
//       if (newValue.selection.end >= 4) selectionIndex++;
//     }
//     if (newTextLength >= 9) {
//       newText.write(newValue.text.substring(0, usedSubstringIndex = 2));
//       if (newValue.selection.end >= 2) selectionIndex++;
//     }
// // Dump the rest.
//     if (newTextLength >= usedSubstringIndex)
//       newText.write(newValue.text.substring(usedSubstringIndex));
//     return new TextEditingValue(
//       text: newText.toString(),
//       selection: new TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController controllerNome = new TextEditingController();
  TextEditingController controllerCpf = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();
  TextEditingController controllerConfirmeSenha = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerEndereco = new TextEditingController();
  TextEditingController controllerCelular = new TextEditingController();
  TextEditingController controllerDtNasc = new TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  void add() {
    var url = "http://192.168.2.7/seekhealth/add.php";

    http.post(url, body: {
      "nome": controllerNome.text,
      "CPF": controllerCpf.text,
      "dt_nasc": controllerDtNasc.text,
      "endereco": controllerEndereco.text,
      "celular": controllerCelular.text,
      "email": controllerEmail.text,
      "senha": controllerSenha.text,
      "csenha": controllerConfirmeSenha.text,
    });
  }



  


var mascaraTelefone = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')}
  );
   var mascaraCPF = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')}
  );
  var mascaraData = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {'#': RegExp(r'[0-9]')}
  );

  String _validaNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o seu nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validaemail(String value){
    String patternemail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(patternemail);
    if (value.length == 0) {
      return "Informe seu Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
              child: ListView(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: new TextFormField(
                        controller: controllerNome,
                        validator: _validaNome,
                      decoration: new InputDecoration(
                        hintText: "Nome",
                      ),
                    ),
                  ),
                   new ListTile(
                    leading: const Icon(
                      Icons.person_search,
                      color: Colors.black,
                    ),
                     title: new TextFormField(
                      controller: controllerCpf,
                      inputFormatters: [mascaraCPF],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira seu CPF';
                        }else if(value.length < 14){
                          return "insira um CPF válido";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: new InputDecoration(
                        hintText: "CPF",
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    title: TextFormField(
                      controller: controllerDtNasc,
                        inputFormatters: [mascaraData],
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira sua data de nascimento';
                          }else if(value.length < 10){
                            return "insira uma data válida";
                          }
                          return null;
                        },
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: "Data de Nascimento",
                      ),
                    ),
                  ),
                   ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: TextFormField(
                      controller: controllerEndereco,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira seu endereço';
                          }
                          return null;
                        },
                      decoration: InputDecoration(
                        hintText: "Endereço",
                      ),
                    ),
                  ),
                 ListTile(
                    leading: const Icon(
                      Icons.add_call,
                      color: Colors.black,
                    ),
                    title: TextFormField(
                      inputFormatters: [mascaraTelefone],
                        controller: controllerCelular,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Insira seu celular';
                          }
                          if(value.length < 15 ){
                            return 'Insira um telefone válido';
                          }
                          return null;
                        },
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: "Celular",
                      ),
                    ),
                  ),
                   ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: TextFormField(
                     controller: controllerEmail,
                        validator: _validaemail,
                        decoration: new InputDecoration(                            
                          hintText: "Email",
                        ),
                      ),
                    ),
                 ListTile(
                    leading: const Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    title:  TextFormField(
                      controller: controllerSenha,
                        obscureText: true,
                        validator: (value) {
                          if (value.length >=8 && !value.contains(RegExp(r'\W')) && value.contains(RegExp(r'\d+\w*\d+'))) {
                            return null;
                          }
                          return 'Crie uma senha válida';
                        },
  
                      decoration: InputDecoration(
                        hintText: "Senha",
                      ),
                    ),
                  ),
                  // ListTile(
                  //   leading: const Icon(
                  //     Icons.vpn_key,
                  //     color: Colors.black,
                  //   ),
                  //   trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                  //   title:  TextFormField(
                  //     controller: controllerConfirmeSenha,
                  //       obscureText: true,
                  //       validator: (value) {
                  //         if (value != controllerSenha){
                  //           return "senhas não conferem";
                  //         }
                  //       },
  
                  //     decoration: InputDecoration(
                  //       hintText: "Confirmação de enha",
                  //     ),
                  //   ),
                  // ),
                  Divider(
                  height: 30.0,
                  ),
                  
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                    child: RaisedButton(
                        child: Text(
                          "SALVAR",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        color: Colors.blue[900],
                        padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
                        onPressed: () {   
                            if (_formKey.currentState.validate()) {
                              add();
                              Navigator.of(context).pushNamedAndRemoveUntil('/login', ModalRoute.withName('/AddUser'));
                            }
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                        ),

                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                    child: RaisedButton(
                        child: Text(
                          "SAIR",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        color: Colors.red[900],
                        padding: EdgeInsets.fromLTRB(50, 16, 50, 16),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil('/login', ModalRoute.withName('/add'));
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                ],
              )),    
    );
  }
}
