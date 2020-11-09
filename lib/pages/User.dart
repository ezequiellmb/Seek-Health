import 'dart:convert';

import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:seekhealth/pages/Detail.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}
class Company {
  int id;
  String name;

  Company(this.id, this.name);
 
  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Público'),
      Company(2, 'Privado'),
    ];
  }
}
class Tipo {
  int id;
  String name;

  Tipo(this.id, this.name);
 
  static List<Tipo> getTipo() {
    return <Tipo>[
      Tipo(1, 'Hospital'),
      Tipo(2, 'UPA'),
      Tipo(2, 'Clinica'),

    ];
  }
}

class Especialidade {
  int id;
  String name;

  Especialidade(this.id, this.name,);
 
  static List<Especialidade> getEsp() {
    return <Especialidade>[
      Especialidade(1, 'Todos', ),
      Especialidade(2, 'Cirurgia Geral'),
      Especialidade(3, 'Pediatria'),
      Especialidade(4, 'Ginecologia e Obstetrícia'),
      Especialidade(5, 'Anestesiologia'),
      Especialidade(6, 'Ortopedia e Traumatologia'),
      Especialidade(7, 'Oftalmologia'),
      Especialidade(8, 'Cardiologia'),
      Especialidade(9, 'Radiologia e Diagnóstico por Imagem'),
      Especialidade(10, 'Psiquiatria'),
      Especialidade(11, 'Odontologia'),
      Especialidade(12, 'Otorrinolaringologia'),
      Especialidade(13, 'Infectologia'),
      Especialidade(14, 'Cirurgia Vascular'),
      Especialidade(15, 'Urologia'),
      Especialidade(16, 'Cancerologia'),
      Especialidade(17, 'Nefrologia'),
    ];
  }
}

TextEditingController controllerRelatorio = new TextEditingController();
TextEditingController controllerIdUser = new TextEditingController();
void relatorio() {
    var url = "http://192.168.2.7/seekhealth/RelatAdd.php";

    http.post(url, body: {
      "especialidade_relat": controllerRelatorio.text,
      "id_usuario": controllerIdUser.text,
    });
  }


class _UserState extends State<User> {
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  List<Tipo> _tipo = Tipo.getTipo();
  List<DropdownMenuItem<Tipo>> _dropdownMenuItemst;
  Tipo _selectedTipo;

  List<Especialidade> _especialidade = Especialidade.getEsp();
  List<DropdownMenuItem<Especialidade>> _dropdownMenuItemsesp;
  Especialidade _selectedEsp;
 
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;

    _dropdownMenuItemst = buildDropdownMenuItemst(_tipo);
    _selectedTipo = _dropdownMenuItemst[0].value;

    _dropdownMenuItemsesp = buildDropdownMenuItemsesp(_especialidade);
    _selectedEsp = _dropdownMenuItemsesp[0].value;
    super.initState();
  }
 
  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
 
  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }
 
  List<DropdownMenuItem<Tipo>> buildDropdownMenuItemst(List tipo) {
    List<DropdownMenuItem<Tipo>> itemst = List();
    for (Tipo tipo in tipo) {
      itemst.add(
        DropdownMenuItem(
          value: tipo,
          child: Text(tipo.name),
        ),
      );
    }
    return itemst;
  }
 
  onChangeDropdownItemt(Tipo selectedTipo) {
    setState(() {
      _selectedTipo = selectedTipo;
    });
  }
  List<DropdownMenuItem<Especialidade>> buildDropdownMenuItemsesp(List esp) {
    List<DropdownMenuItem<Especialidade>> itemsesp = List();
    for (Especialidade esp in esp) {
      itemsesp.add(
        DropdownMenuItem(
          value: esp,
          child: Text(esp.name),
        ),
      );
    }
    return itemsesp;
  }

  onChangeDropdownItemesp(Especialidade selectedEsp) {
    setState(() {
      _selectedEsp = selectedEsp;
    });
  }

  TextEditingController controllerEspecialidade = new TextEditingController();
  TextEditingController controllerTipo = new TextEditingController();
  TextEditingController controllerPP = new TextEditingController();

  Future<List> getUser() async {
    final response = await http.get("http://192.168.2.7/seekhealth/getdata.php");
    return json.decode(response.body);
  }

  List<Icon> icons =[
  Icon(Icons.arrow_drop_down_sharp),
];
  bool isPesquisa = false;

//Aler dialog Sair da Aplicação
  void SairUser() {
        AlertDialog alertDialog = new AlertDialog(
          backgroundColor: Colors.white,
          content: new Text(
            "   Deseja realmente sair do aplicativo?",
            style: new TextStyle(color: Colors.blue[900], fontSize: 16.0),
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
  @override //Widget Barra lateral
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: !isPesquisa
       ? Text("Especialidades")
       : TextField(
         style: TextStyle(color: Colors.white),
         decoration: InputDecoration(
           hintText: "Buscar especialidade",
           hintStyle: TextStyle(color: Colors.white),
         ),
       ),
       backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          
          IconButton(
            icon: Icon(Icons.search),

            onPressed: (){
              showSearch(context: context, delegate: Procura());
            },
          ),
        ],
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
                crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton(
                  style: TextStyle(color: Colors.black, fontSize: 20, backgroundColor: Colors.transparent),
                  value: _selectedEsp,
                  items: _dropdownMenuItemsesp,
                  onChanged: onChangeDropdownItemesp,
                  icon: icons[0],
                ),
                 /* TextField(
                    controller: controllerEspecialidade,  
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize:20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Especialidade",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                  ),*/
                  DropdownButton(
                  style: TextStyle(color: Colors.black, fontSize: 30, backgroundColor: Colors.transparent),
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                  icon: icons[0],
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  style: TextStyle(color: Colors.black, fontSize: 30, backgroundColor: Colors.transparent),
                  value: _selectedTipo,
                  items: _dropdownMenuItemst,
                  onChanged: onChangeDropdownItemt,
                  icon: icons[0],
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text('Selected: ${_selectedCompany.name}'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 70, 70, 2),//Distancia borda 
                      child: RaisedButton(
                        child: Text(
                          "Pesquisar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(70, 16, 70, 16),//Distancia da escrita
                        onPressed: (){
                          relatorio();
                          Navigator.pushNamed(context, "/mapa");
                        },
                        // Borda do botão circular
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
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

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      // body: new FutureBuilder<List>(
      //   future: getUser(),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasError) print(snapshot.error);
      //             return snapshot.hasData
      //                 ? new Listar(
      //                     list: snapshot.data,
      //                   )
      //                 : new Center(
      //                     child: new CircularProgressIndicator(),
      //                   );
      //           },
              // ),
      
    );
}
        
        getUser() {
}


class Listar extends StatelessWidget {
  final List list;
  Listar({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(8.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          list: list,
                          index: i,
                        )),
              ),
              child: new Card(
                color: Colors.blue[50],
                child: new ListTile(
                  title: new Text(
                    list[i]['nome'],
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                  leading:
                      new Icon(Icons.person, size: 55.0, color: Colors.black),
                  subtitle: new Text(
                    "${list[i]['email']}",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
  }

  class Procura extends SearchDelegate<String>{
  
  final filtros = [
    "Radiologia",
    "Estetica",
    "Cardiologia",
  ];

  final filtrosRecentes = [
    "Cardiologia",
  ];
  
  
  @override
  List<Widget> buildActions(BuildContext context) {
      return[IconButton(icon: Icon(Icons.clear),
       onPressed: () {
         query = "";
       },
       ),

       ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
          ), 
          onPressed: () {
            close(context, null);
          } 
          );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.grey,
          child: Center( 
            child: Text(query),
            ),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      final sugestaoLista = query.isEmpty
      ?filtrosRecentes
      :filtros.where((p) => p.startsWith(query)).toList();

      return ListView.builder(itemBuilder: (context,index)=>ListTile(
        onTap: () {
          showResults(context);
        },

        leading: Icon(Icons.location_city),
        title: RichText(text: TextSpan(
          text: sugestaoLista[index].substring(0,query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: sugestaoLista[index].substring(query.length),
            style: TextStyle(color: Colors.blue),
          ),
          ],
        ),
        ),  
      ),
      itemCount: sugestaoLista.length,
      );
  
  }
  
}

    
    //    body: Container(
    //     decoration: BoxDecoration(
    //     image: DecorationImage(
    //     image: AssetImage("assets/blueee.png"),
    //     fit: BoxFit.cover,
    //     ),
    //     ),
    //     padding: EdgeInsets.all(16),
    //     child: Center(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
    //               child: RaisedButton(
    //                   child: Text(
    //                     "Público",
    //                     style: TextStyle(color: Colors.black, fontSize: 20),
    //                   ),
    //                   color: Colors.white,
    //                   padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, '');
    //                   },
    //                   shape: new RoundedRectangleBorder(
    //                       borderRadius: new BorderRadius.circular(30.0))),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
    //               child: RaisedButton(
    //                   child: Text(
    //                     "Privado",
    //                     style: TextStyle(color: Colors.black, fontSize: 20),
    //                   ),
    //                   color: Colors.white,
    //                   padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
    //                   onPressed: () {
    //                     Navigator.pushNamed(context, '');
    //                   },
    //                   shape: new RoundedRectangleBorder(
    //                       borderRadius: new BorderRadius.circular(30.0))),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
