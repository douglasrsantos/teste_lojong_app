import 'package:teste_lojong/app/models/quotes_list_model.dart';

abstract class IQuotes {
  Future<QuotesListModel> getAllQuotes({int? page});
}
