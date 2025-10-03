
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Sun's Secret Adventure"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildDashboardButton(context, "Learnings", "/learnings"),
          _buildDashboardButton(context, "Live Solar Events", "/live_events"),
          _buildDashboardButton(context, "Space Weather Missions", "/missions"),
          _buildDashboardButton(context, "Game Missions", "/games"),
          _buildDashboardButton(context, "Join NASA Kids' Club", "/nasa_kids"),
          _buildDashboardButton(context, "Feedback", "/feedback"),
        ],
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, String title, String route) {
    return Card(
      child: InkWell(
        onTap: () => GoRouter.of(context).go(route),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
