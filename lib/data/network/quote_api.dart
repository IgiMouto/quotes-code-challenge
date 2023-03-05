import 'package:http/http.dart' as http;

class QuoteApi {
  Future<http.Response> fetchQuotes() async {
    final uriParsed = Uri.parse("https://quotable.io/quotes");

    final response = await http.get(uriParsed);

    return response;
  }
}
