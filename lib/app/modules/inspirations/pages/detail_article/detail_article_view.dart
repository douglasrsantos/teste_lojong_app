import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/widgets/card_author_article.dart';
import 'package:teste_lojong/app/core/widgets/error_data_or_network_widget.dart';
import 'package:teste_lojong/app/modules/inspirations/pages/detail_article/detail_article_view_model.dart';

class DetailArticleView extends StatefulWidget {
  final DetailArticleViewModel detailArticleViewModel;
  final String? id;

  const DetailArticleView({
    super.key,
    required this.detailArticleViewModel,
    this.id,
  });

  @override
  State<DetailArticleView> createState() => _DetailArticleViewState();
}

class _DetailArticleViewState extends State<DetailArticleView> {
  DetailArticleViewModel get detailArticleViewModel =>
      widget.detailArticleViewModel;

  @override
  void initState() {
    if (widget.id != null) {
      detailArticleViewModel.init(widget.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Modular.to.pop(),
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/arrow-back.svg'),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Observer(builder: (_) {
          if (detailArticleViewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(AppColors.backgrounColor),
              ),
            );
          }

          if (detailArticleViewModel.articleImageUrl.isEmpty) {
            return const ErrorDataOrNetworkWidget(
              content:
                  'Falha ao obter dados do artigo!\nO mesmo foi removido ou não encontrado.\nTente novamente ou confira outros artigos no app Lojong.',
            );
          }

          if (detailArticleViewModel.error == ERRORTYPE.socket) {
            return ErrorDataOrNetworkWidget(
              content:
                  'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
              onPressed: () => detailArticleViewModel.refreshPage(widget.id!),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: detailArticleViewModel.articleImageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator.adaptive(
                        value: downloadProgress.progress,
                        valueColor:
                            AlwaysStoppedAnimation(AppColors.backgrounColor),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, size: 32),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    detailArticleViewModel.articleTitle,
                    textAlign: TextAlign.center,
                    style: AppFonts.detailArticlesTitle,
                  ),
                  const SizedBox(height: 20),
                  HtmlWidget(
                    detailArticleViewModel.articleFullText,
                    textStyle: AppFonts.bodyTextDetailArticle,
                  ),
                  const SizedBox(height: 16),
                  CardAuthorArticle(
                    articleAuthorImage:
                        detailArticleViewModel.articleAuthorImage,
                    articleAuthorName: detailArticleViewModel.articleAuthorName,
                    articleAuthorDescription:
                        detailArticleViewModel.articleAuthorDescription,
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorButtonShareDetailArticle,
                      fixedSize: const Size(double.maxFinite, 35),
                    ),
                    child: Text(
                      'COMPARTILHAR',
                      style: AppFonts.textShareButtonDetailArticle,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
