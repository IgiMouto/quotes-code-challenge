import 'dart:convert';

import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/data/network/quote_api.dart';

class QuoteRepository {
  Future<List<Quote>> fetchQuotes() async {
    final quoteApi = QuoteApi();

    try {
      final response = await quoteApi.fetchQuotes();

      if (response.statusCode == 200) {
        List<dynamic> quotesJson = jsonDecode(response.body)['results'];
        return quotesJson.map((element) => Quote.fromJson(element)).toList();
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
