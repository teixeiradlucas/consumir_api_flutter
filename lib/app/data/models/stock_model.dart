class StockModel {
  StockModel({
    required this.ticket,
    required this.name,
    required this.sector,
    required this.value,
    required this.dividendYield,
    required this.lastYearHigh,
    required this.lastYearLow,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      ticket: json['symbol'] as String,
      name: json['name'] as String,
      sector: json['sector'] as String,
      value: (json['lastPrice'] as num).toDouble(),
      dividendYield: (json['dividendYield'] as num).toDouble(),
      lastYearHigh: (json['lastYearHigh'] as num).toDouble(),
      lastYearLow: (json['lastYearLow'] as num).toDouble(),
    );
  }

  final String ticket;
  final String name;
  final String sector;
  final double value;
  final double dividendYield;
  final double lastYearHigh;
  final double lastYearLow;
}
