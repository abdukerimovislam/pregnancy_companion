class DiaryEntry {
  final DateTime date;
  final String text;

  DiaryEntry(this.date, this.text);

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "text": text,
  };

  factory DiaryEntry.fromJson(Map<String, dynamic> json) {
    return DiaryEntry(DateTime.parse(json["date"]), json["text"]);
  }
}
