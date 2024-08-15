import 'dart:convert';
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';
import 'package:http/http.dart' as http;

Future<List<StockModel>> httpClient() async {
  final response =
      await http.get(Uri.parse('http://mfinance.com.br/api/v1/stocks'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse is Map && jsonResponse.containsKey('stocks')) {
      final stocksList = jsonResponse['stocks'] as List;
      return stocksList.map((stock) => StockModel.fromJson(stock)).toList();
    } else {
      throw Exception('Formato JSON inesperado');
    }
  } else {
    throw Exception('Falha para carregar dados');
  }
}
