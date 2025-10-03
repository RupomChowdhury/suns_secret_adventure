
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LiveEventsScreen extends StatefulWidget {
  const LiveEventsScreen({super.key});

  @override
  State<LiveEventsScreen> createState() => _LiveEventsScreenState();
}

class _LiveEventsScreenState extends State<LiveEventsScreen> {
  Future<List<dynamic>>? _solarFlares;
  Future<List<dynamic>>? _cMEs;

  @override
  void initState() {
    super.initState();
    // NOTE: You must get your own API key from https://api.nasa.gov/
    const apiKey = "DEMO_KEY"; // Replace with your actual NASA API key
    _solarFlares = _fetchDonkiData("/FLR", apiKey);
    _cMEs = _fetchDonkiData("/CME", apiKey);
  }

  Future<List<dynamic>> _fetchDonkiData(String type, String apiKey) async {
    final response = await http.get(Uri.parse(
        'https://api.nasa.gov/DONKI/notifications?startDate=2024-05-01&endDate=2024-05-28&type=$type&api_key=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Solar Events"),
      ),
      body: ListView(
        children: [
          _buildEventsList("Solar Flares", _solarFlares, (item) => item['message'] ?? "No message"),
          _buildEventsList("Coronal Mass Ejections", _cMEs, (item) => item['message'] ?? "No message"),
        ],
      ),
    );
  }

  Widget _buildEventsList(String title, Future<List<dynamic>>? future, String Function(dynamic) itemTextExtractor) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            FutureBuilder<List<dynamic>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No recent events.');
                } else {
                  return Column(
                    children: snapshot.data!.map((item) {
                      return ListTile(
                        title: Text(itemTextExtractor(item)),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
