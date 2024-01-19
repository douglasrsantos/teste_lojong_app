import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';
import 'package:teste_lojong/app/core/widgets/share_button.dart';
import 'package:teste_lojong/app/models/article_model.dart';

class ContentArticles extends StatelessWidget {
  final ArticleModel? article;

  const ContentArticles({
    super.key,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 34,
        vertical: 18,
      ),
      child: Column(
        children: [
          Text(
            article?.title ?? '',
            style: AppFonts.cardTitleText,
          ),
          const SizedBox(height: 10),
          Card(
            margin: const EdgeInsets.all(0),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: article?.imageUrl ?? '',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator.adaptive(
                    value: downloadProgress.progress,
                    valueColor:
                        AlwaysStoppedAnimation(AppColors.backgrounColor),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 32),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            article?.text ?? '',
            textAlign: TextAlign.center,
            style: AppFonts.cardDescription,
          ),
          const SizedBox(height: 12),
          ShareButton(
            backgroundColor: AppColors.cardButtonColor,
            style: AppFonts.cardTextButton,
            iconColor: AppColors.cardTexts,
          ),
        ],
      ),
    );
  }
}
