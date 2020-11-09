class Usuario{
  String _idUsuario;
  String _nome;
  String _email;
  String _senha;
  String _tipoUsuario;

  Usuario();

  String vrTipoUser(bool tipoUsuario){
    return tipoUsuario ? "Usuario" : "Administrador";
  }

  String get tipoUsuario => _tipoUsuario;
  set tipoUsuario(String value){
    _tipoUsuario = value;
  }
  String get senha => _senha;
  set senha(String value){
    _senha = value;
  }
  String get email => _email;
  set email(String value){
    _email = value;
  }
  String get nome => _nome;
  set nome(String value){
    _nome = value;
  }
  String get id => _idUsuario;
  set id(String value){
    _idUsuario = value;
  }

}