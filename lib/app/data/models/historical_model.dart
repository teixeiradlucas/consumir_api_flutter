class HistoricalModel {
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
      close: (json['close'] as num).toDouble(),
      date: json['date'] as String,
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      open: (json['open'] as num).toDouble(),
      volume: json['volume'] as int,
    );
  }
  final double close;
  final String date;
  final double high;
  final double low;
  final double open;
  final int volume;
}
