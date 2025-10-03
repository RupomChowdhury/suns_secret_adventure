import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required this.chapterId});
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final paragraphs = List.generate(
      5,
      (i) => 'Chapter $chapterId — Paragraph ${i + 1}: Replace with content from Figma. '
          'Keep sentences short for readability and use illustrations where needed.',
    );

    return Scaffold(
      appBar: AppBar(title: Text('Story — Chapter $chapterId')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('The Sun\'s Secret Adventure', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          ...paragraphs.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(p, style: Theme.of(context).textTheme.bodyLarge),
              )),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Mark as Read'),
          ),
        ],
      ),
    );
  }
}
