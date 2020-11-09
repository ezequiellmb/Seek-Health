import 'package:flutter/material.dart';
import 'package:seekhealth/pages/ListaUsuario.dart';
import 'package:seekhealth/pages/RecSenha.dart';
import 'package:seekhealth/pages/registro.dart';

import 'Mapa.dart';
import 'RecSenha.dart';
import 'Home.dart';
import 'registro.dart';


class Rotas {
  static Route<dynamic> geraRota(RouteSettings settings){
    switch(settings.name){
      
        case "/mapa":
        return MaterialPageRoute(
        builder: (_) => Mapa()
        );
        case "/rsenha":
        return MaterialPageRoute(
        builder: (_) => RecSenha()
        );
        case "/home":
        return MaterialPageRoute(
        builder: (_) => Home()
        );
        case "/add":
        return MaterialPageRoute(
        builder: (_) => Add()
        );
        case "/lista":
        return MaterialPageRoute(
        builder: (_) => ListaUser()
        );
        default:
        _erroRota();
    }
  }
  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada!"),),
          body: Center(
            child:Text("Tela não encontrada!"),),
        );
      });
  }
}