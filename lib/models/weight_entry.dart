class WeightEntry {
  final DateTime date;
  final double value;

  WeightEntry(this.date, this.value);

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "value": value,
  };

  factory WeightEntry.fromJson(Map<String, dynamic> json) {
    return WeightEntry(DateTime.parse(json["date"]), json["value"]);
  }
}
