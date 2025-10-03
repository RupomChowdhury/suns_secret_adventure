
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryIntroductionScreen extends StatefulWidget {
  final String name;
  const StoryIntroductionScreen({super.key, required this.name});

  @override
  State<StoryIntroductionScreen> createState() => _StoryIntroductionScreenState();
}

class _StoryIntroductionScreenState extends State<StoryIntroductionScreen> {
  late final List<Map<String, String>> _dialogue;

  @override
  void initState() {
    super.initState();
    _dialogue = [
      // Using double quotes to safely handle apostrophes.
      {"sender": "guide", "text": "Hi there, ${widget.name}! I'm your friendly guide to the cosmos."},
      {"sender": "guide", "text": "We're about to embark on an adventure to learn all about space weather!"},
    ];
  }

  int _currentStep = 0;

  final List<Map<String, dynamic>> _storySteps = [
    {
      'question': "What is Space Weather?",
      'answer': "Space weather refers to the conditions in space that can affect Earth and its technological systems. It's like weather on Earth, but in space!",
      // Using a valid placeholder image that exists in the project to prevent a crash.
      'image': "assets/images/solar_flare.png",
    },
    {
      'question': "Like what?",
      'answer': "For example, it can create beautiful auroras, but also interfere with compasses and even disrupt satellites!",
      // Using a valid placeholder image.
      'image': "assets/images/solar_flare.png",
    },
    {
      'question': "Let's learn more!",
      'answer': "Great! Let's head to the main dashboard to start our journey.",
      'action': (BuildContext context) => GoRouter.of(context).go('/'),
    },
  ];

  // Correct the function signature and logic to handle all parts of the story step.
  void _askQuestion(String question, String answer, String? image, Function(BuildContext)? action) {
    setState(() {
      _dialogue.add({'sender': 'user', 'text': question});
      final guideMessage = {'sender': 'guide', 'text': answer};
      if (image != null) {
        guideMessage['image'] = image;
      }
      _dialogue.add(guideMessage);
      _currentStep++;
    });

    if (action != null) {
      // Prevent crash with a delayed, mounted-aware navigation.
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          action(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A Secret Adventure!"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _dialogue.length,
              itemBuilder: (context, index) {
                final message = _dialogue[index];
                final imagePath = message['image']; // Get potential image path.

                return Align(
                  alignment: message['sender'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: message['sender'] == 'user' ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    // Display the image if it exists.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (imagePath != null) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(imagePath, fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Text(message['text']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (_currentStep < _storySteps.length)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // Call the updated function with all correct parameters.
                onPressed: () => _askQuestion(
                  _storySteps[_currentStep]['question'],
                  _storySteps[_currentStep]['answer'],
                  _storySteps[_currentStep]['image'], // Pass the image
                  _storySteps[_currentStep]['action'],  // Pass the action
                ),
                child: Text(_storySteps[_currentStep]['question']!),
              ),
            ),
        ],
      ),
    );
  }
}
