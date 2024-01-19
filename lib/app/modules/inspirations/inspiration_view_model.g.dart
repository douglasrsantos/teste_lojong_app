// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspiration_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InspirationViewModel on _InspirationViewModel, Store {
  late final _$articlesAtom =
      Atom(name: '_InspirationViewModel.articles', context: context);

  @override
  ArticleListModel? get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ArticleListModel? value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$articlesListAtom =
      Atom(name: '_InspirationViewModel.articlesList', context: context);

  @override
  ObservableList<ArticleModel> get articlesList {
    _$articlesListAtom.reportRead();
    return super.articlesList;
  }

  @override
  set articlesList(ObservableList<ArticleModel> value) {
    _$articlesListAtom.reportWrite(value, super.articlesList, () {
      super.articlesList = value;
    });
  }

  late final _$quotesAtom =
      Atom(name: '_InspirationViewModel.quotes', context: context);

  @override
  QuotesListModel? get quotes {
    _$quotesAtom.reportRead();
    return super.quotes;
  }

  @override
  set quotes(QuotesListModel? value) {
    _$quotesAtom.reportWrite(value, super.quotes, () {
      super.quotes = value;
    });
  }

  late final _$quotesListAtom =
      Atom(name: '_InspirationViewModel.quotesList', context: context);

  @override
  ObservableList<QuoteModel> get quotesList {
    _$quotesListAtom.reportRead();
    return super.quotesList;
  }

  @override
  set quotesList(ObservableList<QuoteModel> value) {
    _$quotesListAtom.reportWrite(value, super.quotesList, () {
      super.quotesList = value;
    });
  }

  late final _$videosAtom =
      Atom(name: '_InspirationViewModel.videos', context: context);

  @override
  ObservableList<VideoModel> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<VideoModel> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$tabSelectedAtom =
      Atom(name: '_InspirationViewModel.tabSelected', context: context);

  @override
  int get tabSelected {
    _$tabSelectedAtom.reportRead();
    return super.tabSelected;
  }

  @override
  set tabSelected(int value) {
    _$tabSelectedAtom.reportWrite(value, super.tabSelected, () {
      super.tabSelected = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_InspirationViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_InspirationViewModel.error', context: context);

  @override
  ERRORTYPE get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(ERRORTYPE value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_InspirationViewModel.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_InspirationViewModel.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$refreshPagesAsyncAction =
      AsyncAction('_InspirationViewModel.refreshPages', context: context);

  @override
  Future<void> refreshPages() {
    return _$refreshPagesAsyncAction.run(() => super.refreshPages());
  }

  late final _$getVideosAsyncAction =
      AsyncAction('_InspirationViewModel.getVideos', context: context);

  @override
  Future<void> getVideos() {
    return _$getVideosAsyncAction.run(() => super.getVideos());
  }

  late final _$getArticlesAsyncAction =
      AsyncAction('_InspirationViewModel.getArticles', context: context);

  @override
  Future<void> getArticles() {
    return _$getArticlesAsyncAction.run(() => super.getArticles());
  }

  late final _$getQuotesAsyncAction =
      AsyncAction('_InspirationViewModel.getQuotes', context: context);

  @override
  Future<void> getQuotes() {
    return _$getQuotesAsyncAction.run(() => super.getQuotes());
  }

  late final _$loadMoreArticlesDataAsyncAction = AsyncAction(
      '_InspirationViewModel.loadMoreArticlesData',
      context: context);

  @override
  Future<void> loadMoreArticlesData() {
    return _$loadMoreArticlesDataAsyncAction
        .run(() => super.loadMoreArticlesData());
  }

  late final _$loadMoreQuotesDataAsyncAction =
      AsyncAction('_InspirationViewModel.loadMoreQuotesData', context: context);

  @override
  Future<void> loadMoreQuotesData() {
    return _$loadMoreQuotesDataAsyncAction
        .run(() => super.loadMoreQuotesData());
  }

  @override
  String toString() {
    return '''
articles: ${articles},
articlesList: ${articlesList},
quotes: ${quotes},
quotesList: ${quotesList},
videos: ${videos},
tabSelected: ${tabSelected},
isLoading: ${isLoading},
error: ${error},
errorMessage: ${errorMessage}
    ''';
  }
}
