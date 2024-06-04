import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = [
    {'name': 'Alice', 'score': 90},
    {'name': 'Bob', 'score': 85},
    {'name': 'Charlie', 'score': 80},
    // Add more sample data or fetch from a database
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          final entry = leaderboard[index];
          return ListTile(
            title: Text(entry['name']),
            trailing: Text(entry['score'].toString()),
          );
        },
      ),
    );
  }
}
