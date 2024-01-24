import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/app/models/video_model.dart';
import 'package:teste_lojong/app/repositories/videos_repository.dart';

class VideoRepositoryMock extends Mock implements VideosRepository {}

void main() {
  late VideosRepository repository;

  setUp(() {
    repository = VideoRepositoryMock();
  });

  group('videos | ', () {
    test('get all videos', () async {
      when(() => repository.getAllVideos()).thenAnswer((_) async => [
            VideoModel()..id = 1,
          ]);

      final videos = await repository.getAllVideos();

      expect(videos.length, 1);
    });
  });
}
