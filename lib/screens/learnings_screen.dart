
import 'package:flutter/material.dart';

class LearningsScreen extends StatelessWidget {
  const LearningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learnings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildLearningCard(
            "The Binocs Show: Space Weather",
            "assets/images/binocs_show_placeholder.png",
            "An animated educational video that explains the science behind space weather in detail.",
          ),
          _buildLearningCard(
            "What is Plasma?",
            null,
            "The Sun isn't a solid ball of fire but an 'ocean' of plasma, which is made of positively charged ions and negatively charged electrons.",
          ),
          _buildLearningCard(
            "The Sun's Magnetic Field",
            "assets/images/magnetic_field_placeholder.png",
            "The movement of charged particles in the plasma creates the Sun's powerful magnetic field (the dynamo effect).",
          ),
          _buildLearningCard(
            "Solar Storms",
            "assets/images/solar_storm_placeholder.png",
            "When the Sun's magnetic fields get twisted, they store energy. The 'snap' of these fields releases energy as solar flares and Coronal Mass Ejections (CMEs).",
          ),
          _buildLearningCard(
            "Earth's Protection",
            "assets/images/magnetosphere_placeholder.png",
            "Earth's magnetic field (magnetosphere) protects us and channels particles to the poles, creating auroras.",
          ),
          _buildLearningCard(
            "Geomagnetic Storms",
            null,
            "A powerful CME can compress and stretch the magnetosphere, leading to a geomagnetic storm that can impact technology like power grids and communication systems.",
          ),
          _buildTriviaCard(
            "Trivia Time!",
            [
              "The Solar Storm of 2012 was a massive solar storm that narrowly missed Earth.",
              "The Carrington Event in 1859 was the most intense geomagnetic storm in recorded history, causing telegraph systems to fail.",
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLearningCard(String title, String? imagePath, String description) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (imagePath != null) ...[
              Center(
                child: Image.asset(
                  imagePath,
                  height: 150,
                  // In a real app, you would handle image loading errors
                ),
              ),
              const SizedBox(height: 10),
            ],
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTriviaCard(String title, List<String> triviaItems) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...triviaItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
