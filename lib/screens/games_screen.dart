
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Missions"),
      ),
      body: Row(
        children: [
          // Left Panel: Live Solar Events
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                children: [
                  const Center(child: Text("Live Solar Events", style: TextStyle(fontWeight: FontWeight.bold))),
                  _buildEventSummary("Solar Flares", "High"),
                  _buildEventSummary("CMEs", "Medium"),
                  _buildEventSummary("Radiation Storms", "Low"),
                ],
              ),
            ),
          ),
          // Right Panel: Game Map
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Placeholder for game map background
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/game_map.png"), // Placeholder
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Mission Buttons
                Positioned(
                  top: 50,
                  left: 100,
                  child: _buildMissionIconButton(context, Icons.person, "/crew_guardian_mission"),
                ),
                 Positioned(
                  top: 150,
                  left: 200,
                  child: _buildMissionIconButton(context, Icons.satellite, "/satellite_mission"),
                ),
                 Positioned(
                  bottom: 100,
                  right: 100,
                  child: _buildMissionIconButton(context, Icons.power, "/power_grid_mission"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventSummary(String title, String risk) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text("Risk: $risk"),
      ),
    );
  }

   Widget _buildMissionIconButton(BuildContext context, IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 40),
      onPressed: () => GoRouter.of(context).go(route),
    );
  }
}
