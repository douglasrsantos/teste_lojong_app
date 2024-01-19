// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_article_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailArticleViewModel on _DetailArticleViewModel, Store {
  Computed<String>? _$articleImageUrlComputed;

  @override
  String get articleImageUrl => (_$articleImageUrlComputed ??= Computed<String>(
          () => super.articleImageUrl,
          name: '_DetailArticleViewModel.articleImageUrl'))
      .value;
  Computed<String>? _$articleTitleComputed;

  @override
  String get articleTitle =>
      (_$articleTitleComputed ??= Computed<String>(() => super.articleTitle,
              name: '_DetailArticleViewModel.articleTitle'))
          .value;
  Computed<String>? _$articleFullTextComputed;

  @override
  String get articleFullText => (_$articleFullTextComputed ??= Computed<String>(
          () => super.articleFullText,
          name: '_DetailArticleViewModel.articleFullText'))
      .value;
  Computed<String>? _$articleAuthorImageComputed;

  @override
  String get articleAuthorImage => (_$articleAuthorImageComputed ??=
          Computed<String>(() => super.articleAuthorImage,
              name: '_DetailArticleViewModel.articleAuthorImage'))
      .value;
  Computed<String>? _$articleAuthorNameComputed;

  @override
  String get articleAuthorName => (_$articleAuthorNameComputed ??=
          Computed<String>(() => super.articleAuthorName,
              name: '_DetailArticleViewModel.articleAuthorName'))
      .value;
  Computed<String>? _$articleAuthorDescriptionComputed;

  @override
  String get articleAuthorDescription => (_$articleAuthorDescriptionComputed ??=
          Computed<String>(() => super.articleAuthorDescription,
              name: '_DetailArticleViewModel.articleAuthorDescription'))
      .value;

  late final _$articleAtom =
      Atom(name: '_DetailArticleViewModel.article', context: context);

  @override
  ArticleModel? get article {
    _$articleAtom.reportRead();
    return super.article;
  }

  @override
  set article(ArticleModel? value) {
    _$articleAtom.reportWrite(value, super.article, () {
      super.article = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DetailArticleViewModel.isLoading', context: context);

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
      Atom(name: '_DetailArticleViewModel.error', context: context);

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
      Atom(name: '_DetailArticleViewModel.errorMessage', context: context);

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

  late final _$getArticleAsyncAction =
      AsyncAction('_DetailArticleViewModel.getArticle', context: context);

  @override
  Future<void> getArticle(int id) {
    return _$getArticleAsyncAction.run(() => super.getArticle(id));
  }

  @override
  String toString() {
    return '''
article: ${article},
isLoading: ${isLoading},
error: ${error},
errorMessage: ${errorMessage},
articleImageUrl: ${articleImageUrl},
articleTitle: ${articleTitle},
articleFullText: ${articleFullText},
articleAuthorImage: ${articleAuthorImage},
articleAuthorName: ${articleAuthorName},
articleAuthorDescription: ${articleAuthorDescription}
    ''';
  }
}
