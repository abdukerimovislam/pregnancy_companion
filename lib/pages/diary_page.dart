import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Diary")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "Write your note..."),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                state.addDiaryEntry(controller.text);
                controller.clear();
              }
            },
            child: const Text("Add Entry"),
          ),
          Expanded(
            child: ListView(
              children: state.diary.map((d) => ListTile(
                title: Text(d.text),
                subtitle: Text(d.date.toLocal().toString()),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
