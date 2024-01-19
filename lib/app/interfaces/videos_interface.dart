import 'package:teste_lojong/app/models/video_model.dart';

abstract class IVideo {
  Future<List<VideoModel>> getAllVideos({int? page});
}
