
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NasaKidsScreen extends StatelessWidget {
  const NasaKidsScreen({super.key});

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
        title: const Text("NASA Kids' Club"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _launchUrl("https://www.nasa.gov/kidsclub/index.html"),
          child: const Text("Join the Club!"),
        ),
      ),
    );
  }
}
