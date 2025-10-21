import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Badges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              Chip(label: Text('Starter ✨')),
              Chip(label: Text('Loop Hero 🔁')),
              Chip(label: Text('Bug Squasher 🐞')),
            ]),
          ],
        ),
      ),
    );
  }
}
