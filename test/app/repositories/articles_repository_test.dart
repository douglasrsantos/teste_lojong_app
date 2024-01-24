import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/models/articles_list_model.dart';
import 'package:teste_lojong/app/repositories/articles_repository.dart';

class ArticleRepositoryMock extends Mock implements ArticlesRepository {}

void main() {
  late ArticlesRepository repository;

  setUp(() {
    repository = ArticleRepositoryMock();
  });

  group('articles | ', () {
    test('get all articles', () async {
      when(() => repository.getAllArticles()).thenAnswer(
        (_) async => ArticleListModel(
          currentPage: 1,
          hasMore: true,
          lastPage: 5,
          nextPage: 2,
          articles: <ArticleModel>[
            ArticleModel()..id = 1,
          ],
        ),
      );

      final articles = await repository.getAllArticles();

      expect(articles, isNotNull);
      expect(articles.articles!.length, 1);
    });

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

      final article = await repository.getArticleById(articleId: 1);

      expect(article, isNotNull);
    });
  });
}
