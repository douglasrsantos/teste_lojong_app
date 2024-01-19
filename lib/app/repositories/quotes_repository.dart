import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:teste_lojong/app/core/app_constants.dart';
import 'package:teste_lojong/app/core/app_core.dart';
import 'package:teste_lojong/app/core/services/app_path_provider.dart';
import 'package:teste_lojong/app/interfaces/quotes_interface.dart';
import 'package:teste_lojong/app/models/quotes_list_model.dart';

class QuotesRepository implements IQuotes {
  final Dio _dio;

  QuotesRepository(this._dio) {
    _init();
  }

  _init() async {
    _dio.options = BaseOptions(
      baseUrl: AppCore.apiUrl,
      contentType: 'application/json',
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    );

    await AppPathProvider.initPath();

    _dio.interceptors.add(ChuckerDioInterceptor());

    _dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(
            AppPathProvider.path,
            hiveBoxName: 'quotes_cache',
          ),
          policy: CachePolicy.refreshForceCache,
          hitCacheOnErrorExcept: [],
          maxStale: const Duration(
            days: AppConstants.cacheDays,
          ),
          priority: CachePriority.high,
        ),
      ),
    );

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }

  @override
  Future<QuotesListModel> getAllQuotes({int? page}) async {
    final result = await _dio.get(
      'quotes2',
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

    return QuotesListModel.fromMap(result.data);
  }
}
