import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_lojong/app/core/ui/app_colors.dart';
import 'package:teste_lojong/app/core/widgets/content_videos.dart';
import 'package:teste_lojong/app/core/widgets/error_data_or_network_widget.dart';
import 'package:teste_lojong/app/models/video_model.dart';
import 'package:teste_lojong/app/modules/inspirations/inspiration_view_model.dart';

class TabBarViewVideos extends StatelessWidget {
  final List<VideoModel>? videoList;
  final List<Widget> svgPictures;
  final bool isLoading;
  final Function(int index) onTap;
  final ERRORTYPE? errorType;
  final String? errorMessage;
  final Function()? onPressed;

  const TabBarViewVideos({
    super.key,
    required this.onTap,
    this.videoList,
    required this.isLoading,
    this.errorType,
    this.errorMessage,
    this.onPressed,
    required this.svgPictures,
  });

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
      child: Observer(builder: (_) {
        if (isLoading) {
          Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(AppColors.backgrounColor),
            ),
          );
        }

        if (errorType == ERRORTYPE.socket) {
          return ErrorDataOrNetworkWidget(
            content:
                'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
            onPressed: onPressed,
          );
        }

        return ListView.separated(
          separatorBuilder: (_, index) => Divider(
            indent: 10,
            endIndent: 10,
            color: AppColors.dividerColor,
            thickness: 0.2,
          ),
          itemCount: videoList?.length ?? 0,
          itemBuilder: (_, index) {
            final video = videoList?[index];

            return InkWell(
              onTap: onTap(index),
              child: ContentVideos(
                video: video,
                svgPictures: svgPictures,
                index: index,
              ),
            );
          },
        );
      }),
    );
  }
}
