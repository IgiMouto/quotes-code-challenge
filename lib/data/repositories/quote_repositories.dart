import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/data/network/quote_api.dart';

class QuoteRepository {
  Future<Quote> fetchQuotes({required int limit}) async {
    final quoteApi = QuoteApi();

    try {
      final response = await quoteApi.fetchQuotes(limit: limit);

      if (response.statusCode == 200) {
        return quoteFromJson(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
