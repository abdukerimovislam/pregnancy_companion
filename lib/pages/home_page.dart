import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome, Mom-to-be 💖", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            if (state.dueDate != null)
              Text("Due date: ${state.dueDate!.toLocal().toString().split(' ')[0]}")
            else
              const Text("Set your due date in Settings"),
            const SizedBox(height: 20),
            if (state.weights.isNotEmpty)
              Text("Last weight: ${state.weights.last.value} kg")
            else
              const Text("No weight data yet"),
          ],
        ),
      ),
    );
  }
}
