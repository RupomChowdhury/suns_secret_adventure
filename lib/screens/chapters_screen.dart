import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = List.generate(8, (i) => 'Chapter ${i + 1}: TODO title');
    return Scaffold(
      appBar: AppBar(title: const Text('Chapters')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final id = (index + 1).toString();
          return Card(
            child: ListTile(
              title: Text(chapters[index]),
              subtitle: const Text('Tap to read this part of the adventure.'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.go('/story/$id'),
            ),
          );
        },
      ),
    );
  }
}
