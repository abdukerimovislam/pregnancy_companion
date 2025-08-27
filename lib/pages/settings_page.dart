import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Set Due Date"),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: state.dueDate ?? DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
              );
              if (picked != null) {
                state.setDueDate(picked);
              }
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                  title: Text("Privacy Policy"),
                  content: SingleChildScrollView(
                    child: Text("See assets/text/privacy_policy.txt"),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Terms & Conditions"),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                  title: Text("Terms & Conditions"),
                  content: SingleChildScrollView(
                    child: Text("See assets/text/terms.txt"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
