import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/Un_saude/Lista.dart';


class Edita extends StatefulWidget {
  final List list;
  final int index;
  Edita({this.list, this.index});
  @override
  _EditaState createState() => _EditaState();
}

class _EditaState extends State<Edita> {
  TextEditingController controllerNome1;
  TextEditingController controllerEndereco1;
  TextEditingController controllerEspecialidade;

  void usedit(){
    http.post("http://192.168.2.7/seekhealth/us_edit.php", body:{
      "us_id": widget.list[widget.index]['us_id'],
      "us_nome": controllerNome1.text,
      "us_endereco": controllerEndereco1.text,
      "us_especialidade": controllerEspecialidade.text,
    });
  }

  @override
  void initState(){
    controllerNome1=new TextEditingController(text: widget.list[widget.index]['us_nome']);
    controllerEndereco1=new TextEditingController(text: widget.list[widget.index]['us_endereco']);
    controllerEspecialidade=new TextEditingController(text: widget.list[widget.index]['us_especialidade']);
    super.initState();
  }
  
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
          child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/blueee.png"),
            fit: BoxFit.cover,
              ),
            ),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerNome1,
                    validator: (value){
                      if(value.isEmpty)return "Insira um usuario";
                    },
                    decoration: new InputDecoration(
                      hintText: "Usuario", labelText: "Usuario",
                    ),
                  ),
                ),
                  new ListTile(
                  leading: const Icon(Icons.home, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEndereco1,
                    validator: (value){
                      if(value.isEmpty) return "Confirme seu Endereço";
                    },
                    decoration: new InputDecoration(
                      hintText: "Endereço", labelText: "Endereço",
                    ),
                  ),
                  ),
                  new ListTile(
                  leading: const Icon(Icons.person_add, color: Colors.black,),
                  title: new TextFormField(
                    controller: controllerEspecialidade,
                    validator: (value){
                      if(value.isEmpty) return "Confirme as Especialidades";
                    },
                    decoration: new InputDecoration(
                      hintText: "Especialidade", labelText: "Especialidade",
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
                            usedit();
                            Navigator.of(context).pushNamedAndRemoveUntil('/listaUs', ModalRoute.withName('/adm'));
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                    ),
                  ),
              ],
            )
          ],
        )
      )
      )
    );
  }
}