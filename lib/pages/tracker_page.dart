import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Weight Tracker")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Enter weight (kg)"),
          ),
          ElevatedButton(
            onPressed: () {
              final val = double.tryParse(controller.text);
              if (val != null) {
                state.addWeight(val);
                controller.clear();
              }
            },
            child: const Text("Save"),
          ),
          Expanded(
            child: ListView(
              children: state.weights.map((w) => ListTile(
                title: Text("${w.value} kg"),
                subtitle: Text(w.date.toLocal().toString()),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
