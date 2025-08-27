import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  List<String> tips = [];

  @override
  void initState() {
    super.initState();
    loadTips();
  }

  Future<void> loadTips() async {
    final data = await rootBundle.loadString('assets/tips/en.json');
    final list = jsonDecode(data) as List;
    setState(() {
      tips = list.map((e) => e.toString()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tips")),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.favorite, color: Colors.pink),
          title: Text(tips[i]),
        ),
      ),
    );
  }
}

