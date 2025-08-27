import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../models/weight_entry.dart';
import '../models/diary_entry.dart';
import '../services/storage_service.dart';

class AppState extends ChangeNotifier {
  DateTime? dueDate;
  List<WeightEntry> weights = [];
  List<Appointment> appointments = [];
  List<DiaryEntry> diary = [];

  Future<void> loadFromStorage() async {
    dueDate = await StorageService.loadDueDate();
    weights = await StorageService.loadWeights();
    appointments = await StorageService.loadAppointments();
    diary = await StorageService.loadDiary();
    notifyListeners();
  }

  void setDueDate(DateTime date) {
    dueDate = date;
    StorageService.saveDueDate(date);
    notifyListeners();
  }

  void addWeight(double value) {
    final entry = WeightEntry(DateTime.now(), value);
    weights.add(entry);
    StorageService.saveWeights(weights);
    notifyListeners();
  }

  void addAppointment(String note, DateTime date) {
    appointments.add(Appointment(date, note));
    StorageService.saveAppointments(appointments);
    notifyListeners();
  }

  void addDiaryEntry(String text) {
    diary.add(DiaryEntry(DateTime.now(), text));
    StorageService.saveDiary(diary);
    notifyListeners();
  }
}
