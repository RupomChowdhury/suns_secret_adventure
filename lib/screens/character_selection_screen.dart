
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterSelectionScreen extends StatelessWidget {
  final String name;
  const CharacterSelectionScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Avatar"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildAvatar(context, "Explorer 1", Icons.person_outline),
          _buildAvatar(context, "Explorer 2", Icons.person_pin_circle_outlined),
          _buildAvatar(context, "Explorer 3", Icons.person_search_outlined),
          _buildAvatar(context, "Explorer 4", Icons.accessibility_new_outlined),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, String avatarName, IconData icon) {
    return InkWell(
      onTap: () {
        // In a real app, you would save the character choice.
        GoRouter.of(context).go('/story_introduction', extra: name);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(avatarName),
          ],
        ),
      ),
    );
  }
}
