
import 'dart:async';
import 'package:flutter/material.dart';

class PowerGridMission extends StatefulWidget {
  const PowerGridMission({super.key});

  @override
  State<PowerGridMission> createState() => _PowerGridMissionState();
}

class _PowerGridMissionState extends State<PowerGridMission> {
  int _missionStage = 0;
  int _rerouteSelection = -1;
  double _gridStability = 0.0;

  void _advanceMission() {
    setState(() {
      _missionStage++;
    });
  }

  void _stabilizeGrid() {
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        _gridStability += 0.15;
        if (_gridStability >= 1.0) {
          timer.cancel();
          _advanceMission();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Power Grid Mission"),
      ),
      body: _buildMissionStage(),
    );
  }

  Widget _buildMissionStage() {
    switch (_missionStage) {
      case 0:
        return _buildScenarioStage();
      case 1:
        return _buildRerouteStage();
      case 2:
        return _buildStabilizeGridStage();
      case 3:
        return _buildMissionCompleteStage();
      default:
        return const Center(child: Text("Mission Failed!"));
    }
  }

  Widget _buildScenarioStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Alert! A geomagnetic storm is about to hit the power grid!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _advanceMission,
            child: const Text("Take Action"),
          ),
        ],
      ),
    );
  }

  Widget _buildRerouteStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Reroute power to prevent overload. Choose the correct path:"),
          const SizedBox(height: 20),
          ...[0, 1, 2].map((i) => RadioListTile<int>(
            title: Text('Path ${i + 1}'),
            value: i,
            groupValue: _rerouteSelection,
            onChanged: (value) {
              setState(() {
                _rerouteSelection = value!;
              });
              // In a real game, you'd have a correct answer
              if (value == 1) {
                _advanceMission();
              }
            },
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildStabilizeGridStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Stabilize the power grid!"),
          const SizedBox(height: 20),
          LinearProgressIndicator(value: _gridStability),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _stabilizeGrid,
            child: const Text("Stabilize"),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCompleteStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Mission Complete!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Icon(Icons.power_rounded, color: Colors.green, size: 100),
          const SizedBox(height: 10),
          const Text("You've earned the Power Grid Protector badge!"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Return to Dashboard"),
          ),
        ],
      ),
    );
  }
}
