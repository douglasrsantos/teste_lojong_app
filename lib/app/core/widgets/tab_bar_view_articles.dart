import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/widgets/content_articles.dart';
import 'package:teste_lojong/app/core/widgets/error_data_or_network_widget.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';

class TabBarViewArticles extends StatefulWidget {
  final List<ArticleModel>? articles;
  final bool isLoading;
  final Function(int index) onTapContent;
  final ERRORTYPE? errorType;
  final String? errorMessage;
  final Function()? onPressed;
  final Function()? loadMoreArticlesData;

  const TabBarViewArticles({
    super.key,
    required this.onTapContent,
    this.articles,
    required this.isLoading,
    this.errorType,
    this.errorMessage,
    this.onPressed,
    this.loadMoreArticlesData,
  });

  @override
  State<TabBarViewArticles> createState() => _TabBarViewArticlesState();
}

class _TabBarViewArticlesState extends State<TabBarViewArticles> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.loadMoreArticlesData!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Observer(builder: (context) {
        if (widget.isLoading) {
          Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.backgrounColor),
            ),
          );
        }

        if (widget.errorType == ERRORTYPE.socket) {
          return ErrorDataOrNetworkWidget(
            content:
                'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
            onPressed: widget.onPressed,
          );
        }

        return ListView.separated(
          controller: _scrollController,
          separatorBuilder: (_, index) => Divider(
            indent: 10,
            endIndent: 10,
            color: AppColors.dividerColor,
            thickness: 0.2,
          ),
          itemCount: widget.articles?.length ?? 0,
          itemBuilder: (_, index) {
            final article = widget.articles?[index];

            return InkWell(
              onTap: () => widget.onTapContent(article?.id ?? 0),
              child: ContentArticles(
                article: article,
              ),
            );
          },
        );
      }),
    );
  }
}
