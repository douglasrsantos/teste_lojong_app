import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_module.dart';
import 'package:teste_lojong/app/modules/inspirations/pages/detail_article/detail_article_view_model.dart';

class ArticlesRepositoryMock extends Mock implements IArticles {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late IArticles repository;
  late DetailArticleViewModel viewModel;
  Modular.bindModule(InspirationModule());

  setUp(() {
    repository = ArticlesRepositoryMock();
    viewModel = DetailArticleViewModel();
  });

  group('detail article | ', () {
    test('get article by id', () async {
      when(() => repository.getArticleById(articleId: any(named: 'articleId')))
          .thenAnswer(
        (_) async => ArticleModel(
          id: 1,
          authorDescription: '',
          authorImage: '',
          authorName: '',
          fullText: '',
          image: '',
          imageUrl: '',
          order: 1,
          premium: 1,
          text: '',
          title: '',
          url: '',
        ),
      );

      final result = await repository.getArticleById(articleId: 1);

      expect(result, isNotNull);
      expect(viewModel.error, ERRORTYPE.none);
      expect(viewModel.errorMessage, null);
    });
  });
}
