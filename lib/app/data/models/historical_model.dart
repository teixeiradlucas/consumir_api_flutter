class HistoricalModel {
  final double close;
  final String date;
  final double high;
  final double low;
  final double open;
  final int volume;

  HistoricalModel({
    required this.close,
    required this.date,
    required this.high,
    required this.low,
    required this.open,
    required this.volume,
  });

  factory HistoricalModel.fromJson(Map<String, dynamic> json) {
    return HistoricalModel(
      close: json['close'].toDouble(),
      date: json['date'],
      high: json['high'].toDouble(),
      low: json['low'].toDouble(),
      open: json['open'].toDouble(),
      volume: json['volume'],
    );
  }
}
