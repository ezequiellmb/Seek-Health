import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() => runApp(AddUser());

class AddUser extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: MyCustomForm(),       
      ),  
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  TextEditingController controllerNome = new TextEditingController();
  TextEditingController controllerCpf = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();
  TextEditingController controllerConfirmeSenha = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerEndereco = new TextEditingController();
  TextEditingController controllerCelular = new TextEditingController();
  TextEditingController controllerDtNasc = new TextEditingController();

  
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
  final _formKey = GlobalKey<FormState>();

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
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validaemail(String value){
    String patternemail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(patternemail);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
      ),
    body: Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new TextFormField(
          decoration: new InputDecoration(
             icon: new Icon(Icons.person),
              hintText: "Nome",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
              
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue),
    ),
          ),
          controller: controllerNome,
          validator: _validaNome,
        ),
        SizedBox(
            height: 10.0,
        ),
       TextFormField(
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
             icon: new Icon(Icons.person_add_alt_1),
            hintText: "CPF",
            enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: const BorderSide(
       color: Colors.grey,
      ),
          )
          ),
        ),SizedBox(
            height: 10.0,
        ),
        TextFormField(
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
            decoration: new InputDecoration(   
              icon: new Icon(Icons.date_range),
              hintText: "Data de nascimento",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
          ),
          ),
        ),
        SizedBox(
            height: 10.0,
        ),
        TextFormField(
          controller: controllerEndereco,
          validator: (value) {
            if (value.isEmpty) {
              return 'Insira seu endereço';
            }
            return null;
          },
          decoration: new InputDecoration(
             icon: new Icon(Icons.home),
              hintText: "Endereço",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
          ),
          )
        ),SizedBox(
            height: 10.0,
        ),
       
        TextFormField(
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
          decoration: new InputDecoration(
             icon: new Icon(Icons.phone),
              hintText: "Contato",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
          ),
          )
        ),SizedBox(
            height: 10.0,
        ),
        TextFormField(
 
          controller: controllerEmail,
          validator: _validaemail,
          decoration: new InputDecoration(
             icon: new Icon(Icons.mail),
              hintText: "Email",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
          ),
          )
        ),SizedBox(
            height: 10.0,
        ),
        TextFormField(
          controller: controllerSenha,
          obscureText: true,
          validator: (value) {
            if (value.length >=8 && !value.contains(RegExp(r'\W')) && value.contains(RegExp(r'\d+\w*\d+'))) {
              return null;
            }
            return 'Crie uma senha válida';
          },
          decoration: new InputDecoration(
             icon: new Icon(Icons.vpn_key),
              hintText: "Senha",
              enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: const BorderSide(
              color: Colors.grey,
              ),
          ),
          )
        ),
        Padding(
                    padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                    child: RaisedButton(
                        child: Text(
                          "Salvar",
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
                            borderRadius: new BorderRadius.circular(30.0))),
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
      ),
    ),
    );
  }
}