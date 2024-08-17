import 'package:consumir_api_flutter/app/data/http/http_client.dart';
import 'package:consumir_api_flutter/app/data/models/stock_model.dart';
import 'package:consumir_api_flutter/app/data/repositories/stock_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = StockRepository(client: HttpClient());
    return Scaffold(
      appBar: AppBar(title: const Text('Stocks')),
      body: FutureBuilder<List<StockModel>>(
        future: repository.getStocks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError) {
            return _buildError(snapshot.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildNoData();
          } else {
            return _buildList(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(Object? error) {
    return Center(child: Text('Error: $error'));
  }

  Widget _buildNoData() {
    return const Center(child: Text('No stocks found'));
  }

  Widget _buildList(List<StockModel> stocks) {
    final filteredStocks = stocks
        .where((stock) => stock.name.isNotEmpty && stock.value != 0)
        .toList();

    return ListView.builder(
      itemCount: filteredStocks.length,
      itemBuilder: (context, index) {
        final stock = filteredStocks[index];
        return ListTile(
          leading: const Icon(Icons.trending_up),
          title: Text(stock.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Value: ${stock.value}'),
              Text('Dividend Yield: ${stock.dividendYield}%'),
              Text('Sector: ${stock.sector}'),
            ],
          ),
          trailing: Text(stock.ticket),
        );
      },
    );
  }
}
