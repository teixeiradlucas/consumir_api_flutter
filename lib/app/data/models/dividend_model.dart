class DividendModel {
  final String date;
  final String type;
  final double value;

  DividendModel({
    required this.date,
    required this.type,
    required this.value,
  });

  factory DividendModel.fromJson(Map<String, dynamic> json) {
    return DividendModel(
      date: json['date'],
      type: json['type'],
      value: json['value'].toDouble(),
    );
  }
}
