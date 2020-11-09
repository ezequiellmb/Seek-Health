import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seekhealth/pages/ListaUsuario.dart';


class Edit extends StatefulWidget {
  final List list;
  final int index;
  Edit({this.list, this.index});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
   var _formkey = GlobalKey<FormState>();
  TextEditingController controllerNome;
  TextEditingController controllerCPF;
  TextEditingController controllerCelular;
  TextEditingController controllerSenha;
  TextEditingController controllerEmail;
  TextEditingController controllerEndereco;
  TextEditingController controllerDtNasc;

  void edit(){
    http.post("http://192.168.2.7/seekhealth/edit.php", body:{
      "idUsuario": widget.list[widget.index]['idUsuario'],
      "nome": controllerNome.text,
      "CPF": controllerCPF.text,
      "dt_nasc": controllerDtNasc.text,
      "celular": controllerCelular.text,
      "senha": controllerSenha.text,
      "email": controllerEmail.text,
      "endereco": controllerEndereco.text,
    });
  }
  

  @override
  void initState(){
    controllerNome=new TextEditingController(text: widget.list[widget.index]['nome']);
    controllerCPF= new TextEditingController (text: widget.list[widget.index]['CPF']);
    controllerSenha=new TextEditingController(text: widget.list[widget.index]['senha']);
    controllerCelular=new TextEditingController(text: widget.list[widget.index]['celular']);
    controllerEmail=new TextEditingController(text: widget.list[widget.index]['email']);
    controllerEndereco=new TextEditingController(text: widget.list[widget.index]['endereco']);
    controllerDtNasc=new TextEditingController(text: widget.list[widget.index]['dt_nasc']);
    super.initState();
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
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Editar",
        style: TextStyle(
        color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        ),
        body: Form(
          key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title: new TextFormField(
                      controller: controllerNome,
                      validator: (value) {
                        if (value.isEmpty) return 'Insira seu nome';
                        return null;
                      },
                      decoration: new InputDecoration(
                        hintText: "Nome",
                      ),
                    ),
                  ),
                   new ListTile(
                    leading: const Icon(
                      Icons.person_search,
                      color: Colors.black,
                    ),trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title: new TextFormField(
                      controller: controllerCPF,
                      inputFormatters: [mascaraCPF],
                      validator: (value) {
                        if (value.isEmpty) return 'Insira seu CPF';
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
                    trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title: TextFormField(
                      controller: controllerDtNasc,
                      inputFormatters: [mascaraData],
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insere sua data de nascimento";
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
                    trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title: TextFormField(
                      controller: controllerEndereco,
                      validator: (value) {
                        if (value.isEmpty) return "Insira seu endereço";
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
                      controller: controllerCelular,
                      inputFormatters: [mascaraTelefone],
                      validator: (value) {
                        if (value.isEmpty)
                          return "Insira seu telefone para contato";
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
                    trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title: TextFormField(
                      controller: controllerEmail,
                      validator: (value) {
                        if (value.isEmpty) return "Insira um Email";
                         return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                  ),
                 ListTile(
                    leading: const Icon(
                      Icons.vpn_key,
                      color: Colors.black,
                    ),
                    trailing: Icon(Icons.star, size: 12, color: Colors.red[900]),
                    title:  TextFormField(
                      controller: controllerSenha,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) return "Insira uma senha";
                         return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Senha",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 16, 70, 2),
                    child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue[900],
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: (){
                         if (_formkey.currentState.validate()) {
                            edit();
                        Navigator.of(context).pushNamedAndRemoveUntil('/lista', ModalRoute.withName('/adm'));
                      }
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
              ],
            )
          ],
        )
      )
    );
  }
}