import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool sound = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Sound Effects'),
            subtitle: const Text('Enable/disable app sounds.'),
            value: sound,
            onChanged: (v) => setState(() => sound = v),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (v) => setState(() => darkMode = v),
          ),
          const ListTile(
            title: Text('About'),
            subtitle: Text('The Sun\'s Secret Adventure — v1.0.0'),
          ),
        ],
      ),
    );
  }
}
