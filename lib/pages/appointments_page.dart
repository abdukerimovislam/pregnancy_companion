import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final controller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "Note"),
          ),
          ElevatedButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now().subtract(const Duration(days: 1)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: Text("Pick date: ${selectedDate.toLocal().toString().split(' ')[0]}"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                state.addAppointment(controller.text, selectedDate);
                controller.clear();
              }
            },
            child: const Text("Save"),
          ),
          Expanded(
            child: ListView(
              children: state.appointments.map((a) => ListTile(
                title: Text(a.note),
                subtitle: Text(a.date.toLocal().toString()),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
