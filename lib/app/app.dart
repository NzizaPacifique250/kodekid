import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/lessons/presentation/lessons_page.dart';
import '../features/code_editor/presentation/editor_page.dart';
import '../features/profile/presentation/profile_page.dart';

class KodeKidApp extends StatelessWidget {
  const KodeKidApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorSchemeSeed: const Color(0xFF5B8DEF),
      brightness: Brightness.light,
      textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
    );

    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (ctx, st) => const LessonsPage()),
        GoRoute(path: '/editor', builder: (ctx, st) => const EditorPage()),
        GoRoute(path: '/profile', builder: (ctx, st) => const ProfilePage()),
      ],
    );

    return MaterialApp.router(
      title: 'KodeKid',
      theme: theme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
