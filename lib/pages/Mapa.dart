import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapa extends StatefulWidget {
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _posicaoCamera =
      CameraPosition(target: LatLng(-25.4848, -49.2950));

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _adicionarListnerLocalizacao() {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    geolocator.getPositionStream(locationOptions).listen((Position position) {
      _posicaoCamera = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 19);

      _movimentarCamera(_posicaoCamera);
    });
  }

  _recuperaUltimaLocalizacaoConhecida() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      if (position != null) {
        _posicaoCamera = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 19);

        _movimentarCamera(_posicaoCamera);
      }
    });
  }

  _movimentarCamera(CameraPosition cameraPosition) async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperaUltimaLocalizacaoConhecida();
    _adicionarListnerLocalizacao();
  }
  void SairRela() {
        AlertDialog alertDialog = new AlertDialog(
          backgroundColor: Colors.white,
          content: new Text(
            "   Sair do aplicativo?",
            style: new TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          actions: <Widget>[
            new RaisedButton(
                child: new Text(
                  "Sim",
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: ()  => Navigator.of(context).pushNamedAndRemoveUntil ('/login',(Route <dynamic> route) => false),
                ),
            new RaisedButton(
              child: new Text(
                "Cancelar",
                style: new TextStyle(color: Colors.black, fontSize: 18.0),
              ),
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text(
          "Mapa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[900],
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
                  onTap: () => SairRela(),
            ),
          ],
        ),
     ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              minMaxZoomPreference: MinMaxZoomPreference(13, 17),
              initialCameraPosition: _posicaoCamera,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              //-25.4290, -49.2671
            ),
          ),
            
         new ButtonBar(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                child: Text('Rota'),
                onPressed: (){},
              )

            ]
          )
        ],
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   child:  Icon(Icons.my_location, color: Colors.white),
      //   backgroundColor: Colors.green,
      //   onPressed: () {},
      //   ),
    );
  }
}
