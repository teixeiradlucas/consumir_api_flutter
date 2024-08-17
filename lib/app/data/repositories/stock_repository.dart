import 'dart:convert';
import 'package:consumir_api_flutter/app/data/http/http_client.dart';
import 'package:consumir_api_flutter/app/data/api_url.dart';
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';

abstract class IStockReposity {
  Future<List<StockModel>> getStocks();
}

class StockRepository extends IStockReposity {
  final IHttpClient client;

  StockRepository({required this.client});

  @override
  Future<List<StockModel>> getStocks() async {
    final response = await client.get(
      url: apiUrlStocks,
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('stocks')) {
        final stocksList = jsonResponse['stocks'] as List;
        return stocksList.map((stock) => StockModel.fromJson(stock)).toList();
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
