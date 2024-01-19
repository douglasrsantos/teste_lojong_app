import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_lojong/app/app_module.dart';
import 'package:teste_lojong/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ChuckerFlutter.showOnRelease = false;
  ChuckerFlutter.showNotification = false;

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
