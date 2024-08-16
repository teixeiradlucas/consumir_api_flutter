import 'dart:convert';
import 'package:consumir_api_flutter/app/data/models/historical_model.dart';
import 'package:consumir_api_flutter/app/data/util/api_url.dart';
import 'package:http/http.dart' as http;

class HistoricalRepository {
  Future<List<HistoricalModel>> getHistoricals() async {
    final response = await http.get(
      Uri.parse(apiUrlHistoricals),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse is Map && jsonResponse.containsKey('historicals')) {
        final historicalsList = jsonResponse['historicals'] as List;
        return historicalsList
            .map((historical) => HistoricalModel.fromJson(historical))
            .toList();
      } else {
        throw Exception('Formato JSON inesperado');
      }
    } else {
      throw Exception('Falha para carregar dados');
    }
  }
}
