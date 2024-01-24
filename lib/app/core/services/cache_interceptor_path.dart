import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class CacheInterceptorPath {
  Future<CacheStore> configCacheStore(String hiveBoxName) async {
    final dir = await getApplicationDocumentsDirectory();

    return HiveCacheStore(
      dir.path,
      hiveBoxName: hiveBoxName,
    );
  }
}
