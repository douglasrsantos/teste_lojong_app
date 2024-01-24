import 'dart:async';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

class CheckInternetConnection {
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com.br');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static testInternet() async {
    if (!await hasInternetConnection()) {
      Timer.periodic(
        const Duration(seconds: 10),
        (timer) async {
          if (await CheckInternetConnection.hasInternetConnection()) {
            timer.cancel();
            Modular.to.popUntil((route) => route.settings.name == '/');
          }
        },
      );
      throw const SocketException('Sem conexão com a internet');
    }
  }
}
