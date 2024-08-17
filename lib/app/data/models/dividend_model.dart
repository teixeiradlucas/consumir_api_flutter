class DividendModel {
  DividendModel({
    required this.date,
    required this.type,
    required this.value,
  });

  factory DividendModel.fromJson(Map<String, dynamic> json) {
    return DividendModel(
      date: json['date'] as String,
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
    );
  }
  final String date;
  final String type;
  final double value;
}
