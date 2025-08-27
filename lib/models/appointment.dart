class Appointment {
  final DateTime date;
  final String note;

  Appointment(this.date, this.note);

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "note": note,
  };

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(DateTime.parse(json["date"]), json["note"]);
  }
}
