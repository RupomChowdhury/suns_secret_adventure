
import 'dart:async';
import 'package:flutter/material.dart';

class SatelliteMission extends StatefulWidget {
  const SatelliteMission({super.key});

  @override
  State<SatelliteMission> createState() => _SatelliteMissionState();
}

class _SatelliteMissionState extends State<SatelliteMission> {
  int _missionStage = 0;
  bool _isSatelliteRepositioned = false;
  double _shieldPower = 0.0;

  void _advanceMission() {
    setState(() {
      _missionStage++;
    });
  }

  void _chargeShields() {
    setState(() {
      _shieldPower += 0.25;
      if (_shieldPower >= 1.0) {
        _advanceMission();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Satellite Mission"),
      ),
      body: _buildMissionStage(),
    );
  }

  Widget _buildMissionStage() {
    switch (_missionStage) {
      case 0:
        return _buildScenarioStage();
      case 1:
        return _buildRepositionStage();
      case 2:
        return _buildShieldStage();
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
            "Alert! A satellite is in the path of a solar flare!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _advanceMission,
            child: const Text("Begin Maneuvers"),
          ),
        ],
      ),
    );
  }

  Widget _buildRepositionStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Reposition the satellite to a safer orbit."),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Draggable<String>(
                data: "satellite",
                feedback: const Icon(Icons.satellite, size: 50, color: Colors.blue),
                childWhenDragging: const Icon(Icons.satellite, size: 50, color: Colors.grey),
                child: const Icon(Icons.satellite, size: 50, color: Colors.blue),
              ),
              DragTarget<String>(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _isSatelliteRepositioned ? Colors.green.withOpacity(0.5) : Colors.red.withOpacity(0.5),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(child: Text("Safe Zone")),
                  );
                },
                onWillAccept: (data) => data == "satellite",
                onAccept: (data) {
                  setState(() {
                    _isSatelliteRepositioned = true;
                  });
                  _advanceMission();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShieldStage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Activate the satellite's shields!"),
          const SizedBox(height: 20),
          LinearProgressIndicator(value: _shieldPower),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _chargeShields,
            child: const Text("Activate Shields"),
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
          const Icon(Icons.satellite_alt, color: Colors.green, size: 100),
          const SizedBox(height: 10),
          const Text("You've earned the Satellite Savior badge!"),
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
