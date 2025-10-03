
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Explorer!"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("What is your name?"),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(height: 20),
              const Text("How old are you?"),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  hintText: "Enter your age",
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.isNotEmpty ? _nameController.text : "Explorer";
                  GoRouter.of(context).go('/character_selection', extra: name);
                },
                child: const Text("Let's Go!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
