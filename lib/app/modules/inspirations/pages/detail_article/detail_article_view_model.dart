import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_lojong/app/core/services/check_internet_connection.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/models/article_model.dart';

part 'detail_article_view_model.g.dart';

enum ERRORTYPE {
  socket,
  dio,
  custom,
  none,
}

// ignore: library_private_types_in_public_api
class DetailArticleViewModel = _DetailArticleViewModel
    with _$DetailArticleViewModel;

abstract class _DetailArticleViewModel with Store {
  final articlesRepository = Modular.get<IArticles>();

  @observable
  ArticleModel? article;

  @observable
  bool isLoading = false;

  @observable
  ERRORTYPE error = ERRORTYPE.none;

  @observable
  String? errorMessage;

  init(String id) async {
    isLoading = true;
    await Future.wait([
      getArticle(int.parse(id)),
    ]);
    isLoading = false;
  }

  void refreshPage(String id) async {
    isLoading = true;
    error = ERRORTYPE.none;
    errorMessage = '';
    await Future.wait([
      getArticle(int.parse(id)),
    ]);
    isLoading = false;
  }

  @action
  Future<void> getArticle(int id) async {
    try {
      await CheckInternetConnection.testInternet();

      final result = await articlesRepository.getArticleById(articleId: id);

      article = result;
    } on SocketException catch (e) {
      log(e.toString());
      error = ERRORTYPE.socket;
      errorMessage = e.message;
    } on DioException catch (e) {
      log(e.toString());
      error = ERRORTYPE.dio;
      errorMessage = e.message;
    } catch (e) {
      log(e.toString());
      error = ERRORTYPE.custom;
      errorMessage = 'Erro ao obter dados do servidor. Tente novamente.';
    }
  }

  @computed
  String get articleImageUrl => article?.imageUrl ?? '';

  @computed
  String get articleTitle => article?.title ?? '';

  @computed
  String get articleFullText => article?.fullText ?? '';

  @computed
  String get articleAuthorImage => article?.authorImage ?? '';

  @computed
  String get articleAuthorName => article?.authorName ?? '';

  @computed
  String get articleAuthorDescription => article?.authorDescription ?? '';
}
