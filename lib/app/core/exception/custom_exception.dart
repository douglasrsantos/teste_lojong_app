class CustomException implements Exception {
  final dynamic _data;

  CustomException(this._data);

  String get message {
    if (_data is String){
      return _data;
    }

    return 'Erro ao obter informações do servidor. Tente novamente.';
  }
}
