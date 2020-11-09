import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:seekhealth/pages/Detail.dart';


import 'package:flutter/material.dart';


  


class Relatorio extends StatefulWidget {
  @override
  _RelatorioState createState() => _RelatorioState();
}




class _RelatorioState extends State<Relatorio> {
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
                Container(
                  child: Text(
                    "Selecione uma das opções abaixo, o sistema tem como base as informaçoes mais procuradas por todos os nossos usuarios.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 2),
                  child: RaisedButton(
                      child: Text(
                        "Unidades mais procuradas",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/relatorioUs');
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: RaisedButton(
                      child: Text(
                        "Especialidades mais procuradas",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
                      onPressed: () {
                        Navigator.pushNamed(context, '/relatorioEsp');
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

// class Relatorio extends StatefulWidget {
//   @override
//   _RelatorioState createState() => _RelatorioState();
// }

// class Periodo {
//   int id;
//   String nome;

//   Periodo(this.id, this.nome);
 
//   static List<Periodo> getPeriodo() {
//     return <Periodo>[
//       Periodo(1, 'Todos'),
//       Periodo(2, 'Dia'),
//       Periodo(3, 'Semana'),
//       Periodo(4, 'Mes'),
//       Periodo(5, 'Ano'),
//     ];
//   }
// }




// class Quantidade{
//   int id;
//   String nome;

//   Quantidade(this.id, this.nome);
 
//   static List<Quantidade> getQuantidade() {
//     return <Quantidade>[
//       Quantidade(1, 'Todos'),
//       Quantidade(2, 'Individual'),

//     ];
//   }
// }

// class Tipo {
//   int id;
//   String name;

//   Tipo(this.id, this.name);
 
//   static List<Tipo> getTipo() {
//     return <Tipo>[
//       Tipo(1, 'Todos'),
//       Tipo(2, 'Unidades de Saúde'),
//       Tipo(3, 'Especialidades'),
//     ];
//   }
// }

// class _RelatorioState extends State<Relatorio> {
//   List<Periodo> _periodo = Periodo.getPeriodo();
//   List<DropdownMenuItem<Periodo>> _dropdownMenuItemsPer;
//   Periodo _selectedPeriodo;

//   List<Tipo> _tipo = Tipo.getTipo();
//   List<DropdownMenuItem<Tipo>> _dropdownMenuItemst;
//   Tipo _selectedTipo;

//   List<Quantidade> _quantidade = Quantidade.getQuantidade();
//   List<DropdownMenuItem<Quantidade>> _dropdownMenuItemsQtd;
//   Quantidade _selectedQtd;
 
//   @override
//   void initState() {
//     _dropdownMenuItemsPer = buildDropdownMenuItemsPer(_periodo);
//     _selectedPeriodo = _dropdownMenuItemsPer[0].value;

//     _dropdownMenuItemst = buildDropdownMenuItemst(_tipo);
//     _selectedTipo = _dropdownMenuItemst[0].value;

//     _dropdownMenuItemsQtd = buildDropdownMenuItemsQtd(_quantidade);
//     _selectedQtd = _dropdownMenuItemsQtd[0].value;
//     super.initState();
//   }
//   List<DropdownMenuItem<Quantidade>> buildDropdownMenuItemsQtd(List qtd) {
//     List<DropdownMenuItem<Quantidade>> itemsQtd = List();
//     for (Quantidade qtd in qtd) {
//       itemsQtd.add(
//         DropdownMenuItem(
//           value: qtd,
//           child: Text(qtd.nome),
//         ),
//       );
//     }
//     return itemsQtd;
//   }
 
//   onChangeDropdownItemQtd(Quantidade selectedQtd) {
//     setState(() {
//       _selectedQtd = selectedQtd;
//     });
//   }
//   List<DropdownMenuItem<Tipo>> buildDropdownMenuItemst(List tipo) {
//     List<DropdownMenuItem<Tipo>> itemst = List();
//     for (Tipo tipo in tipo) {
//       itemst.add(
//         DropdownMenuItem(
//           value: tipo,
//           child: Text(tipo.name),
//         ),
//       );
//     }
//     return itemst;
//   }
 
//   onChangeDropdownItemt(Tipo selectedTipo) {
//     setState(() {
//       _selectedTipo = selectedTipo;
//     });
//   }
//   List<DropdownMenuItem<Periodo>> buildDropdownMenuItemsPer(List per) {
//     List<DropdownMenuItem<Periodo>> itemsPer = List();
//     for (Periodo per in per) {
//       itemsPer.add(
//         DropdownMenuItem(
//           value: per,
//           child: Text(per.nome),
//         ),
//       );
//     }
//     return itemsPer;
//   }
 
//   onChangeDropdownItemPer(Periodo selectedPeriodo) {
//     setState(() {
//       _selectedPeriodo = selectedPeriodo;
//     });
//   }



//   @override
  
//   Widget build(BuildContext context) {
//       return Scaffold(
//      appBar: AppBar(
//        title: new Text(
//           "Relatórios",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.indigo[900],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             new UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                   color: Colors.green,
//                   image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage('assets/seek2.png'))),
//               accountEmail: new Text("ezequiel@gmail.com",
//                   style: TextStyle(color: Colors.black)),
//               accountName: new Text("Ezequiel Mioranza",
//                   style: TextStyle(color: Colors.black)),
//               currentAccountPicture: new GestureDetector(
//                 child: new CircleAvatar(
//                   radius: 2000,
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage("assets/dcc.png"),
//                 ),
//                 onTap: () => print("This is your current account."),
//               ),
//             ),
//            ListTile(
//               leading:
//                   Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
//               title: Text('Home',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//               onTap: () => {Navigator.of(context).pop()},
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
//               title: Text('Meu Perfil',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//               onTap: () => {Navigator.pushNamed(context, '/perfil')},
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
//               title: Text('Relatório',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//               onTap: () => {Navigator.pushNamed(context, '/Relat')},
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
//               title: Text('Feedback',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//               onTap: () => {Navigator.of(context).pop()},
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
//               title: Text('Sugerir Unidade',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//               onTap: () => {Navigator.of(context).pop()},
//             ),
//             Divider(
//               height: 155,
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app, color: Colors.black, size: 25),
//               title: Text('Logout',
//                   style: TextStyle(color: Colors.black, fontSize: 17)),
//             ),
//           ],
//         ),
//      ),
//     body: new Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/blueee.png"),
//             fit: BoxFit.cover,
//           ),
//       ),
      
//       padding: EdgeInsets.all(16),
//           child:  Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[

//                   DropdownButton(
//                   style: TextStyle(color: Colors.black, fontSize: 25, backgroundColor: Colors.transparent),
//                   value: _selectedPeriodo,
//                   items: _dropdownMenuItemsPer,
//                   onChanged: onChangeDropdownItemPer,
//                 ),
//                 Divider(color: Colors.black),
//                   DropdownButton(
//                   style: TextStyle(color: Colors.black, fontSize: 25, backgroundColor: Colors.transparent),
//                   value: _selectedTipo,
//                   items: _dropdownMenuItemst,
//                   onChanged: onChangeDropdownItemt,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Divider(color: Colors.black),
//                 DropdownButton(
//                   style: TextStyle(color: Colors.black, fontSize: 25, backgroundColor: Colors.transparent),
//                   value: _selectedQtd,
//                   items: _dropdownMenuItemsQtd,
//                   onChanged: onChangeDropdownItemQtd,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 // Text('Selected: ${_selectedCompany.name}'),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(50, 70, 50, 2),//Distancia borda 
//                       child: RaisedButton(
//                         child: Text(
//                           "Buscar Relatório",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                         color: Colors.blue,
//                         padding: EdgeInsets.fromLTRB(50, 16, 50, 16),//Distancia da escrita
//                         onPressed: (){
//                           Navigator.pushNamed(context, "/GeraRelat");
//                         },
//                         // Borda do botão circular
//                         shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//                       ),
//                   ),
//                 ],  
//               ),
//             ),
//           ),
//         ),
//     );
//   }
// }