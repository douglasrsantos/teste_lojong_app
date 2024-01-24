import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/interfaces/quotes_interface.dart';
import 'package:teste_lojong/app/interfaces/videos_interface.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/models/articles_list_model.dart';
import 'package:teste_lojong/app/models/quote_model.dart';
import 'package:teste_lojong/app/models/quotes_list_model.dart';
import 'package:teste_lojong/app/models/video_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_module.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';

class VideoRepositoryMock extends Mock implements IVideo {}

class ArticleRepositoryMock extends Mock implements IArticles {}

class QuotesRepositoryMock extends Mock implements IQuotes {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late InspirationViewModel viewModel;
  late IVideo videoRepository;
  late IArticles articleRepository;
  late IQuotes quotesRepository;
  Modular.bindModule(InspirationModule());

  setUp(() {
    videoRepository = VideoRepositoryMock();
    articleRepository = ArticleRepositoryMock();
    quotesRepository = QuotesRepositoryMock();

    viewModel = InspirationViewModel(
      articlesRepository: articleRepository,
      videoRepository: videoRepository,
      quotesRepository: quotesRepository,
    );
  });

  group('videos | ', () {
    test('getVideos - socket exception', () async {
      // Arrange
      when(() => videoRepository.getAllVideos())
          .thenThrow((_) async => SocketException);

      // Act
      await viewModel.getVideos();

      // Assert
      expect(viewModel.videos, []);
    });

    test('getVideos - dio exception', () async {
      // Arrange
      when(() => videoRepository.getAllVideos())
          .thenThrow((_) async => DioException);

      // Act
      await viewModel.getVideos();

      // Assert
      expect(viewModel.videos, []);
    });

    test('getVideos - success', () async {
      // Arrange
      when(() => videoRepository.getAllVideos()).thenAnswer(
        (_) async => <VideoModel>[
          VideoModel(
            id: 1,
            name: 'Vídeo 1',
            awsUrl: 'awsUrl',
            description: 'descrição',
            image: 'image',
            imageUrl: 'imageUrl',
            order: 1,
            url2: 'url2',
            url: 'url',
          )
        ],
      );

      // Act
      await viewModel.getVideos();

      // Assert
      expect(viewModel.videos, isNotNull);
    });
  });

  group('articles | ', () {
    test('getArticles - socket exception', () async {
      // Arrange
      when(() => articleRepository.getAllArticles())
          .thenThrow((_) async => SocketException);

      // Act
      await viewModel.getArticles();

      // Assert
      expect(viewModel.articles, isNull);
    });

    test('getArticles - dio exception', () async {
      // Arrange
      when(() => articleRepository.getAllArticles())
          .thenThrow((_) async => DioException);

      // Act
      await viewModel.getArticles();

      // Assert
      expect(viewModel.articles, isNull);
    });

    test('getArticles - success', () async {
      // Arrange
      when(() => articleRepository.getAllArticles()).thenAnswer(
        (_) async => ArticleListModel(
            hasMore: true,
            currentPage: 1,
            lastPage: 5,
            nextPage: 2,
            articles: [
              ArticleModel()..id = 1,
            ]),
      );

      // Act
      await viewModel.getArticles();

      // Assert
      expect(viewModel.articles, isNotNull);
      expect(viewModel.articles!.articles!.length, 1);
    });
  });

  group('quotes | ', () {
    test('getQuotes - socket exception', () async {
      // Arrange
      when(() => quotesRepository.getAllQuotes())
          .thenThrow((_) async => SocketException);

      // Act
      await viewModel.getQuotes();

      // Assert
      expect(viewModel.quotes, isNull);
    });

    test('getQuotes - dio exception', () async {
      // Arrange
      when(() => quotesRepository.getAllQuotes())
          .thenThrow((_) async => DioException);

      // Act
      await viewModel.getQuotes();

      // Assert
      expect(viewModel.quotes, isNull);
    });

    test('getQuotes - success', () async {
      // Arrange
      when(() => quotesRepository.getAllQuotes()).thenAnswer(
        (_) async => QuotesListModel(
          hasMore: true,
          currentPage: 1,
          lastPage: 5,
          nextPage: 2,
          quotes: [
            QuoteModel()..id = 1,
          ],
        ),
      );

      // Act
      await viewModel.getQuotes();

      // Assert
      expect(viewModel.quotes!.quotes!.length, 1);
      expect(viewModel.quotes, isNotNull);
    });
  });
}
