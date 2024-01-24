import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_lojong/app/models/quote_model.dart';
import 'package:teste_lojong/app/models/quotes_list_model.dart';
import 'package:teste_lojong/app/repositories/quotes_repository.dart';

class QuoteRepositoryMock extends Mock implements QuotesRepository {}

void main() {
  late QuotesRepository repository;

  setUp(() {
    repository = QuoteRepositoryMock();
  });

  group('quotes | ', () {
    test('get all quotes', () async {
      when(() => repository.getAllQuotes()).thenAnswer(
        (_) async => QuotesListModel(
          currentPage: 1,
          hasMore: true,
          lastPage: 5,
          nextPage: 2,
          quotes: <QuoteModel>[
            QuoteModel()..id = 1,
          ],
        ),
      );

      final quotes = await repository.getAllQuotes();

      expect(quotes, isNotNull);
      expect(quotes.quotes!.length, 1);
    });
  });
}
