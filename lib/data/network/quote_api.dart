import 'package:http/http.dart' as http;

class QuoteApi {
  Future<http.Response> fetchQuotes({required int limit}) async {
    final uriParsed = Uri.parse("quotable.io/quotes?page=1&limit=$limit");

    final response = await http.get(uriParsed);

    return response;
  }
}
