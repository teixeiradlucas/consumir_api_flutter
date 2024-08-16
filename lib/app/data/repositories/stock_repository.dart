import 'dart:convert';
import 'package:consumir_api_flutter/app/data/util/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';

class StockRepository {
  Future<List<StockModel>> getStocks() async {
    final response = await http.get(
      Uri.parse(apiUrlStocks),
    );

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
}
