import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int current = 0;
  int score = 0;

  final questions = const [
    {
      'q': 'What does the Sun do at dawn in our story?',
      'options': ['Yawns', 'Sings', 'Sleeps'],
      'answer': 0,
    },
    {
      'q': 'Who is the Sun\'s first friend?',
      'options': ['Cloud', 'Moon', 'Tree'],
      'answer': 1,
    },
  ];

  void _select(int idx) {
    final correct = questions[current]['answer'] as int;
    if (idx == correct) score++;
    if (current < questions.length - 1) {
      setState(() => current++);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Complete'),
          content: Text('Your score: $score / ${questions.length}'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[current];
    final opts = (q['options'] as List<String>);
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: (current + 1) / questions.length),
            const SizedBox(height: 20),
            Text(q['q'] as String, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            ...List.generate(opts.length, (i) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: OutlinedButton(
                onPressed: () => _select(i),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(opts[i]),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
