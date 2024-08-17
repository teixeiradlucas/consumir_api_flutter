import 'dart:convert';

import 'package:consumir_api_flutter/app/data/api_url.dart';
import 'package:consumir_api_flutter/app/data/http/http_client.dart';
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';

Future<List<StockModel>> getStocks(HttpClient client) async {
  final response = await client.get(
    url: apiUrlStocks,
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body as String);
    if (jsonResponse is Map && jsonResponse.containsKey('stocks')) {
      final stocksList = jsonResponse['stocks'] as List;
      return stocksList
          .map((stock) => StockModel.fromJson(stock as Map<String, dynamic>))
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

class StockRepository {
  StockRepository({required this.client});
  final HttpClient client;

  Future<List<StockModel>> fetchStocks() {
    return getStocks(client);
  }
}
