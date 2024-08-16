import 'dart:convert';
import 'package:consumir_api_flutter/app/data/util/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';

abstract class IStockRepository {
  Future<List<StockModel>> getStocks(String url);
}

class StockRepository implements IStockRepository {
  @override
  Future<List<StockModel>> getStocks(String url) async {
    final response = await http.get(
      Uri.parse(url),
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

class StockService {
  Future<List<StockModel>> getStocks() =>
      StockRepository().getStocks(apiUrlStocks);
  Future<List<StockModel>> getStockHistory() =>
      StockRepository().getStocks(apiUrlHistoricals);
  Future<List<StockModel>> getStockDividends() =>
      StockRepository().getStocks(apiUrlDividends);
}
