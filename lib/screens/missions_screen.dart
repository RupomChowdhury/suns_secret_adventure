
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Space Weather Missions"),
      ),
      body: ListView(
        children: [
          _buildMissionCard(
            "Parker Solar Probe",
            "The Parker Solar Probe is a NASA mission to study the Sun's outer corona.",
            "assets/images/parker_probe.png",
            "https://www.nasa.gov/solar-probe/",
          ),
          _buildMissionCard(
            "NASA Heliophysics",
            "Heliophysics is the study of the Sun and its effects on the solar system.",
            "assets/images/heliophysics.png",
            "https://science.nasa.gov/heliophysics/",
          ),
          _buildMissionCard(
            "CubeSat Mission",
            "CubeSats are small satellites used for space research.",
            "assets/images/cubesat.png",
            "https://www.nasa.gov/mission_pages/cubesats/index.html",
          ),
          _buildMissionCard(
            "HERMES Mission",
            "The HERMES mission will study the processes that drive space weather.",
            "assets/images/hermes.png",
            "https://blogs.nasa.gov/hermes/",
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard(String title, String description, String imagePath, String url) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imagePath, height: 150), // Placeholder
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description),
            ),
            ElevatedButton(
              onPressed: () => _launchUrl(url),
              child: const Text("Learn More"),
            ),
          ],
        ),
      ),
    );
  }
}
