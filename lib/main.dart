import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/app_state.dart';
import 'pages/home_page.dart';
import 'pages/tracker_page.dart';
import 'pages/tips_page.dart';
import 'pages/appointments_page.dart';
import 'pages/diary_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState()..loadFromStorage(),
      child: const PregnancyCompanionApp(),
    ),
  );
}

class PregnancyCompanionApp extends StatefulWidget {
  const PregnancyCompanionApp({super.key});

  @override
  State<PregnancyCompanionApp> createState() => _PregnancyCompanionAppState();
}

class _PregnancyCompanionAppState extends State<PregnancyCompanionApp> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const TrackerPage(),
    const TipsPage(),
    const AppointmentsPage(),
    const DiaryPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy Companion',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.monitor_weight), label: "Tracker"),
            NavigationDestination(icon: Icon(Icons.menu_book), label: "Tips"),
            NavigationDestination(icon: Icon(Icons.calendar_month), label: "Visits"),
            NavigationDestination(icon: Icon(Icons.book), label: "Diary"),
            NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
