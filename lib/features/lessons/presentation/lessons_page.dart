import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KodeKid Lessons')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _LessonCard(
            title: '1) Hello, Python! 🐍',
            description: 'Print your first message and learn the basics.',
            onTap: () => context.go('/editor'),
          ),
          _LessonCard(
            title: '2) Variables and Types',
            description: 'Meet numbers, strings, and booleans.',
            onTap: () => context.go('/editor'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Lessons'),
          NavigationDestination(icon: Icon(Icons.code), label: 'Editor'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: 0,
        onDestinationSelected: (i) {
          if (i == 1) context.go('/editor');
          if (i == 2) context.go('/profile');
        },
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard({required this.title, required this.description, required this.onTap});

  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
