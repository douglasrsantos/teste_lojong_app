import 'package:dio/dio.dart';
import 'package:teste_lojong/app/core/services/initialize_dio.dart';
import 'package:teste_lojong/app/interfaces/quotes_interface.dart';
import 'package:teste_lojong/app/models/quotes_list_model.dart';

class QuotesRepository implements IQuotes {
  final Dio _dio;

  QuotesRepository(this._dio) {
    _init();
  }

  _init() async {
    InitializeDio.initializeDioOptions(_dio,'quotes-cache');
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
