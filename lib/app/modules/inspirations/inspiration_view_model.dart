import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_lojong/app/core/services/check_internet_connection.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/ui/app_gradients.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/interfaces/quotes_interface.dart';
import 'package:teste_lojong/app/interfaces/videos_interface.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/models/articles_list_model.dart';
import 'package:teste_lojong/app/models/quote_model.dart';
import 'package:teste_lojong/app/models/quotes_list_model.dart';
import 'package:teste_lojong/app/models/video_model.dart';

part 'inspiration_view_model.g.dart';

enum ERRORTYPE {
  socket,
  dio,
  custom,
  none,
}

// ignore: library_private_types_in_public_api
class InspirationViewModel = _InspirationViewModel with _$InspirationViewModel;

abstract class _InspirationViewModel with Store {
  final articlesRepository = Modular.get<IArticles>();
  final videoRepository = Modular.get<IVideo>();
  final quotesRepository = Modular.get<IQuotes>();

  @observable
  ArticleListModel? articles;

  @observable
  ObservableList<ArticleModel> articlesList =
      ObservableList<ArticleModel>.of([]);

  @observable
  QuotesListModel? quotes;

  @observable
  ObservableList<QuoteModel> quotesList = ObservableList<QuoteModel>.of([]);

  @observable
  ObservableList<VideoModel> videos = ObservableList<VideoModel>.of([]);

  @observable
  int tabSelected = 0;

  @observable
  bool isLoading = false;

  @observable
  ERRORTYPE error = ERRORTYPE.none;

  @observable
  String? errorMessage;

  final List<Color> backgroundColor = [
    AppColors.quotesShareButton,
    Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.3),
  ];

  final List<TextStyle> textStyle = [
    AppFonts.cardTextQuotes,
    AppFonts.cardTextQuotes2,
    AppFonts.cardTextQuotes3,
  ];

  final List<TextStyle> textStyleAuthor = [
    AppFonts.cardTextQuotes,
    AppFonts.cardTextQuotes2.copyWith(fontSize: 12),
    AppFonts.cardTextQuotes3,
  ];

  final List<Gradient> gradients = [
    AppGradients.blueGradient,
    AppGradients.beigeGradient,
    AppGradients.salmonGradient
  ];

  final List<Widget> svgPictures = [
    SvgPicture.asset('assets/icons/video-play-salmon.svg'),
    SvgPicture.asset('assets/icons/video-play-blue.svg'),
  ];

  @action
  init() async {
    isLoading = true;
    await Future.wait([
      getVideos(),
      getArticles(),
      getQuotes(),
    ]);
    isLoading = false;
  }

  @action
  Future<void> refreshPages() async {
    isLoading = true;
    error = ERRORTYPE.none;
    errorMessage = '';
    await Future.wait([
      getVideos(),
      getArticles(),
      getQuotes(),
    ]);
    isLoading = false;
  }

  @action
  Future<void> getVideos() async {
    try {
      if (!await CheckInternetConnection.hasInternetConnection()) {
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

      final result = await videoRepository.getAllVideos();

      videos.addAll(result);
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

  @action
  Future<void> getArticles() async {
    try {
      if (!await CheckInternetConnection.hasInternetConnection()) {
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

      final result = await articlesRepository.getAllArticles();

      articles = result;
      articlesList.addAll(result.articles ?? []);
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

  @action
  Future<void> getQuotes() async {
    try {
      if (!await CheckInternetConnection.hasInternetConnection()) {
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

      final result = await quotesRepository.getAllQuotes();

      quotesList.addAll(result.quotes ?? []);
      quotes = result;
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

  @action
  Future<void> loadMoreArticlesData() async {
    if (articles?.hasMore == false) {
      return;
    }

    try {
      if (!await CheckInternetConnection.hasInternetConnection()) {
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

      final result =
          await articlesRepository.getAllArticles(page: articles?.nextPage);

      articlesList.addAll(result.articles ?? []);
      articles = result;
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

  @action
  Future<void> loadMoreQuotesData() async {
    if (quotes?.hasMore == false) {
      return;
    }

    try {
      if (!await CheckInternetConnection.hasInternetConnection()) {
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

      final result =
          await quotesRepository.getAllQuotes(page: quotes?.nextPage);

      quotesList.addAll(result.quotes ?? []);
      quotes = result;
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
}
