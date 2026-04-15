import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // VARIABLES
    String userName = "Ronald";
    String surname = "Adewoye";
    int score1 = 40;
    int score2 = 35;
    double score3 = 30; //30.0


    // OPERATION
    int totalScore = score1 + score2;


    // LIST
    List<String> skills = ["Flutter", "UI Design", "Problem Solving"];

    // MAP
    Map<String, String> userProfile = {
      "role": "Flutter Developer",
      "location": "Nigeria",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// VARIABLES + OPERATIONS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "User Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Name:" + " " + userName + " " + surname),
                  Text("Total Score: " + totalScore.toString()),
                ],
              ),
            ),

            /// LIST (INDEX ACCESS)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Primary Skill",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Skill: " + skills[0]),
                ],
              ),
            ),

            /// MAP (KEY ACCESS)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Profile Info",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Role: " + userProfile["role"]!),
                  Text("Location: " + userProfile["location"]!),
                ],
              ),
            ),

           // ScoreCard(title: 'title', score1: 1, score2: 10)
          ],
        ),
      ),
    );
  }
}


class ScoreCard extends StatelessWidget {
  final String title;
  final int score1;
  final int score2;

  const ScoreCard({
    super.key,
    required this.title,
    required this.score1,
    required this.score2,
  });

  @override
  Widget build(BuildContext context) {
    int totalScore = score1 + score2;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text("Score 1: $score1"),
          Text("Score 2: $score2"),
          const SizedBox(height: 8),
          Text(
            "Total: $totalScore",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}