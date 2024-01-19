import 'package:flutter/cupertino.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/ui/app_fonts.dart';

class CardAuthorArticle extends StatelessWidget {
  final String? articleAuthorImage;
  final String? articleAuthorName;
  final String? articleAuthorDescription;

  const CardAuthorArticle({
    super.key,
    this.articleAuthorImage,
    this.articleAuthorName,
    this.articleAuthorDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cardButtonColor,
      ),
      padding: const EdgeInsets.all(14),
      child: articleAuthorImage != null && articleAuthorImage!.isNotEmpty
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          articleAuthorImage ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articleAuthorName ?? '',
                        style: AppFonts.authorName,
                      ),
                      Text(
                        articleAuthorDescription ?? '',
                        style: AppFonts.authorDescription,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articleAuthorName ?? '',
                style: AppFonts.authorName,
              ),
              Text(
                articleAuthorDescription ?? '',
                style: AppFonts.authorDescription,
              ),
            ],
          ),
    );
  }
}
