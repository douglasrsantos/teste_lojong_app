import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/interfaces/quotes_interface.dart';
import 'package:teste_lojong/app/interfaces/videos_interface.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_module.dart';
import 'package:teste_lojong/app/repositories/articles_repository.dart';
import 'package:teste_lojong/app/repositories/quotes_repository.dart';
import 'package:teste_lojong/app/repositories/videos_repository.dart';

class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(Dio());
    i.addSingleton<IQuotes>(QuotesRepository.new);
    i.addSingleton<IVideo>(VideosRepository.new);
    i.addSingleton<IArticles>(ArticlesRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: InspirationModule());
  }
}
