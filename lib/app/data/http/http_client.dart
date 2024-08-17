import 'package:http/http.dart' as http;

class HttpClient {
  final client = http.Client();

  Future<dynamic> get({required String url}) {
    return client.get(Uri.parse(url));
  }
}
