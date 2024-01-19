import 'dart:async';
import 'dart:io';

class CheckInternetConnection {
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com.br');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
