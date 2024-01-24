import 'package:dio/dio.dart';
import 'package:teste_lojong/app/core/services/initialize_dio.dart';
import 'package:teste_lojong/app/interfaces/videos_interface.dart';
import 'package:teste_lojong/app/models/video_model.dart';

class VideosRepository implements IVideo {
  final Dio _dio;

  VideosRepository(this._dio) {
    _init();
  }

  _init() async {
    InitializeDio.initializeDioOptions(_dio, 'videos-cache');
  }

  @override
  Future<List<VideoModel>> getAllVideos({int? page}) async {
    final result = await _dio.get(
      'videos',
      data: {
        "page": page,
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf',
        },
      ),
    );

    final videos = List.generate(result.data.length, (index) {
      return VideoModel.fromMap(result.data[index]);
    });

    return videos;
  }
}
