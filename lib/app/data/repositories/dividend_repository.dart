import 'dart:convert';
import 'package:consumir_api_flutter/app/data/models/Dividend_model.dart';
import 'package:consumir_api_flutter/app/data/api_url.dart';
import 'package:http/http.dart' as http;

class DividendRepository {
  Future<List<DividendModel>> getDividends() async {
    final response = await http.get(
      Uri.parse(apiUrlDividends),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('dividends')) {
        final dividendsList = jsonResponse['dividends'] as List;
        return dividendsList
            .map((dividend) => DividendModel.fromJson(dividend))
            .toList();
      } else {
        throw Exception('Formato JSON inesperado');
      }
    } else if (response.statusCode == 404) {
      throw Exception('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os dados');
    }
  }
}
