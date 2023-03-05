import 'package:http/http.dart' as http;
import 'package:quotes_code_challenge/data/models/quote_model.dart';

class QuoteApi {
  Future<http.Response> fetchQuotes() async {
    final uriParsed =
        Uri.parse("https://api.quotable.io/quotes?page=1&limit=10");

    final response = await http.get(uriParsed);

    return response;
  }
}
