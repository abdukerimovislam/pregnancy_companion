import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/appointment.dart';
import '../models/weight_entry.dart';
import '../models/diary_entry.dart';

class StorageService {
  static Future<void> saveDueDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("dueDate", date.toIso8601String());
  }

  static Future<DateTime?> loadDueDate() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString("dueDate");
    if (str == null) return null;
    return DateTime.tryParse(str);
  }

  static Future<void> saveWeights(List<WeightEntry> list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("weights", jsonEncode(list.map((e) => e.toJson()).toList()));
  }

  static Future<List<WeightEntry>> loadWeights() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString("weights");
    if (str == null) return [];
    final List data = jsonDecode(str);
    return data.map((e) => WeightEntry.fromJson(e)).toList();
  }

  static Future<void> saveAppointments(List<Appointment> list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("appointments", jsonEncode(list.map((e) => e.toJson()).toList()));
  }

  static Future<List<Appointment>> loadAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString("appointments");
    if (str == null) return [];
    final List data = jsonDecode(str);
    return data.map((e) => Appointment.fromJson(e)).toList();
  }

  static Future<void> saveDiary(List<DiaryEntry> list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("diary", jsonEncode(list.map((e) => e.toJson()).toList()));
  }

  static Future<List<DiaryEntry>> loadDiary() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString("diary");
    if (str == null) return [];
    final List data = jsonDecode(str);
    return data.map((e) => DiaryEntry.fromJson(e)).toList();
  }
}
