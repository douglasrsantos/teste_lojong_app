import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
// import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
// import 'package:teste_lojong/app/core/app_constants.dart';
import 'package:teste_lojong/app/core/app_core.dart';
// import 'package:teste_lojong/app/core/services/cache_interceptor_path.dart';

class InitializeDio {
  static initializeDioOptions(Dio client, String hiveBoxName) async {
    client.options = BaseOptions(
      baseUrl: AppCore.apiUrl,
      contentType: 'application/json',
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    );

    client.interceptors.add(ChuckerDioInterceptor());

    // commented for tests
    // 
    // client.interceptors.add(
    //   DioCacheInterceptor(
    //     options: CacheOptions(
    //       store: await CacheInterceptorPath().configCacheStore(hiveBoxName),
    //       policy: CachePolicy.refreshForceCache,
    //       hitCacheOnErrorExcept: [],
    //       maxStale: const Duration(
    //         days: AppConstants.cacheDays,
    //       ),
    //       priority: CachePriority.high,
    //     ),
    //   ),
    // );

    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }
}
