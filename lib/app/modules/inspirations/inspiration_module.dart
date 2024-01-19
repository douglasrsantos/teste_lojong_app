import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_lojong/app/app_module.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view.dart';
import 'package:teste_lojong/app/modules/inspirations/pages/detail_article/detail_article_view.dart';
import 'package:teste_lojong/app/modules/inspirations/pages/detail_article/detail_article_view_model.dart';

class InspirationModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton(InspirationViewModel.new);
    i.addSingleton(DetailArticleViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => InspirationView(
        inspirationViewModel: Modular.get(),
      ),
    );
    r.child(
      '/detail-article/:id',
      child: (_) => DetailArticleView(
        detailArticleViewModel: Modular.get(),
        id: r.args.params['id'],
      ),
    );
  }
}
